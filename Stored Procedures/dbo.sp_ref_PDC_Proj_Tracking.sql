SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE  [dbo].[sp_ref_PDC_Proj_Tracking] AS


---- =============================================
----Author: Newell, R / Sexton, C
----Date: 2021-05-07
----Purpose: Create a table containing all Project Part Details.  PNs are can be associated with multiple projects, when this is the case,
----it is necessary to determine which project is scheduled to go to production first and use that project's implementation as the date a part
----is needed at the PDC.  One exception to this rule is if a part is released as a replacing part, it's need date should be equal to the part's
----PDC Part Master Origin Dt.
----Last modified date:
----Modification notes: 
---- =============================================
---2021-06-30 Added the following to limit results to parts with current PDC Distributiom to section on ppd AS  
-------JOIN [dbo].[eng_PDC_Part] d
-------ON u.[PN]=d.[PN]
---2022-01-07 Revised table name references. Changed table name from eng_PDC_Part_Dist to eng_PDC_Part
---2022-08-05 Replaced cp, tpp, pd1, ppd1 and r with #cp, #tpp, #pd1, #ppd1 and #r respectively



--***********************************
--Cleanup Tables
--***********************************

TRUNCATE TABLE [dbo].[ref_PDC_Part_Vend_Dt];
TRUNCATE TABLE [dbo].[ref_PDC_Part_1st_Proj_Impl_Dt];
TRUNCATE TABLE [dbo].[ref_PDC_Proj_Tracking];

IF OBJECT_ID(N'tempdb..#cp') IS NOT NULL
BEGIN
DROP TABLE #cp
END;

IF OBJECT_ID(N'tempdb..#tpp') IS NOT NULL
BEGIN
DROP TABLE #tpp
END;

IF OBJECT_ID(N'tempdb..#pd1') IS NOT NULL
BEGIN
DROP TABLE #pd1
END;

IF OBJECT_ID(N'tempdb..#ppd1') IS NOT NULL
BEGIN
DROP TABLE #ppd1
END;

IF OBJECT_ID(N'tempdb..#r') IS NOT NULL
BEGIN
DROP TABLE #r
END;


---- =============================================
--Part I
---- =============================================

--Gets the Min Purchasing NPRS Vend Dt for PDC Part Master PNs for populating [dbo].[ref_PDC_Part_Vend_Dt]
--[dbo].[ref_PDC_Part_Vend_Dt] contains the minimum Vend_Dt available for a PN in [dbo].[pdc_NP_Vendor_Part_Number].
WITH c AS
(
SELECT DISTINCT [Part_Number] AS PN
      ,MIN([Vend_Date]) AS Vend_Date
  FROM pdc_NP_Vendor_Part_Number
    WHERE[Currency_Code]='USD'
  GROUP BY [Part_Number], [Currency_Code]
)
----Gets the PNs which have PDC quotes.
, q AS
(
SELECT DISTINCT [Part_No] AS PN
  FROM pdc_EOQ
    WHERE [PLANT_CODE]='014' AND  Vend_Code <> '14599'
	GROUP BY [Part_No]
)
INSERT INTO ref_PDC_Part_Vend_Dt
SELECT c.[PN]
      ,CASE
		WHEN [Vend_Date]<'0' 
		OR [Vend_Date] Like '%'+'[A-Z]'+'%'
		OR LEFT([Vend_Date],4)<'1950'
		OR RIGHT(LEFT([Vend_Date],6),2)<'01'
		OR RIGHT(LEFT([Vend_Date],6),2)>'12'
		OR RIGHT([Vend_Date],2)<'01'
		OR RIGHT([Vend_Date],2)>'31'
		OR (RIGHT([Vend_Date],2)>'30' AND (RIGHT(LEFT([Vend_Date],6),2)='04' OR RIGHT(LEFT([Vend_Date],6),2)='06' OR RIGHT(LEFT([Vend_Date],6),2)='09' OR RIGHT(LEFT([Vend_Date],6),2)='11'))
		THEN NULL		
		WHEN LEFT([Vend_Date],4)>='1950' 
		AND RIGHT(LEFT([Vend_Date],6),2)='02' 
		AND RIGHT([Vend_Date],2)>'28'
	    THEN LEFT([Vend_Date],4)+'-'+RIGHT(LEFT([Vend_Date],6),2)+'-'+'28'
		ELSE LEFT([Vend_Date],4)+'-'+RIGHT(LEFT([Vend_Date],6),2)+'-'+RIGHT([Vend_Date],2)
		END AS Vend_Dt
	  ,[Vend_Date]
  FROM c
  LEFT JOIN q
  ON c.[PN]=q.[PN]
  WHERE q.[PN] IS NULL;

