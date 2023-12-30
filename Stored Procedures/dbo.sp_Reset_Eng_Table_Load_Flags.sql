SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Procedure [dbo].[sp_Reset_Eng_Table_Load_Flags] as 
Update ref_table_Dictionary
set dwn_flag = 'R'
, etl_flag = ''
where active = 'y'
and  substring(tbl_key,1,3)='eng'
and not (tbl_key ='eng_NPO_Part_Dist_Agile' 
	or tbl_key = 'eng_PDC_Part_Dist_Agile');
GO
