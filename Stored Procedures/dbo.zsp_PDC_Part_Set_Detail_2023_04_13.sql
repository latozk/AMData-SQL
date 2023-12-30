SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



--exec sp_pdc_part_set_detail 

CREATE PROCEDURE [dbo].[zsp_PDC_Part_Set_Detail_2023_04_13]  AS

EXEC sp_PDC_Part_Final_Replacement;

TRUNCATE TABLE ref_pdc_Part_Set_Detail;


---- =============================================
----Author: Newell, R
----Date: 2020-04-13
----Purpose: Create a table containing all Part Master PNs with cross PNs derived from shared PQs while including part set details.
----Last modified date:
----Modification notes: 
----2020-05-21 Added PreRcpt, X_PreRcpt and Set_PreRcpt 
----2021-02-11 Added RS Tag, DS Tag, NS Cd, Prime Class, Prime Type, Std Cost, Dlr Net, Order Point, EOQ, Contact Vendro, Ord Control and Status Code for PN and XPN
----2021-02-24 Added Vend, Origin_Dt, Inact_Dt and SLS_Dt, X_Vend, X_Origin_Dt, X_Inact_Dt and X_SLS_Dt and revised inactive part master resource tag in ", pm AS" section
----2021-04-05 Added Part_Type and X_Part_Type
----2021-06-17 Added Inplt_Src, New_Rep, X_Inplt_Src and X_New_Rep
----2021-07-22 Added InspTag and X_InspTag
----2021-08-20 Added PkgCd, PkgQty, X_PkgCd and X_PkgQty
----2021-12-14 12_Mo_Usage wasn't being summed for S and I parts.  Changes made to get sum of 12_Mo_Usage
----2022-06-15 Changed Join field in "With f" query to be Non_S_PN (was on S_Part).  S_Part details from the "With s" query are only needed for non S PNs.
----2023-01-31 Changed the way Set_SS is captured
----2023-03-24 Added Distinct to the 'V As' query - was causing duplicate PN-X_PN records. 
---- =============================================



----Sums all pre-receipt quantities for PN.
WITH pr AS
(
SELECT [Part_No]
      ,SUM([Pre_Reciept_Qty]) AS PreRcpt
  FROM [dbo].[pdc_Open_Order_Part]
  GROUP BY [Part_No]
)
----Gets all PDC PN Detail.


