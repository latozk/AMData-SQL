SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--Find and end ssis that's been running > 1 hour
CREATE procedure [dbo].[sp_UTIL_End_SSIS_GT_1Hour] as 
DECLARE @exeID INT;
DECLARE @duration INT;
DECLARE @prj_name VARCHAR(100);
DECLARE @pckg_name VARCHAR(100);
 
DECLARE db_cursor CURSOR FOR
    SELECT execution_id ,DATEDIFF(HOUR , CAST(start_time AS DATETIME), GETDATE()) AS DurationHour, project_name , package_name
    FROM ACMSQLPRD2012.SSISDB.catalog.executions 
    WHERE [status] = 2 /* Running */
   ;-- AND DATEDIFF(HOUR , CAST(start_time AS DATETIME), GETDATE()) > 1;
 
OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @exeID , @duration , @prj_name , @pckg_name
WHILE @@FETCH_STATUS = 0
BEGIN
     
    EXEC ACMSQLPRD2012.SSISDB.[catalog].[stop_operation] @exeID;
 
  /*  declare @subject_text varchar(150), @body_text nvarchar(150);
    SET @body_text = 'SSIS Package Auto Kill, Project: ' + @prj_name + ', Package: ' + @pckg_name + ', Execution ID: ' + CAST(@exeID AS VARCHAR(50));
 
    exec usp_sqlmail
    @recipients = 'team@org.com',
    @subject = 'SSIS Package Auto Kill',
    @body  = @body_text;*/
 
    FETCH NEXT FROM db_cursor INTO @exeID , @duration , @prj_name , @pckg_name
END
CLOSE db_cursor
DEALLOCATE db_cursor
GO
