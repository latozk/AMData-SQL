SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[sp_Util_Email_Stored_Procedure_Results] as 
DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)

SET @xml = CAST(( SELECT [Job_Name] AS 'td','',[Run_Date] AS 'td','', [Step_Name] AS 'td','', Completion_Status AS 'td', '', Run_Time as 'td', '', Run_Duration as 'td' 
FROM sys_Job_Failures  
ORDER BY Job_Name  
FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))

SET @body ='<html><body><H3>AMData Stored Procedure Results</H3>
<table border = 1> 
<tr>
<th> Job_Name </th> <th> Run_Date </th> <th> Step_Name </th> <th> Completion_Status </th> <th> Run_Time <th> Run_Duration </th></tr>'    

SET @body = @body + @xml +'</table></body></html>'

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'Am-Email',
@body = @body,
@body_format ='HTML',
@recipients = 'AMDataSQLNotifications@hyster-yale.com',
@subject = 'AM Data Nightly Stored Procedure Results';
GO
