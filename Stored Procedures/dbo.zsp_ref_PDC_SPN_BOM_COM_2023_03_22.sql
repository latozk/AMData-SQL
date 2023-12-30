SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



Create Procedure [dbo].[zsp_ref_PDC_SPN_BOM_COM_2023_03_22] As

-- Creates SPN BOM Table for RPO kits.

Truncate Table dbo.ref_PDC_SPN_BOM;

With bom As
(
Select m.SPN As pSPN
	  --,Mimic_PN
	  ,CP_Parent_Part_No As p
	  ,PrtType
      ,CP_Comp_Part_No As c
	  ,x.SPN As cSPN
      ,CP_Comp_Qty As cq
      ,CP_Comp_Comment As cc
      ,CP_Eff_Date as cd
      ,CP_Assm_Opt_Code as co
From ref_PDC_SPN_Mimic_PN m
Join ref_PDC_Part_Detail d
On Mimic_PN=d.PN
Join dbo.pdc_Parts_Master_Component_Parent b
On d.PN=b.CP_Parent_Part_No
Join ref_PDC_SPN_X_Ref x
On b.CP_Comp_Part_No=x.PN
Where Vend='04162'
)

--Select * From dbo.ref_PDC_SPN_BOM

Insert Into dbo.ref_PDC_SPN_BOM
Select Distinct *
--Into dbo.ref_PDC_SPN_BOM
From bom
;


-- Creates SPN BOM Comments Table for RPO kits.

Truncate Table dbo.ref_PDC_SPN_COM;

With com As
(
Select PC_Parent_Part_No As p
	  ,m.SPN
      ,PC_Parent_Comment1 As c1
      ,PC_Parent_Comment2 As c2
      ,PC_Parent_Comment3 As c3
      ,PC_Parent_Comment4 As c4
      ,PC_Parent_Comment5 As c5
      ,PC_Parent_Comment6 As c6
      ,PC_Parent_Comment7 As c7
      ,PC_Parent_Comment8 As c8
      ,PC_Parent_Comment9 As c9
      ,PC_Parent_Comment10 As c10
      ,PC_Assm_Opt_Code As OptCd
From ref_PDC_SPN_Mimic_PN m
Join ref_PDC_Part_Detail d
On Mimic_PN=d.PN
Join dbo.pdc_Parts_Master_Parent_Comments c
On d.PN=c.PC_Parent_Part_No
Where Vend='04162'
)

--Select * From dbo.ref_PDC_SPN_COM

Insert Into dbo.ref_PDC_SPN_COM
Select Distinct *
--Into dbo.ref_PDC_SPN_COM
From com
;


GO
