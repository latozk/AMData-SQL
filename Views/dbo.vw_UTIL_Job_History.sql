SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE view [dbo].[vw_UTIL_Job_History] as

SELECT substring(sj.name, 1,30) as Job_Name,
		sh.run_date,
		substring(sh.step_name,1, 40) as Step_Name,
		Case	
			When run_status=1 Then 'Success'
			Else 'Failed'
		end as Completion_Status ,
		STUFF(STUFF(RIGHT(REPLICATE('0', 6) +  CAST(sh.run_time as varchar(6)), 6), 3, 0, ':'), 6, 0, ':') 'run_time   ',
		STUFF(STUFF(STUFF(RIGHT(REPLICATE('0', 8) + CAST(sh.run_duration as varchar(8)), 8), 3, 0, ':'), 6, 0, ':'), 9, 0, ':') 'run_duration'
FROM msdb.dbo.sysjobs sj
JOIN msdb.dbo.sysjobhistory sh
ON sj.job_id = sh.job_id
where substring(sj.name,1,6)='AMData'
--and run_date>= replace(CONVERT(DATE, GETDATE()), '-', '')  --date --'20200825'
--Order by Run_Status, sj.name 
--and run_status=0

--select * from sys_job_Failures

--order by job_name

GO
