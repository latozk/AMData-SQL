SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

------2023-08-31 Added code to populate the SPN field (this needs removed when SPN goes to production) - Lines 63-69

CREATE Procedure [dbo].[sp_PDC_Part_Set_Detail_SS_Update] as 

--2023-08-30 Added the folloiwng so Readiness audits can use a table instead of a view (View mdi_SS was replaced by Table mdi_SS)
--sp_mdi_SS populates the AMData table called mdi_SS
--2023-09-07 Replaced the Where statements in the SS and X_SS Update queries.

EXEC sp_mdi_SS;
--

Update ref_PDC_Part_Set_Detail  
Set SS = x.SS
From ref_PDC_Part_Set_Detail psd
Join mdi_ss x 
	On psd.pN = x.PN 
--2023-09-07 Removed the following
--Where x.ss>0
--2023-09-07 Added the following
Where x.ss Is Not Null
;

Update ref_PDC_Part_Set_Detail 
Set X_SS = x.SS
From ref_PDC_Part_Set_Detail psd
	Left Join mdi_ss x
		On psd.X_pn = x.pn
--2023-09-07 Removed the following
--Where x.ss>0
--2023-09-07 Added the following
Where x.ss Is Not Null
;

--2023-08-30 Added the following to get total SS of all X_PNs
With s AS
(
Select PN, Sum(X_SS) As Tot_X_SS
From ref_pdc_Part_Set_Detail
Group By PN
)
Update ref_pdc_Part_Set_Detail
--2023-08-30 Removed the following:
--Set Set_ss = ss+x_ss
--2023-08-30 Added the following:
Set Set_ss = ss+Tot_X_SS
From ref_PDC_Part_Set_Detail psd
	Left Join s
		On psd.PN = s.PN
;

--Added 2023_09_07 in order to populate the SPN field
--Remove with the implementation of SPNs
Update ref_PDC_Part_Set_Detail
Set ref_PDC_Part_Set_Detail.SPN= ref_PDC_SPN_X_Ref.SPN
From ref_PDC_Part_Set_Detail
Join ref_PDC_SPN_X_Ref
On ref_PDC_Part_Set_Detail.PN=ref_PDC_SPN_X_Ref.PN
GO
