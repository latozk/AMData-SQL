SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

   CREATE View [dbo].[vw_UTIL_SSIS_Active_Summary] as
   With t1 as (
   SELECT execution_id ,DATEDIFF(HOUR , CAST(start_time AS DATETIME), GETDATE()) AS DurationHour, project_name , package_name
    FROM acmsqlprd2012.SSISDB.catalog.executions 
    WHERE [status] = 2 
	)

	Select package_name
	, Count(*) as Num_Active 
	From t1
	Group by package_name 
GO