---- =============================================
--Part II
---- =============================================

----Gets all PDC tracked projects.
--WITH cp AS
(
SELECT Proj
      ,[Desc]
      ,Track
      ,Cmpl
      ,RG_Type
      ,Gate
      ,Rel_Dt 
      ,Impl_Dt
  INTO #cp
  FROM dbo.ref_PDC_Proj_Master
  WHERE Track='Y'
)
;
--
--Gets all PDC distributed SPNs on PDC tracked projects (some records do not have Impl_Dt values).
--, tpp AS
(
SELECT u.Proj
	  ,u.PN AS SPN
	  ,#cp.Impl_Dt
	  ,#cp.Rel_Dt AS RelDt
INTO #tpp
FROM #cp
JOIN dbo.eng_PN_Proj_XRef_Unique u
ON #cp.Proj=u.Proj
WHERE u.PN IN (SELECT [PN] FROM [dbo].[eng_PDC_Part])
)
;
----Gets earliest project implementation date for each PDC distributed SPN on PDC tracked projects.
--, pd1 AS
(
SELECT SPN
      ,MIN(Impl_Dt) AS ImplDt
  INTO #pd1
  FROM #tpp
  GROUP BY SPN
)
;
----Gets earliest project implementation date and corresponding project for each PDC distributed SPN on PDC tracked projects.
--, ppd1 AS
(
SELECT #tpp.SPN
	  ,#tpp.Proj
	  ,#pd1.ImplDt
	  ,#tpp.RelDt
  INTO #ppd1
  FROM #tpp
  JOIN #pd1
  ON #tpp.SPN=#pd1.SPN AND #tpp.Impl_Dt=#pd1.ImplDt
)
;
----Gets New Replacing Parts (Parts that are Replacing Parts at Release).
----These Parts reqire Need Dates equal to their their PDC origin date.
--, r AS
(
SELECT e.ECN
	  ,e.ADM_Appr_Dt
      ,t.Key_1 AS Canceled_PN
      ,t.PN As Rplcing_PN
	  ,p.Rel_Dt AS Rplcing_PN_Rel_Dt
  INTO #r
  FROM dbo.eng_ECN e
  JOIN dbo.eng_ECN_Part_Tran t
  ON e.ECN=t.ECN
  JOIN dbo.eng_Part_Master p
  ON t.PN=p.PN
  WHERE t.[Type]='PM' AND t.[Tran]='CAN' AND e.ADM_Appr_Dt=p.Rel_Dt
)
;
----Gets depot formatted PNs for CORE_PNs (aka SPNs). 
WITH x AS
--, x AS
(
SELECT DISTINCT [CORE_PN] AS SPN
      ,[PNAS400Fmt] AS AMPN
  FROM [dbo].[ref_CORE_PN_XRef]
)
----Gets AMPNs for SPN and Project and determines if SPN is a New Replacing part at release.
INSERT INTO dbo.ref_pdc_Part_1st_Proj_Impl_Dt 
SELECT #tpp.SPN
      ,x.AMPN
	  ,#tpp.Proj
	  ,ImplDt
	  ,#tpp.RelDt
	  ,CASE
	  	  WHEN #r.Rplcing_PN ='' OR #r.Rplcing_PN IS NULL
		  THEN 'N'
		  ELSE 'Y'
		  END AS NewRplcng
  FROM #tpp
  LEFT JOIN #ppd1
  ON #tpp.SPN=#ppd1.SPN
  LEFT JOIN x
  ON #tpp.SPN=x.SPN
  LEFT JOIN #r
  ON #tpp.SPN=Rplcing_PN
  WHERE x.SPN IS NOT NULL;
--2022-08-05 Removed the following DROP statements:
--DROP TABLE dbo.cp;
--DROP TABLE dbo.tpp;
--DROP TABLE dbo.pd1;
--DROP TABLE dbo.ppd1;
--DROP TABLE dbo.r;

---- =============================================
--Part III
---- =============================================

