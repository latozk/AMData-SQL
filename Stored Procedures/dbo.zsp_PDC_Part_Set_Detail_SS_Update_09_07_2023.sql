SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE Procedure [dbo].[zsp_PDC_Part_Set_Detail_SS_Update_09_07_2023] as 

--2023-08-30 Added the folloiwng so Readiness audits can use a table instead of a view (View mdi_SS was replaced by Table mdi_SS)
--sp_mdi_SS populates the AMData table called mdi_SS
EXEC sp_mdi_SS;
--

Update ref_PDC_Part_Set_Detail  
Set SS = x.SS
From ref_PDC_Part_Set_Detail psd
Join mdi_ss x 
	On psd.pN = x.PN 
Where x.ss>0
;

Update ref_PDC_Part_Set_Detail 
Set X_SS = x.SS
From ref_PDC_Part_Set_Detail psd
	Left Join mdi_ss x
		On psd.X_pn = x.pn
Where x.ss>0
;

--2023-08-30 Added the following to get total SS of all X_PNs
With s AS
(
Select PN, Sum(X_SS) As Tot_X_SS
From ref_pdc_Part_Set_Detail
Group By PN
)
--

Update ref_pdc_Part_Set_Detail
--2023-08-30 Removed the following:
--Set Set_ss = ss+x_ss
--2023-08-30 Added the following:
Set Set_ss = ss+Tot_X_SS
From ref_PDC_Part_Set_Detail psd
	Left Join s
		On psd.PN = s.PN
GO
