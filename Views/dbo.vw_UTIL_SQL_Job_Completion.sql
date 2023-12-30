SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










CREATE view [dbo].[vw_UTIL_SQL_Job_Completion] as

SELECT substring(sj.name, 1,30) as Job_Name,
		(Select TheDate from ref_Calendar where YYYYMMDD=sh.run_date) as run_Date,
		substring(sh.step_name,1, 40) as Step_Name,
		Case	
			When run_status=1 Then 'Success'
			Else 'Failed'
		end as Completion_Status ,
		(Select Time30 from ref_time where timeAltKey = run_time) as Run_Time 
		--, run_duration, 
		--STUFF(STUFF(RIGHT(REPLICATE('0', 6) +  CAST(sh.run_time as varchar(6)), 6), 3, 0, ':'), 6, 0, ':') 'run_time   ',
		, STUFF(STUFF(STUFF(RIGHT(REPLICATE('0', 8) + CAST(sh.run_duration as varchar(8)), 8), 3, 0, ':'), 6, 0, ':'), 9, 0, ':') 'run_duration'
FROM msdb.dbo.sysjobs sj
JOIN msdb.dbo.sysjobhistory sh
ON sj.job_id = sh.job_id
where substring(sj.name,1,6)='AMData'
--and run_date>= replace(CONVERT(DATE, GETDATE()), '-', '')  --date --'20200825'
and not Step_Name = '(Job outcome)'
and not sj.name like '%Monitor%'
and not sj.name = 'AMData_Source_Download_Ready'
--and not sj.Name like '%Download%'
--Order by Run_Status, sj.name 
--and run_status=0

--select * from vw_UTIL_job_Failures


GO
