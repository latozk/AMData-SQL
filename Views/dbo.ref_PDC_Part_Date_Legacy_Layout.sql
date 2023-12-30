SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[ref_PDC_Part_Date_Legacy_Layout] AS
Select ps.[PN]
,pm.[Origin_Dt] AS OrigDt
,pm.[SLS_Avail_Dt] AS SLSDt
,pm.[Inact_Dt] AS InactDt
,ps.[Set_Lst_Rcpt_Dt] AS LstRcDt
,ps.[Set_Lst_Tran_Dt] AS LstTranDt

FROM [dbo].[ref_pdc_Part_Set_Detail] ps LEFT JOIN [dbo].[pdc_Part_Master] pm
ON ps.[PN]=pm.[Part_No]
GO
