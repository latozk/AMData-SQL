SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE View [dbo].[ref_PDC_SPN_X_Ref_w_Part_Set_Details] as 

Select x.SPN
	  ,d.PN
      ,[Desc]
      ,Comm
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
      ,Status
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
      ,X_PN
      ,X_Comm
      ,X_Combi
      ,X_Alpha
      ,X_SOH
      ,X_PreRcpt
      ,X_OO
      ,X_SS
      ,X_BO
      ,X_Commtd
      ,X_12_Mo_Usg
      ,X_12_Mo_Trans
      ,X_MTD_LE
      ,X_MTD_LF
      ,X_12_Mo_LE
      ,X_12_Mo_LF
      ,X_Lst_Rcpt_Dt
      ,X_Lst_Tran_Dt
      ,X_Origin_Dt
      ,X_Inact_Dt
      ,X_SLS_Dt
      ,X_Status
      ,X_Vend
      ,X_ContactVend
      ,X_New_Rep
      ,X_Inplt_Src
      ,X_InspTag
      ,X_RSTag
      ,X_DS
      ,X_NsCd
      ,X_PrdCls
      ,X_PrdTyp
      ,X_StdCst
      ,X_DlrNet
      ,X_CnsLst
      ,X_OP
      ,X_EOQ
      ,X_PrtType
      ,X_OC
      ,X_SC
      ,X_PkgCd
      ,X_PkgQty
      ,Set_Alpha
      ,Set_SOH
      ,Set_PreRcpt
      ,Set_OO
      ,Set_SS
      ,Set_BO
      ,Set_Commtd
      ,Set_12_Mo_Usg
      ,Set_12_Mo_Trans
      ,Set_MTD_LE
      ,Set_MTD_LF
      ,Set_12_Mo_LE
      ,Set_12_Mo_LF
      ,Set_Lst_Rcpt_Dt
      ,Set_Lst_Tran_Dt
      ,Set_Mo_Av
      ,Set_Ld_Time
      ,Set_Vend	  
	  ,Category
  From dbo.ref_PDC_Part_Set_Detail d
  Left Join dbo.ref_PDC_SPN_X_Ref x
  On d.PN=x.PN
  Where x.SPN Is Not Null



GO