----Gets the NPRS vendor for the Min Purchasing NPRS Vend Dt.
WITH vd AS
(
SELECT [PN]
      ,[Vend_Dt]
	  ,[Vend_Date]
  FROM [dbo].[ref_PDC_Part_Vend_Dt]
)
, v AS
(
SELECT vd.[PN]
      ,MIN(prsv.[Vendor_Code]) AS PRS_Vend
	  ,vd.[Vend_Dt]
	  ,vd.[Vend_Date]
FROM pdc_NP_Vendor_Part_Number prsv
JOIN vd
ON prsv.[Part_Number]=vd.[PN] AND prsv.[Vend_Date]=vd.[Vend_Date]
GROUP BY vd.[PN]
        ,vd.[Vend_Dt]
		,vd.[Vend_Date]
)

----Gets PN - AMPN - 1st Project - Project Implementation Date - New or Replacing Flag.
, p AS
(
SELECT [SPN]
      ,[AMPN]
	  ,[Proj]
	  ,[ImplDt]
	  ,[RelDt]
	  ,[NewRplcng]
  FROM [dbo].[ref_pdc_Part_1st_Proj_Impl_Dt]
)
----If New_Rplcng='Y', and the part has never been received, the SlsDt and NeedDt should equal the OriginDt.
----The table below should be used in Need Dt audits.
INSERT INTO [dbo].[ref_PDC_Proj_Tracking]
  SELECT DISTINCT p.[Proj]
      ,[IA_Code] AS [IA]
	  ,p.[SPN] AS SetID
	  ,[AMPN] AS PN
      ,[Desc]
	  ,[Set_Alpha] AS SetAlpha
	  ,[NewRplcng]
      ,[Set_Lst_Rcpt_Dt] AS SetLstRcptDt
      ,[OC]
      ,[SC]
	  ,[ImplDt] AS [ProjImplDt]
	  ,[RelDt] AS [ProjRelDt]
      ,CASE
	     WHEN [Set_Lst_Rcpt_Dt] IS NOT NULL
		 THEN NULL
		 WHEN [Set_Lst_Rcpt_Dt] IS NULL AND [NewRplcng]='Y' AND [Origin_Dt] IS NOT NULL
		 THEN [Origin_Dt]
		 ELSE [ImplDt]
		 END AS [NeedDt] 
      ,[SLS_Dt] AS SlsDt
	  ,[Vend_Dt] AS VendDt
      ,[Origin_Dt] AS OriginDt
      ,[RSTag]
      ,[DS] AS DSTg
      ,[Set_SOH] AS SetSOH
      ,[Set_PreRcpt] AS SetPreRcpt
      ,[Set_OO] AS SetOO
	  ,[Set_BO] AS SetBO
      ,[Set_SS] AS SetSS
      ,[Set_Mo_Av] AS SetMoAv
      ,[Set_Ld_Time] AS SetLdTime
	  ,[Combi]
	  ,[Set_Vend] AS [SetVC]
	  ,[PRS_Vend] AS PRSVend
	  ,[Vend_Name] AS Vendor
	  ,[Buyer_Code] AS [Byr]
      ,[StdCst]
	  ,[Set_12_Mo_LE] AS Set12MoLE
      ,[Set_12_Mo_LF] AS Set12MoLF
	  ,[Set_MTD_LE] AS SetMTDLE
      ,[Set_MTD_LF] AS SetMTDLF
      ,[Inact_Dt] AS InactDt
	  ,[PO_No] AS [1stPO]
	  ,[PO_Date] AS [1stPODueDate]
	  ,[Confirm_Code] AS [1stPOConfCd]
	  ,[Req_Date] AS [1stPOReqDate]
	  ,[Open_Order_Qty] AS [1stPOOpenOrderQty]
	  ,[Pre_Reciept_Date] AS [1stPOPreRcptDate]
	  ,[Pre_Reciept_Qty] AS [1stPOPreRcptQty]
	  ,[Tot_Pre_Receipt_Qty] AS [TotPOPreRcptQty]
  FROM p
  LEFT JOIN
  dbo.ref_PDC_Part_Set_Detail sd
  ON p.[AMPN]=sd.[PN]
  LEFT JOIN v
  ON p.[AMPN]=v.[PN]
  LEFT JOIN [dbo].[ref_PDC_Part_1st_Due_PO] po
  ON p.[AMPN]=po.[Part_No]
  LEFT JOIN pdc_Vendor n
  ON sd.[Set_Vend]=n.[Vend_Code]



GO
