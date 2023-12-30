SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--Blank Combi Part and Part Detail for PNs in CORE
--Includes S Part Crosses with S Part Detail


CREATE VIEW [dbo].[zSingle_PN_Group_2_Parts] AS

SELECT DISTINCT CORE_PN AS SPN
      ,CORE_Brand
	  --,ECN_EPO_dt
      ,p.PN
      ,PN_Brand
	  ,XPNas400Fmt
	  ,XPN_Brand
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
  JOIN dbo.ref_CORE_PN_XRef x
  ON p.PN=PNAS400Fmt
  WHERE Combi=' '
  --ORDER BY CORE_PN


GO
