SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [dbo].[vw_Monitor_Status] as    
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
       job.name in ('PDCDATA_proc_dwn_Monitor' , 'pdcdata_Proc_Etl_Monitor', 'PDCDATA_IMPDWNLD_Monitor')

GO