, pm AS
(
SELECT p.[Part_No]
      ,[Part_Desc]
      ,[On_Ord_Qty]
      ,[BO_Qty]
      ,[Comm_Qty]
      ,[Ord_Cntl]
      ,[Lead_Time]
      ,[__Mo_Trans]
      ,[Mo_Avg]
      ,[Ord_Point]
      ,[Comb_Purch_Code]
      ,[Vend_Code]
	  --Added Contact Vendor, RS Tag, DS Tag, NS Cd, Prime Class, Prime Type, Std Cost, Dlr Net, Cns Lst and EOQ on 2021-02-11
	  --Added Part_Type on 2021-04-05
	  ,[Contact_Vend]
	  --Added Inplt_Src and New_Rep_Tag on 2021-06-17
	  ,[New_Rep_Tag]
	  ,[Inplt_Src]
	  --Added Inspect_Code on 2021-07-22
	  ,[Inspect_Code]
	  ,[Re_Sourcing_Tag]
	  ,[DS_Tag]
	  ,[Non_Stk_Code] -- nscd
	  ,[Prm_Prod_Class]  --prdcls 
	  ,[Prm_Prod_Type] 
	  ,[Std_Cost] --stdcst 
	  ,[Dlr_Net] --dlrnet 
	  ,[Cons_List] --cnslst 
	  ,[EOQ] --eoq
	  ,[Pkg_Qty] --PkgQty on 2021-08-20
	  ,[Package_Code] --PkgCd on 2021-08-20
	  ,[Part_Type]
      ,[SOH]
	  ,pr.[PreRcpt]
      ,ISNULL([Item_12_Mo_Dlr_Usg],0)+ISNULL([Item_12_Mo_IC_Usg],0) AS [12_Mo_Item_Usg]
      ,ISNULL([Item_12_Mo_Ord],0) AS [12_Mo_Item_Trans]
      ,ISNULL([Comb_12_Mo_Dlr_Usg],0)+ISNULL([Comb_12_Mo_IC_Usg],0) AS [12_Mo_Comb_Usg]
      ,ISNULL([Comb_12_Mo_Ord],0) AS [12_Mo_Comb_Trans]
      ,[Commodity]
      ,[MTD_Line_Ent]
      ,[MTD_Line_Ship]
      ,[_2_Mo_Line_Ent]
      ,[_2_Mo_Line_Ship]
      ,[_2_Mo_Stk_Out]
      ,[Status_Code]
      ,[Alpha]
      ,[Origin_Dt]
      ,[Inact_Dt]
      ,[Last_Rcpt_Dt]
      ,[Last_Tran_Dt]
      ,[SLS_Avail_Dt]
  FROM [dbo].[pdc_Part_Master] p
  LEFT JOIN pr 
  ON p.[Part_No]=pr.[Part_No]
  --Where p.Part_No=' 2039091'
		-- or p.Part_No='S00813225   '
		-- or p.Part_No='S00813220005'
		-- or p.Part_No='Y00813220005'
		-- or p.Part_No='Y506993502 '
		-- or p.Part_No=' 2039091    '
UNION ALL 
SELECT p.[Part_No]
      ,[Part_Desc]
      ,[On_Ord_Qty]
      ,[BO_Qty]
      ,[Comm_Qty]
      ,[Ord_Cntl]
      ,[Lead_Time]
      ,[__Mo_Trans]
      ,[Mo_Avg]
      ,[Ord_Point]
      ,[Comb_Purch_Code]
      ,[Vend_Code]
	  --Added Contact Vendor, RS Tag, DS Tag, NS Cd, Prime Class, Prime Type, Std Cost, Dlr Net, Cns Lst and EOQ on 2021-02-11
	  --Added Part_Type on on 2021-04-05
	  ,[Contact_Vend]
	  --Added Inplt_Src and New_Rep_Tag on 2021-06-17
	  ,[New_Rep_Tag]
	  ,[Inplt_Src]
	  	  --Added Inspect_Code on 2021-07-22
	  ,' ' AS [Inspect_Code]
	  -- Revised line below, was "' ' AS Re_Sourcing_Tag" on 2021-02-24
	  ,[Re_Source_Tag] AS Re_Sourcing_Tag
	  ,[DS_Tag]
	  ,[Non_Stk_Code]
	  ,[Prm_Prod_Class]
	  ,[Prm_Prod_Type]
	  ,[Std_Cost]
	  ,[Dlr_Net]
	  ,[Cons_List]
	  ,[EOQ]
	  ,[Pkg_Qty] --PkgQty on 2021-08-20
	  ,[Package_Code] --PkgCd on 2021-08-20
	  ,[Part_Type]
      ,[SOH]
	  ,pr.[PreRcpt]
      ,ISNULL([Item_12_Mo_Dlr_Usg],0)+ISNULL([Item_12_Mo_IC_Usg],0) AS [12_Mo_Item_Usg]
      ,ISNULL([Item_12_Mo_Ord],0) AS [12_Mo_Item_Trans]
      ,ISNULL([Comb_12_Mo_Dlr_Usg],0)+ISNULL([Comb_12_Mo_IC_Usg],0) AS [12_Mo_Comb_Usg]
      ,ISNULL([Comb_12_Mo_Ord],0) AS [12_Mo_Comb_Trans]
      ,[Commodity]
      ,[MTD_Line_Ent]
      ,[MTD_Line_Ship]
      ,[_2_Mo_Line_Ent]
      ,[_2_Mo_Line_Ship]
      ,[_2_Mo_Stk_Out]
      ,[Status_Code]
      ,[Alpha_Code] AS Alpha
      ,[Origin_Dt]
      ,[Inact_Dt]
      ,[Last_Rcpt_Dt]
      ,[Last_Tran_Dt]
      ,[SLS_Avail_Dt]
  FROM [dbo].[pdc_Part_Master_Inact] p
  LEFT JOIN pr 
  ON p.[Part_No]=pr.[Part_No]
   -- Where p.Part_No=' 2039091'
		 --or p.Part_No='S00813225   '
		 --or p.Part_No='S00813220005'
		 --or p.Part_No='Y00813220005'
		 --or p.Part_No='Y506993502 '
		 --or p.Part_No=' 2039091    '
)


