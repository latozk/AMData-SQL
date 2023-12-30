SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





-- =============================================
--Author: Newell, R
--Date: 2021-10-06
--Purpose:	This view displays the curremt usage for PNs entered into the 
--			picklist called inp_Picklist_Component
--Last modified date:
--Modification notes:
-- =============================================


CREATE VIEW [dbo].[ref_eng_Parents_for_Component_pl] AS

--Gets PS remove transactions.

WITH r AS 
(
SELECT [ECN]
      ,[Type]
      ,[Tran]
      ,[Key_1]
      ,[Key_2]
      ,[Key_3]
      ,[Proc_Flag]
      ,[Unit_Contract]
      ,[Audit_Last_Chg_Dt]
  FROM [dbo].[eng_ECN_Tran]
  WHERE [Type]='MS' AND [Tran]='REM'
    --WHERE [Type]='MS' AND [Tran]='REM' AND (key_1='4124428' or key_2='4124428' or key_3='4124428'))
)
-- Current Unit Usage - Gets unit ADD and REM tramsactions and excludes ADD tramsactions where a REM transactions occur for the same PN, list and sequence.
, cu AS
(
SELECT a.[ECN]
      ,a.[Type]
      ,a.[Tran]
      ,a.[Key_1] AS Unit_Div_Contract
      ,a.[Key_2] AS Seq
      ,a.[Key_3] AS List_PN
      ,a.[Proc_Flag]
      ,a.[Unit_Contract]
      ,a.[Audit_Last_Chg_Dt]
  FROM dbo.eng_ECN_Tran a
  LEFT JOIN r
  ON a.Key_1=r.Key_1 AND a.Key_2=r.Key_2 AND a.Key_3=r.Key_3
  WHERE a.[Type]='MS' AND a.[Tran]='ADD' AND r.Key_1 IS NULL 
)
SELECT pl.PN AS Component
	  ,ps.PN AS Parent
	  ,pm.Desc_1 AS Parent_Description
	  ,cu.Unit_Div_Contract
	  ,cu.Unit_Contract
      --,ps.Seq AS CompToParentSeq
      --,ps.ECN_Add_Date
      --,ps.ECN
      --,ps.UOM
      --,ps.Usg_Qty
      --,ps.Opt
      --,ps.Status
      --,ps.ECN_Rem_Date
      --,ps.ECN_Add_DT
      --,ps.ECN_Rem_DT
  FROM dbo.inp_Picklist_Component pl
  JOIN dbo.eng_Product_Structure ps
  ON pl.PN=ps.Comp
  JOIN eng_Part_Master pm
  ON ps.PN=pm.PN
  LEFT JOIN cu
  ON ps.PN=cu.List_PN
  WHERE ps.ECN_Rem_Date<'1' AND pm.[Status]<>'CAN'

GO
