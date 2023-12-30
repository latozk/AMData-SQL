SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--exec sp_UTIL_Purge_ssis_Log

 CREATE procedure [dbo].[sp_UTIL_Purge_ssis_Log]
 as
 Declare @Days int
 Declare @Purge_Date datetime
 
 Begin
	Set @Days = (Select parm_value from ref_Parameters where Parm_Name = 'ssis_Log_History')
	Set @Purge_Date = (select cast (DATEADD(dd,-@Days,getdate()) as datetime))

Delete from sysssislog
	where endtime < @Purge_Date
	and not event in ('OnWarning', 'OnError')
End

Begin
	Set @Days = (Select parm_value from ref_Parameters where Parm_Name = 'ssis_Log_Error_History')
	Set @Purge_Date = (select cast (DATEADD(dd,-@Days,getdate()) as datetime))
 
	Delete from sysssislog
	where endtime <=(select cast (DATEADD(dd,-20,getdate()) as datetime))
	and  event in ('OnWarning', 'OnError')
End
GO
