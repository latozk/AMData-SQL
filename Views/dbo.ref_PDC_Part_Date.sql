SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[ref_PDC_Part_Date] AS

With pma AS
(
Select ps.[PN]
,pm.[Origin_Dt]
,pm.[SLS_Avail_Dt]
,pm.[Inact_Dt]
,ps.[Set_Lst_Rcpt_Dt]
,ps.[Set_Lst_Tran_Dt]
FROM [dbo].[ref_pdc_Part_Set_Detail] ps LEFT JOIN [dbo].[pdc_Part_Master] pm
ON ps.[PN]=pm.[Part_No]
WHERE pm.[Part_No] Is Not Null
)
,
pmi AS
(
Select ps.[PN]
,pm.[Origin_Dt]
,pm.[SLS_Avail_Dt]
,pm.[Inact_Dt]
,ps.[Set_Lst_Rcpt_Dt]
,ps.[Set_Lst_Tran_Dt]
FROM [dbo].[ref_pdc_Part_Set_Detail] ps LEFT JOIN [dbo].[pdc_Part_Master_Inact] pm
ON ps.[PN]=pm.[Part_No]
WHERE pm.[Part_No] Is Not Null
)

Select *
From pma
Union
Select *
From pmi


GO
