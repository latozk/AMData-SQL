SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[sp_UTIL_Purge_Job_History] as

Declare @Days int
Declare @Job varchar(50)
Declare @Purge_Date datetime

  Begin
	Set @Job = 'pdcdata_proc_dwn_Monitor'
	Set @Days = (Select parm_value from x_Parameters where Parm_Name = 'pdcdata_proc_dwn_Monitor_history')
	Set @Purge_Date =  (select cast (DATEADD(dd,-@Days,getdate()) as datetime))
  
	Exec   msdb.dbo.sp_purge_jobhistory
	@Job_Name = @Job
   , @oldest_date = @Purge_Date;
 End

 Begin
	Set @Job = 'pdcdata_proc_etl_Monitor'
	Set @Days = (Select parm_value from x_Parameters where Parm_Name = 'pdcdata_proc_etl_Monitor_history')
	Set @Purge_Date =  (select cast (DATEADD(dd,-@Days,getdate()) as datetime))
  
	 Exec   msdb.dbo.sp_purge_jobhistory
	@Job_Name = @Job
   , @oldest_date = @Purge_Date;
End

Begin
	Set @Job = 'pdcdata_IMPDWNLD_Monitor'
	Set @Days = (Select parm_value from x_Parameters where Parm_Name = 'pdcdata_IMPDWNLD_Monitor_history')
	Set @Purge_Date =  (select cast (DATEADD(dd,-@Days,getdate()) as datetime))
  
	 Exec   msdb.dbo.sp_purge_jobhistory
	@Job_Name = @Job
   , @oldest_date = @Purge_Date;
End
GO
