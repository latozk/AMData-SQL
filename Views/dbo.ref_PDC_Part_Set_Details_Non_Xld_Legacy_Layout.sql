SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE View [dbo].[ref_PDC_Part_Set_Details_Non_Xld_Legacy_Layout] AS
Select *
FROM ref_pdc_Part_Set_Details_Legacy_Layout
--dbo.ref_pdc_Part_Set_Details_Pre_2020
WHERE ([Status] IS NULL AND [XStatus] IS NULL)
--AND ([PN]=' 0000142    '
--OR [PN]=' 3050155    '
--OR [PN]='Y504228284  '
--OR [PN]='Y504236258  '
--OR [PN]='Y504237211  '
--OR [PN]=' 0000125    '
--OR [PN]=' 3050150    '
--OR [PN]=' 3060307    '
--OR [PN]=' 3075164    '
--OR [PN]='Y518790634  '
--OR [PN]=' 1520639    '
--OR [PN]='Y504237211  ' 
--OR [PN]='Y504228284  ' 
--OR [PN]='Y504236258  ' 
--OR [PN]='Y520292814  ' 
--OR [PN]='Y014936600  ' 
--OR [PN]='Y519412813  ')
GO