--Gets all PDC prime PQ vendor and vendor PN combinations for PDC PNs.
, v AS 
(
SELECT DISTINCT q.[Part_No] AS PN
	, q.[Vend_Code] AS Vend
	, q.[Vend_Ref_No] AS VPN
	FROM [dbo].[pdc_PQ_Part_Vendor] q JOIN pm ON q.[Part_No]=pm.[Part_No] AND q.[Vend_Code]=pm.[Vend_Code]
	WHERE q.[Plt_Code]='014'
)


--Gets all crosses for PN where matching prime PDC PQs exist.
, c AS 
(
SELECT v1.[PN]
	, v1.[Vend]
	, v1.[VPN]
	, v2.[PN] AS X_PN
	FROM v v1 JOIN v v2 
	ON v1.[Vend]=v2.[Vend] AND v1.[VPN]=v2.[VPN] 
	WHERE v1.[PN]<>v2.[PN]
)


--Gets various details at PN level (includes XPNs).
, pn_xpn AS
(
SELECT DISTINCT p1.[Part_No] AS PN
       ,p1.[Part_Desc] AS [Desc]
       ,p1.[Commodity] AS Comm
       ,p1.[Comb_Purch_Code] AS Combi
       ,p1.[Alpha]
       ,ISNULL(p1.[SOH],0) AS SOH 
       ,ISNULL(p1.[PreRcpt],0) AS PreRcpt
       ,ISNULL(p1.[On_Ord_Qty],0) AS OO
	   ,0 as SS--ISNULL(s1.[SS],0) AS SS
       ,ISNULL(p1.[BO_Qty],0) AS BO
       ,ISNULL(p1.[Comm_Qty],0) AS Commtd
	   ,ISNULL(p1.[Mo_Avg],0) AS Mo_Av
	   ,ISNULL(p1.[12_Mo_Item_Usg],0) AS [12_Mo_Item_Usg]
	   ,ISNULL(p1.[12_Mo_Comb_Usg],0) AS [12_Mo_Comb_Usg]
       ,ISNULL(p1.[12_Mo_Item_Trans],0) AS [12_Mo_Item_Trans]
	   ,ISNULL(p1.[12_Mo_Comb_Trans],0) AS [12_Mo_Comb_Trans]
       ,ISNULL(p1.[MTD_Line_Ent],0) AS MTD_LE
       ,ISNULL(p1.[MTD_Line_Ship],0) AS MTD_LF
       ,ISNULL(p1.[_2_Mo_Line_Ent],0) AS [12_Mo_LE]
       ,ISNULL(p1.[_2_Mo_Line_Ship],0) AS [12_Mo_LF]
       ,p1.[Last_Rcpt_Dt] AS Lst_Rcpt_Dt
       ,p1.[Last_Tran_Dt] AS Lst_Tran_Dt
	   --Added Origin_Dt, Inact_Dt and SLS_Dt on 2021-02-21 
	   ,p1.[Origin_Dt]
       ,p1.[Inact_Dt]
       ,p1.[SLS_Avail_Dt] AS [SLS_Dt]
	   ,CASE
              WHEN p1.[Ord_Cntl] ='8' AND p1.[Status_Code] <> '4'
              THEN 'CAN'
              ELSE Null
              END AS Status
	   ,ISNULL(p1.[Mo_Avg],0) AS MoAv
	   ,p1.[Lead_Time] AS LT
       ,p1.[Vend_Code] AS Vend
	   --Added Contact Vendor, RS Tag, DS Tag, NS Cd, Prime Class, Prime Type, Std Cost, Dlr Net, Cns Lst, Order Point, EOQ, Ord Control and Status Code on 2021-02-11
	   --Added Part_Type on 2021-04-05
	   ,p1.[Contact_Vend] AS ContactVend
	   --Added Inplt_Src and New_Rep on 2021-06-17
	   ,p1.[New_Rep_Tag] AS New_Rep
	   ,p1.[Inplt_Src]
	   --Added InspTag on 2021-07-22
	   ,p1.[Inspect_Code] AS InspTag
	   ,p1.[Re_Sourcing_Tag] AS RsTag
	   ,p1.[DS_Tag] AS DS
	   ,p1.[Non_Stk_Code] AS NsCd
	   ,p1.[Prm_Prod_Class] AS PrdCls
	   ,p1.[Prm_Prod_Type] AS PrdTyp
	   ,p1.[Std_Cost] As StdCst
	   ,p1.[Dlr_Net] As DlrNet
	   ,p1.[Cons_List] As Cnslst
	   ,p1.[Ord_Point] AS OP
	   ,p1.[EOQ]
	   --Added PkgCd and PkgQty on 2021-08-20
	   ,p1.[Package_Code] AS PkgCd
	   ,p1.[Pkg_Qty] AS PkgQty
	   ,p1.[Part_Type] AS PrtType
	   ,p1.[Ord_Cntl] AS OC
	   ,p1.[Status_Code] AS SC
       ,NULL AS MFG_No
       ,c.X_PN
       ,p2.[Part_Desc] AS X_Desc
       ,p2.[Commodity] AS X_Comm
       ,p2.[Comb_Purch_Code] AS X_Combi
       ,p2.[Alpha] AS X_Alpha
       ,ISNULL(p2.[SOH],0) AS X_SOH
	   ,ISNULL(p2.[PreRcpt],0) AS X_PreRcpt
       ,ISNULL(p2.[On_Ord_Qty],0) AS X_OO
	   ,0 as X_ss--ISNULL(s2.[SS],0) AS X_SS
	   ,ISNULL(p2.[BO_Qty],0) AS X_BO
       ,ISNULL(p2.[Comm_Qty],0) AS X_Commtd
	   ,ISNULL(p2.[Mo_Avg],0) AS X_Mo_Av
	   ,ISNULL(p2.[12_Mo_Item_Usg],0) AS X_12_Mo_Item_Usg
	   ,ISNULL(p2.[12_Mo_Comb_Usg],0) AS X_12_Mo_Comb_Usg
       ,ISNULL(p2.[12_Mo_Item_Trans],0) AS X_12_Mo_Item_Trans
	   ,ISNULL(p2.[12_Mo_Comb_Trans],0) AS X_12_Mo_Comb_Trans
       ,ISNULL(p2.[MTD_Line_Ent],0) AS X_MTD_LE
       ,ISNULL(p2.[MTD_Line_Ship],0) AS X_MTD_LF
       ,ISNULL(p2.[_2_Mo_Line_Ent],0) AS X_12_Mo_LE
       ,ISNULL(p2.[_2_Mo_Line_Ship],0) AS X_12_Mo_LF
       ,p2.[Last_Rcpt_Dt] AS X_Lst_Rcpt_Dt
       ,p2.[Last_Tran_Dt] AS X_Lst_Tran_Dt
	   --Added X_Origin_Dt, X_Inact_Dt and X_SLS_Dt on 2021-02-21 
	   ,p2.[Origin_Dt] AS X_Origin_Dt
       ,p2.[Inact_Dt] AS X_Inact_Dt
       ,p2.[SLS_Avail_Dt] AS X_SLS_Dt
	   ,CASE
              WHEN p2.[Ord_Cntl] ='8' AND p2.[Status_Code] <> '4'
              THEN 'CAN'
              ELSE Null
              END AS X_Status
       ,p2.[Lead_Time] AS X_LT
       ,p2.[Vend_Code] AS X_Vend
	   --Added X_Contact Vendor, X_RS Tag, X_DS Tag, X_NS Cd, X_Prime X_Class, X_Prime Type, X_Std Cost, X_Dlr Net, X_Cns Lst, X_Order Point, X_EOQ, X_Ord Control and X_Status Code on 2/11/2021
	   --Added X_Part_Type on 2021-04-05
	   ,p2.[Contact_Vend] AS X_ContactVend
	   --Added X_Inplt_Src and X_New_Rep on 2021-06-17
	   ,p2.[New_Rep_Tag] AS X_New_Rep
	   ,p2.[Inplt_Src] AS X_Inplt_Src
	   --Added X_InspTag on 2021-07-22
	   ,p2.[Inspect_Code] AS X_InspTag
	   ,p2.[Re_Sourcing_Tag] AS X_RsTag
	   ,p2.[DS_Tag] AS X_DS
	   ,p2.[Non_Stk_Code] AS X_NsCd
	   ,p2.[Prm_Prod_Class] AS X_PrdCls
	   ,p2.[Prm_Prod_Type] AS X_PrdTyp
	   ,p2.[Std_Cost] AS x_StdCst
	   ,p2.[Dlr_Net] AS X_DlrNet
	   ,p2.[Cons_List] As X_Cnslst
	   ,p2.[Ord_Point] AS X_OP
	   ,p2.[EOQ] AS X_EOQ
	   -- Added PkgCd and PkgQty on 2021-08-20
	   ,p2.[Package_Code] AS X_PkgCd
	   ,p2.[Pkg_Qty] AS X_PkgQty
	   ,p2.[Part_Type] AS X_PrtType
	   ,p2.[Ord_Cntl] AS X_OC
	   ,p2.[Status_Code] AS X_SC
       FROM pm p1
       --LEFT JOIN dbo.mdi_SS s1 ON p1.[Part_No]=s1.[PN]
       LEFT JOIN c ON p1.[Part_No]=c.[PN]
       LEFT JOIN pm p2 ON c.[X_PN]=p2.[Part_No]
       --LEFT JOIN dbo.mdi_SS s2 ON p2.[Part_No]=s2.[PN]
		--Where p1.Part_No=' 2039091' 
		--or p1.Part_No='S00813225   '
		--or p1.Part_No='S00813220005'
		--or p1.Part_No='Y00813220005'
		--or p1.Part_No='Y506993502 '
		--or p1.Part_No=' 2039091    '
		--Where p1.Part_No=' 3044849'
		--Or p1.Part_No=' 1364616'
		--Or p1.Part_No=' 1375598'
		--Or p1.Part_No=' 2008124'
		--Or p1.Part_No=' 3044848'
		--Or p1.Part_No='Y150040601'
		--Or p1.Part_No='Y150040602'
		--Or p1.Part_No='Y518805628'
		--Or p1.Part_No='Y580029097'
		--Or p1.Part_No='Y582049404'
		--Or p1.Part_No='Y582087679'

)

