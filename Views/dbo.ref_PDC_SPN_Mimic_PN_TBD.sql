SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE View [dbo].[ref_PDC_SPN_Mimic_PN_TBD] as 

Select Distinct d.SPN
	  ,Mimic_PN
	  ,m.Category
  From ref_PDC_SPN_X_Ref_w_Part_Set_Details d
  Left Join ref_PDC_SPN_Mimic_PN m
  On d.SPN=m.SPN
  Where d.SPN Is Not Null And Mimic_PN Is Null


GO
