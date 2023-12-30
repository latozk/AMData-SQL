SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--Blank Combi Part and Part Detail for PNs not in CORE



CREATE VIEW [dbo].[zSingle_PN_Group_4_Parts] AS

SELECT DISTINCT CORE_PN
      ,x.CORE_Brand
	  ,p.PN AS SPN
	  ,p.PN
	  --,ECN_EPO_dt
      ,x.PNAS400Fmt
	  ,p.X_PN
      ,p.[Desc]
      ,p.Comm
      ,Combi
      ,Alpha
      ,SOH
      ,PreRcpt
      ,OO
      ,SS
      ,BO
      ,Commtd
      ,12_Mo_Usg
      ,12_Mo_Trans
      ,MTD_LE
      ,MTD_LF
      ,12_Mo_LE
      ,12_Mo_LF
      ,Lst_Rcpt_Dt
      ,Lst_Tran_Dt
      ,Origin_Dt
      ,Inact_Dt
      ,SLS_Dt
      ,p.Status AS PDC_Status
	  ,x.Status AS CORE_Status
      ,Vend
      ,ContactVend
      ,New_Rep
      ,Inplt_Src
      ,InspTag
      ,RSTag
      ,DS
      ,NsCd
      ,PrdCls
      ,PrdTyp
      ,StdCst
      ,DlrNet
      ,CnsLst
      ,OP
      ,EOQ
      ,PrtType
      ,OC
      ,SC
      ,PkgCd
      ,PkgQty
  FROM dbo.ref_PDC_Part_Set_Detail p
  LEFT JOIN dbo.ref_CORE_PN_XRef x
  ON p.PN=x.PNAS400Fmt
  WHERE p.Combi=' ' AND x.PNAS400Fmt IS NULL AND p.X_PN IS NULL
  --ORDER BY PN

GO
