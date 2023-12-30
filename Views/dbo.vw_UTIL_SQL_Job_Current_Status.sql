SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE view [dbo].[vw_UTIL_SQL_Job_Current_Status] as    
        select 
        name
        , enabled
        , [description]
        , last_executed_step_date
        , job_history_id
        , Next_Scheduled_run_Date 
        from msdb.dbo.sysjobs_view job  
        inner join msdb.dbo.sysjobactivity activity on job.job_id = activity.job_id 
       where  
       job.name like 'AMData%'

GO
