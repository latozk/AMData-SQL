SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO













--View created to replace Access Table 2) PN XRef - With CC-SS-SOH-CombSS-CombSOH


CREATE View [dbo].[ref_PDC_Part_Set_Details_Legacy_Layout] AS

SELECT [PN]
      ,[Desc]
      ,[Comm] AS ComCd
      ,[Combi] AS CC
      ,[Alpha]
      ,[SOH]
	  ,[PreRcpt]
      ,[OO]
      ,[SS]
      ,[BO]
      ,[Commtd]
      ,[12_Mo_Usg] AS [12MoUsg]
      ,[12_Mo_Trans] AS [12MoTrans]
      ,[MTD_LE] AS MTDLE
      ,[MTD_LF] AS MTDLF
      ,[12_Mo_LE] AS [12MoLE]
      ,[12_Mo_LF] AS [12MoLF]
      ,[Lst_Rcpt_Dt] AS LstRcDt
      ,[Lst_Tran_Dt] AS LstTrnsDt
	  ,[Status]
      ,[X_PN] AS XPN
      ,[X_Comm] AS XComCd
      ,[X_Combi] AS XCC
      ,[X_Alpha] AS XAlpha
      ,[X_SOH] AS XSOH
	  ,[PreRcpt] AS XPreRcpt
      ,[X_OO] AS XOO
      ,[X_SS] AS XSS
      ,[X_BO] AS XBO
      ,[X_Commtd] XCommtd
      ,[X_12_Mo_Usg]AS X12MoUsg
      ,[X_12_Mo_Trans] AS X12MoTrans
      ,[X_MTD_LE] AS XMTDLE
      ,[X_MTD_LF] AS XMTDLF
      ,[X_12_Mo_LE] AS X12MoLE
      ,[X_12_Mo_LF] AS X12MoLF
      ,[X_Lst_Rcpt_Dt] AS XLstRcDt
      ,[X_Lst_Tran_Dt] AS XLstTrnsDt
	  ,[X_Status] AS XStatus
      ,[Set_Alpha] As SetAlpha
      ,[Set_SOH] AS CombinedSOH
	  ,[PreRcpt] AS TotPreRcpt
      ,[Set_OO] AS TotOO
      ,[Set_SS] AS CombinedSS
      ,[Set_BO] AS TotBO
      ,[Set_Commtd] AS TotCommtd
      ,[Set_12_Mo_Usg] AS Tot12MoUsg
      ,[Set_12_Mo_Trans] AS Tot12MoTrans
      ,[Set_MTD_LE] AS TotMTDLE
      ,[Set_MTD_LF] AS TotMTDLF
      ,[Set_12_Mo_LE] AS Tot12MoLE
      ,[Set_12_Mo_LF] AS Tot12MoLF
      ,[Set_Lst_Rcpt_Dt] AS PNSetLstRcDt
      ,[Set_Lst_Tran_Dt] AS PNSetLstTrnsDt
      ,[Set_Mo_Av] AS CombinedMoAv
      ,[Set_Ld_Time] AS LT
      ,[Set_Vend] AS VC
	  ,[MFG_PN]=Null
  FROM [dbo].[ref_pdc_Part_Set_Detail]
GO
