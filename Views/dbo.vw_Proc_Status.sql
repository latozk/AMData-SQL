SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[vw_Proc_Status] as 
Select (Select Parm_Value from ref_Parameters where Parm_Name = 'Max_Dwn_Jobs') as Max_Dwn_Jobs
,(Select count(*) from ref_Table_Dictionary where dwn_flag='R') as SQL_dwn_Ready
, (Select count(*) from ref_Table_Dictionary where dwn_flag='A') as SQL_dwn_Active
, (Select count(*) from ref_Table_Dictionary where dwn_Flag='C') as SQL_dwn_Complete
, (Select count(*) from ref_Table_Dictionary where dwn_flag='E') as SQL_dwn_Error
, (Select Parm_Value from ref_Parameters where Parm_Name = 'Max_etl_Jobs') as Max_etl_Jobs 
, (Select count(*) from ref_Table_Dictionary where etl_Flag = 'R') as etl_Ready
, (Select count(*) from ref_Table_Dictionary where etl_Flag='A') as etl_Active
, (Select count(*) from ref_Table_Dictionary where etl_Flag='C') as etl_Complete
, (Select count(*) from ref_Table_Dictionary where etl_Flag='E') as etl_Error
GO
