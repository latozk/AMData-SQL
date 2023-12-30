SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








-- =============================================
--Author: Newell, R
--Date: 2021-01-20
--Purpose:	This view is being created for the Single PN project and includes the CORE PNs for all PDC PNs which have a CORE PN.
--			
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_SP_AMPN_to_COREPN] AS

WITH 

pdc AS (
SELECT [Part_No] AS PN
,[Part_Desc] AS [Desc]
,[Commodity] AS Comm
,[Comb_Purch_Code]AS Comb
,[Vend_Code] AS Vend
,[Ord_Cntl] AS OC
,[Status_Code] AS SC
,[Alpha]
,[Non_Stk_Code] AS NStk
,[Unit_code] AS Unit
--,[Prm_Prod_Class]
,'Active' AS Act_Inact
FROM [pdc_Part_Master]
UNION ALL
SELECT [Part_No] AS PN
,[Part_Desc] AS [Desc]
,[Commodity] AS Comm
,[Comb_Purch_Code] AS Comb
,[Vend_Code] AS Vend
,[Ord_Cntl] AS OC
,[Status_Code] AS SC
,[Alpha_Code] AS Alpha
,[Non_Stk_Code] AS NStk
,[Unit_code] AS Unit
,'Inactive' AS Act_Inact
FROM [pdc_Part_Master_Inact]
)

,c AS
(
SELECT [CORE_PN]
      ,[CORE_Brand]
      ,[PN]
      ,[PN_Brand]
      ,[XPN]
      ,[XPN_Brand]
      ,[ECN_EPO_dt]
      ,[PNAS400Fmt]
      ,[XPNas400Fmt]
      ,[Status]
      ,[Type]
      ,[Desc_1]
      ,[Desc_2]
      ,[Desc_3]
      ,[HCE]
      ,[Kit_List]
      ,[Part_In_Use]
      ,[Comm]
      ,[Rel_Proj]
      ,[Rel_ECN]
      ,[Rel_Date]
      ,[Replacing_Part]
      ,[VASP_List]
      ,[VASP_ECN_Date]
      ,[Chart]
      ,[CAD_Sys]
      ,[Loc]
      ,[Rev]
      ,[Dwg_Size]
      ,[Shts]
      ,[UOM]
      ,[Tran_Status]
      ,[ECN]
      ,[Serviced]
  FROM [dbo].[ref_CORE_PN_XRef]
  )

SELECT DISTINCT c.[CORE_PN]
	  ,c.[ECN]
      ,pdc.[PN]
	  ,pdc.[Desc]
	  ,pdc.[Comm]
	  ,pdc.[Comb]
	  ,pdc.[Vend]
      ,pdc.[OC]
      ,pdc.[SC]
      ,pdc.[Alpha]
      ,pdc.[NStk]
	  ,pdc.[Act_Inact]
      --pdc.[Unit]        

FROM pdc
LEFT JOIN c ON pdc.[PN]=c.[PNAS400Fmt]
WHERE c.[CORE_PN] LIKE '8______' AND pdc.[PN] NOT LIKE ' 3%' AND pdc.[PN] NOT LIKE ' 8%'
--/ Don't want to use coding from Unisource PNs and 8 million PNs set up with a space are likely cancelled so that coding should be excluded as well.

GO
