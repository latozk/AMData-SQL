SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [dbo].[eng_Product_Structure_pl] as 

Select
p.PN As SPN_Kit,
c1.PN As Branded_Kit,
c1.PN_Brand As Kit_Brand,
Comp As SPN_Comp,
c2.PN As Branded_Comp,
c2.PN_Brand As Comp_Brand,
Usg_Qty As Qty,
pm.[Type]


FROM dbo.inp_Picklist p
Left Join dbo.eng_Product_Structure ps
	ON p.PN=ps.PN
Join dbo.eng_Part_Master pm
	ON ps.Comp=pm.PN
Join dbo.ref_CORE_PN_XRef c1
	ON p.PN=c1.CORE_PN
Left Join dbo.ref_CORE_PN_XRef c2
	ON ps.Comp=c2.CORE_PN

Where ps.[Status]= 'ADD' and [Opt]= ''

GO
