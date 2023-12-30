SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [dbo].[vw_Proc_etl_Job_Queued] as 

Select Top (Select (Select Parm_Value from ref_Parameters where parm_name = 'Max_etl_Jobs') - 
 (Select Count(*) from ref_table_Dictionary where etl_Flag = 'A')
 ) 
tbl_Key
, etl_Pkg
, Priority
	From ref_Table_Dictionary 
	Where etl_Flag = 'R'
	and Active = 'Y'
	and not Concat(etl_Pkg, '.dtsx') in 
		(Select Package_Name from vw_UTIL_SSIS_Active_Summary)
	Order by Priority Desc
GO
