SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--exec sp_Proc_Load_Errors_Email 

CREATE Procedure [dbo].[zsp_Proc_Load_Errors_Email] as 
DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)

/*
DB_Name, tbl_key, dwn_flag, dwn_end_dt, etl_flag, etl_end_Dt
from vw_proc_load__errors

*/
SET @xml = CAST(( SELECT [DB_Name] AS 'td','',[tbl_Key] AS 'td','', [dwn_flag] AS 'td','', dwn_End_Dt as 'td', '', '', etl_Flag as 'td','', etl_End_Dt as 'td'
FROM aftcmsql02.analytics.dbo.vw_proc_load_errors   
FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))

SET @body ='<html><body><H3>Job_Name</H3>
<table border = 1> 
<tr>
<th> DB_Name </th> <th> tbl_Key </th> <th> dwn_Flag </th> <th> dwn_end_dt </th>  <th> etl_Flag </th>  <th> etl_End_Dt </th></tr>'    

SET @body = @body + @xml +'</table></body></html>'

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'AM-Email',
@body = @body,
@body_format ='HTML',
@recipients = 'kevin.latoz@hyster-yale.com',
@subject = 'Job Failures';


--EXEC msdb.dbo.sp_send_dbmail
--@profile_name = 'Am-Email',
--@body = @body,
--@body_format ='HTML',
--@recipients = 'PartsReadiness-PDCDanville@hyster-yale.com',
--@subject = 'AM Data Nightly Job Results';
GO
