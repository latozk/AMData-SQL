SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create procedure [dbo].[sp_PDC_Part_Set_Detail_Set_Analytics_Flag] as 
Update aftcmsql02.analytics.dbo.ref_Table_Dictionary
Set etl_Flag = 'R'
Where tbl_Key = 'ref_PDC_Part_Set_Detail'
GO
