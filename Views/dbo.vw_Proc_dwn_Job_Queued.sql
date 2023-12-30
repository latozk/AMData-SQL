SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [dbo].[vw_Proc_dwn_Job_Queued] as 

Select Top (Select (Select Parm_Value from ref_Parameters where parm_name = 'Max_Dwn_Jobs') - 
 (Select Count(*) from ref_table_Dictionary where dwn_Flag = 'A')
 ) 
tbl_Key
, dwn_Pkg
, Priority
	From ref_Table_Dictionary 
	Where dwn_Flag = 'R'
	and Active = 'Y'
	and not Concat(dwn_Pkg, '.dtsx') in 
		(Select Package_Name from vw_UTIL_SSIS_Active_Summary)
	Order by Priority Desc
GO
