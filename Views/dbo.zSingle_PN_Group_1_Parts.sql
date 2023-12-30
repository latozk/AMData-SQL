SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--S Part and S Part Detail for PNs in CORE
--Includes S Part Crosses with S Part Detail


CREATE VIEW [dbo].[zSingle_PN_Group_1_Parts] AS

--Gets S parts and S parts detail
WITH g1 AS
(
SELECT DISTINCT x.CORE_PN AS SPN
      ,x.CORE_Brand
	  ,x.PNAS400Fmt AS PN
	  --,ECN_EPO_dt
      ,x.PNAS400Fmt
      ,x.PN_Brand
	  ,x.XPNas400Fmt
	  ,x.XPN_Brand
      ,p.[Desc]
      ,p.Comm
      ,p.Combi
      ,p.Alpha
      ,p.SOH
      ,p.PreRcpt
      ,p.OO
      ,p.SS
      ,p.BO
      ,p.Commtd
      ,p.[12_Mo_Usg]
      ,p.[12_Mo_Trans]
      ,p.MTD_LE
      ,p.MTD_LF
      ,p.[12_Mo_LE]
      ,p.[12_Mo_LF]
      ,p.Lst_Rcpt_Dt
      ,p.Lst_Tran_Dt
      ,p.Origin_Dt
      ,p.Inact_Dt
      ,p.SLS_Dt
      ,p.Status AS PDC_Status
	  ,x.Status AS CORE_Status
      ,p.Vend
      ,p.ContactVend
      ,p.New_Rep
      ,p.Inplt_Src
      ,p.InspTag
      ,p.RSTag
      ,p.DS
      ,p.NsCd
      ,p.PrdCls
      ,p.PrdTyp
      ,p.StdCst
      ,p.DlrNet
      ,p.CnsLst
      ,p.OP
      ,p.EOQ
      ,p.PrtType
      ,p.OC
      ,p.SC
      ,p.PkgCd
      ,p.PkgQty
  FROM dbo.ref_PDC_Part_Set_Detail p
  JOIN dbo.ref_CORE_PN_XRef x
  ON p.PN=x.PNAS400Fmt
  WHERE p.Combi='S'
  )
,

--Gets XPNs for S parts and S part detail
g2 AS
(
SELECT DISTINCT x.CORE_PN AS SPN
      ,x.CORE_Brand
	  ,x.XPNAS400Fmt AS PN
	  --,ECN_EPO_dt
      ,x.PNAS400Fmt
      ,x.PN_Brand
	  ,x.XPNas400Fmt
	  ,x.XPN_Brand
      ,p.[Desc]
      ,p.Comm
      ,p.Combi
      ,p.Alpha
      ,p.SOH
      ,p.PreRcpt
      ,p.OO
      ,p.SS
      ,p.BO
      ,p.Commtd
      ,p.[12_Mo_Usg]
      ,p.[12_Mo_Trans]
      ,p.MTD_LE
      ,p.MTD_LF
      ,p.[12_Mo_LE]
      ,p.[12_Mo_LF]
      ,p.Lst_Rcpt_Dt
      ,p.Lst_Tran_Dt
      ,p.Origin_Dt
      ,p.Inact_Dt
      ,p.SLS_Dt
      ,p.Status AS PDC_Status
	  ,x.Status AS CORE_Status
      ,p.Vend
      ,p.ContactVend
      ,p.New_Rep
      ,p.Inplt_Src
      ,p.InspTag
      ,p.RSTag
      ,p.DS
      ,p.NsCd
      ,p.PrdCls
      ,p.PrdTyp
      ,p.StdCst
      ,p.DlrNet
      ,p.CnsLst
      ,p.OP
      ,p.EOQ
      ,p.PrtType
      ,p.OC
      ,p.SC
      ,p.PkgCd
      ,p.PkgQty
  FROM dbo.ref_PDC_Part_Set_Detail p
  JOIN dbo.ref_CORE_PN_XRef x
  ON p.PN=x.PNAS400Fmt
  WHERE p.Combi='S'
)

--Combines S part and cross part records
, a AS
(
SELECT *
FROM g1
UNION
SELECT *
FROM g2
)
SELECT *
FROM a
--ORDER BY SPN

GO
