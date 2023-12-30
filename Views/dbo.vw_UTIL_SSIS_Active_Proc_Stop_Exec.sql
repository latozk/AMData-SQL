SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


Create view [dbo].[vw_UTIL_SSIS_Active_Proc_Stop_Exec] as

/*
This will return a list of running SSIS packages by creating an EXEC command to stop 
them.  You then take the returned list and copy it to a query window (can use this one)
and hit Execute.  

*/

--Use SSISDB

SELECT 'exec [catalog].[stop_operation] ' + CAST(operation_id as varchar(10)) as Exec_Command
  FROM [SSISDB].[internal].[operations]

  where status = 2
/* These were created from a runaway example
exec [catalog].[stop_operation] 638556
exec [catalog].[stop_operation] 638559

*/
GO
