SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 Create View [dbo].[vw_sys_SSIS_Active_Pkgs] as 
--DECLARE db_cursor CURSOR FOR
    SELECT execution_id ,DATEDIFF(HOUR , CAST(start_time AS DATETIME), GETDATE()) AS DurationHour, project_name , package_name
    FROM ACMSQLPRD2012.SSISDB.catalog.executions 
    WHERE [status] = 2 /* Running */
    AND DATEDIFF(HOUR , CAST(start_time AS DATETIME), GETDATE()) > 1;
GO