--Gets non_I_PNs (Combi='S' or X_PN Is Null) whose Alpha and Mo Av work for the Part Set (no combi code 'I' parts)

, non_i AS
(
SELECT PN
  , Combi
  , X_PN
  , X_Combi
  , Min(Alpha) AS Set_Alpha
  , Max(Mo_Av) AS Set_Mo_Av
  FROM pn_xpn
  --Where PN=' 3044849'
  --Or PN=' 1364616'
  --Or PN=' 1375598'
  --Or PN=' 2008124'
  --Or PN=' 3044848'
  --Or PN='Y150040601'
  --Or PN='Y150040602'
  --Or PN='Y518805628'
  --Or PN='Y580029097'
  --Or PN='Y582049404'
  --Or PN='Y582087679'

  GROUP BY PN
  , Combi
  , X_PN
  , X_Combi
  HAVING (Combi = 'S' OR X_PN Is Null)
)

, am1 AS
(
SELECT PN
  , Set_Alpha
  , Set_Mo_Av
From non_i
)
, am2 AS
(
SELECT X_PN As PN
  , Set_Alpha
  , Set_Mo_Av
From non_i
)
,am As
(
Select *
From am1
Union
Select *
From am2
)

, f AS
(
SELECT pn_xpn.PN
       , Alpha
	   , pn_xpn.Combi
       , SOH
	   , PreRcpt
       , OO
       , SS
       , BO
       , Commtd
       , [12_Mo_Item_Usg]
       , [12_Mo_Item_Trans]
       , MTD_LE
       , MTD_LF
       , [12_Mo_LE]
       , [12_Mo_LF]
       , Lst_Rcpt_Dt
       , Lst_Tran_Dt
	   --Added Origin_Dt, Inact_Dt and SLS_Dt on 2021-02-21 
	   , Origin_Dt
       , Inact_Dt
       , SLS_Dt
	   , MoAv
       , LT
       , Vend
	   --Added ContactVend, RsTag, DS, NsCd, PrdCls, PrdTyp, StdCst, DlrNet, CnsLst, OP, EOQ, OC and SC on 2021-02-11
	   --Added Part_Type on 2021-04-05
	   , ContactVend
	   --Added Inplt_Src and New_Rep on 2021-06-07
	   , New_Rep
	   , Inplt_Src
	   --Added InspTag on 2021-07-22
	   , InspTag
	   , RsTag
	   , DS
	   , NsCd
	   , PrdCls
	   , PrdTyp
	   , StdCst
	   , DlrNet
	   , CnsLst
	   , OP
	   , EOQ
	   --Added PkgCd and PkgQty on 2021-08-20
	   , PkgCd
	   , PkgQty
	   , PrtType
	   , OC
	   , SC
--Revised on 2022-03-15
	   , am.Set_Alpha
--PN values below will not be NULL if no usage, transactions, LE, LF, etc. the value will be 0
--Sum values for X_PN will be NULL if no crosses; therefore setting those values to 0 when null
	   , Set_SOH=SOH+ISNULL(SUM(X_SOH),0) 
	   , Set_PreRcpt=PreRcpt+ISNULL(SUM(X_PreRcpt),0)
       , Set_OO=OO+ISNULL(SUM(X_OO),0)
	   --2023-01-31 Added the following 
	   , Set_SS=SS+ISNULL(SUM(x_SS),0)
	   --2023-01-31 Removed the following 
	   --, CASE
	          --WHEN pn_xpn.Combi = 'S'
              --THEN SS
		      --WHEN pn_xpn.Combi <> 'S' AND pn_xpn.Combi <>''
			  --THEN s.S_Part_SS
              --ELSE SS
              --END AS Set_SS
	   , Set_BO=BO+ISNULL(SUM(X_BO),0)
       , Set_Commtd=Commtd+ISNULL(SUM(X_Commtd),0)
	   , Set_12_Mo_Usg=[12_Mo_Item_Usg]+ISNULL(SUM(X_12_Mo_Item_Usg),0)
	   , Set_12_Mo_Trans=[12_Mo_Item_Trans]+ISNULL(SUM(X_12_Mo_Item_Trans),0)
       , Set_MTD_LE=MTD_LE+ISNULL(SUM(X_MTD_LE),0)
       , Set_MTD_LF=MTD_LF+ISNULL(SUM(X_MTD_LF),0)
       , Set_12_Mo_LE=[12_Mo_LE]+ISNULL(SUM(X_12_Mo_LE),0)
       , Set_12_Mo_LF=[12_Mo_LF]+ISNULL(SUM(X_12_Mo_LF),0)
	 --Revised Old CASE statement didn't account for dates to be null for one or both PN and X_PN to be null on 2022-03-15 
       , CASE
              WHEN Lst_Rcpt_Dt IS NULL AND MAX(X_Lst_Rcpt_Dt) IS NULL
			  THEN NULL
              WHEN Lst_Rcpt_Dt IS NOT NULL AND MAX(X_Lst_Rcpt_Dt) IS NULL
			  THEN Lst_Rcpt_Dt
			  WHEN MAX(X_Lst_Rcpt_Dt) IS NOT NULL AND Lst_Rcpt_Dt IS NULL
			  THEN MAX(X_Lst_Rcpt_Dt)
			  WHEN MAX(X_Lst_Rcpt_Dt) > Lst_Rcpt_Dt 
			  THEN MAX(X_Lst_Rcpt_Dt)
              ELSE Lst_Rcpt_Dt
              END AS Set_Lst_Rcpt_Dt
       , CASE
              WHEN Lst_Tran_Dt IS NULL AND MAX(X_Lst_Tran_Dt) IS NULL
			  THEN NULL
              WHEN Lst_Tran_Dt IS NOT NULL AND MAX(X_Lst_Tran_Dt) IS NULL
			  THEN Lst_Tran_Dt
			  WHEN MAX(X_Lst_Tran_Dt) IS NOT NULL AND Lst_Tran_Dt IS NULL
			  THEN MAX(X_Lst_Tran_Dt)
			  WHEN MAX(X_Lst_Tran_Dt) > Lst_Tran_Dt 
			  THEN MAX(X_Lst_Tran_Dt)
              ELSE Lst_Tran_Dt
              END AS Set_Lst_Tran_Dt
	   , am.Set_Mo_Av
FROM pn_xpn
LEFT JOIN am
ON pn_xpn.PN=am.PN
  --Where pn_xpn.PN=' 2039091'
		-- or pn_xpn.PN='S00813225   '
		-- or pn_xpn.PN='S00813220005'
		-- or pn_xpn.PN='Y00813220005'
		-- or pn_xpn.PN='Y506993502 '
		-- or pn_xpn.PN=' 2039091    '
GROUP BY pn_xpn.PN
       , Alpha
	   , pn_xpn.Combi
	   , SOH
	   , PreRcpt
	   , OO
       , SS
       , BO
       , Commtd
       , [12_Mo_Item_Usg]
       , [12_Mo_Item_Trans]
	   , MTD_LE
       , MTD_LF
       , [12_Mo_LE]
       , [12_Mo_LF]
       , Lst_Rcpt_Dt
       , Lst_Tran_Dt
	   --Added Origin_Dt, Inact_Dt and SLS_Dt on 2021-02-21 
	   , Origin_Dt
       , Inact_Dt
       , SLS_Dt
	   , MoAv
       , LT
       , Vend
	   --Added ContactVend, RsTag, DS, NsCd, PrdCls, PrdTyp, StdCst, DlrNet, CnsLst OP, EOQ, OC and SC on 2021-02-11
	   --Added PrtType on 2021-04-05
	   , ContactVend
   	   --Added Inplt_Src and New_Rep on 2021-06-17
	   , New_Rep
	   , Inplt_Src
	   --Added InspTag on 2021-07-22
	   , InspTag
	   , RsTag
	   , DS
	   , NsCd
	   , PrdCls
	   , PrdTyp
	   , StdCst
	   , DlrNet
	   , CnsLst
	   , OP
	   , EOQ
	   --Added PkgCd and PkgQty on 2021-08-20
	   , PkgCd
	   , PkgQty
	   , PrtType 
	   , OC
	   , SC
	   , Set_Alpha
	   --2023-01-31 Removed the following
	   --, s.S_Part_SS
	   , Set_Mo_Av
)


INSERT INTO ref_pdc_Part_Set_Detail

SELECT DISTINCT f.PN
       , pn_xpn.[Desc]
       , pn_xpn.Comm
       , pn_xpn.Combi
       , pn_xpn.Alpha
       , pn_xpn.SOH
	   , pn_xpn.PreRcpt
       , pn_xpn.OO
       , pn_xpn.SS
       , pn_xpn.BO
       , pn_xpn.Commtd
	   , pn_xpn.[12_Mo_Item_Usg] AS [12_Mo_Usg]
       , pn_xpn.[12_Mo_Item_Trans] AS [12_Mo_Trans]
       , pn_xpn.MTD_LE
       , pn_xpn.MTD_LF
       , pn_xpn.[12_Mo_LE]
       , pn_xpn.[12_Mo_LF]
	   , pn_xpn.Lst_Rcpt_Dt
       , pn_xpn.Lst_Tran_Dt
	   --Added Origin_Dt, Inact_Dt and SLS_Dt on 2021-02-21
	   , pn_xpn.Origin_Dt
       , pn_xpn.Inact_Dt
       , pn_xpn.SLS_Dt
	   , pn_xpn.[Status]
	   --Added Vend on 2021-02-24
	   , pn_xpn.Vend
	   --Added ContactVend, RsTag, DS, NsCd, PrdCls, PrdTyp, StdCst, DlrNet, CnsLst OP, EOQ, OC and SC on 2021-02-11
	   --Added PrtType on 2021-04-05
	   , pn_xpn.ContactVend
	   --Added Inplt_Src and New_Rep on 2021-06-17
	   , pn_xpn.New_Rep
	   , pn_xpn.Inplt_Src
	   --Added InspTag on 2021-07-22
	   , pn_xpn.InspTag
	   , pn_xpn.RsTag
	   , pn_xpn.DS
	   , pn_xpn.NsCd
	   , pn_xpn.PrdCls
	   , pn_xpn.PrdTyp
	   , pn_xpn.StdCst
	   , pn_xpn.DlrNet
	   , pn_xpn.CnsLst
	   , pn_xpn.OP
	   , pn_xpn.EOQ	   
	   , pn_xpn.PrtType
	   , pn_xpn.OC
	   , pn_xpn.SC
	   --Added PkgCd and PkgQty on 2021-08-20
	   , pn_xpn.PkgCd
	   , pn_xpn.PkgQty
       , pn_xpn.X_PN
       , pn_xpn.X_Comm
       , pn_xpn.X_Combi
       , pn_xpn.X_Alpha
       , pn_xpn.X_SOH
	   , pn_xpn.X_PreRcpt
       , pn_xpn.X_OO
       , pn_xpn.X_SS
       , pn_xpn.X_BO
       , pn_xpn.X_Commtd
       , pn_xpn.X_12_Mo_Item_Usg AS X_12_Mo_Usg
       , pn_xpn.X_12_Mo_Item_Trans AS X_12_Mo_Trans
       , pn_xpn.X_MTD_LE
       , pn_xpn.X_MTD_LF
       , pn_xpn.X_12_Mo_LE
       , pn_xpn.X_12_Mo_LF
	   , pn_xpn.X_Lst_Rcpt_Dt
       , pn_xpn.X_Lst_Tran_Dt
	   --Added X_Origin_Dt, X_Inact_Dt and X_SLS_Dt on 2021-02-21 
	   , pn_xpn.X_Origin_Dt
       , pn_xpn.X_Inact_Dt
       , pn_xpn.X_SLS_Dt
	   , pn_xpn.[X_Status]
	   --Added X_Vend on 2021-02-24
	   , pn_xpn.X_Vend
	   --Added X_ContactVend, X_RsTag, X_DS, X_NsCd, X_PrdCls, X_PrdTyp, X_StdCst, X_DlrNet, X_CnsLst, X_OP, X_EOQ, X_OC and X_SC on 2021-02-11
	   --Added X_PrtType on 2021-04-05
	   , pn_xpn.X_ContactVend
	   --Added X_Inplt_Src and X_New_Rep on 2021-06-17
	   , pn_xpn.X_New_Rep
	   , pn_xpn.X_Inplt_Src
	   --Added X_InspTag on 2021-07-22
	   , pn_xpn.X_InspTag
	   , pn_xpn.X_RsTag
	   , pn_xpn.X_DS
	   , pn_xpn.X_NsCd
	   , pn_xpn.X_PrdCls
	   , pn_xpn.X_PrdTyp
	   , pn_xpn.X_StdCst
	   , pn_xpn.X_DlrNet
	   , pn_xpn.X_CnsLst
	   , pn_xpn.X_OP
	   , pn_xpn.X_EOQ
	   , pn_xpn.X_PrtType
	   , pn_xpn.X_OC
	   , pn_xpn.X_SC
	   --Added X_PkgCd and X_PkgQty on 08/20/21
	   , pn_xpn.X_PkgCd
	   , pn_xpn.X_PkgQty
	   , f.Set_Alpha
       , f.Set_SOH
	   , f.Set_PreRcpt
       , f.Set_OO
       , f.Set_SS
       , f.Set_BO
       , f.Set_Commtd
       , f.Set_12_Mo_Usg
       , f.Set_12_Mo_Trans
       , f.Set_MTD_LE
       , f.Set_MTD_LF
       , f.Set_12_Mo_LE
       , f.Set_12_Mo_LF
       , f.Set_Lst_Rcpt_Dt
       , f.Set_Lst_Tran_Dt
       , f.Set_Mo_Av
       , f.LT AS Set_Ld_Time
       , f.Vend AS Set_Vend
	   , Null As SPN
FROM f JOIN pn_xpn 
ON f.[PN]=pn_xpn.[PN]
--WHERE 
--OR f.PN='Y582095702'
--OR f.PN=' 4671333    '

GO
