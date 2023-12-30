SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--exec sp_AMData_Job_Email

CREATE Procedure [dbo].[sp_Util_Daily_Download_Status] as 
DECLARE @xml NVARCHAR(MAX)
DECLARE @body NVARCHAR(MAX)

SET @xml = CAST(( SELECT [tbl_Key] AS 'td','',[Prev_Dwn_Rec_Cnt] AS 'td','', [etl_rec_Cnt] AS 'td','', Job_Status as 'td', '', '', etl_End_Dt as 'td'
FROM vw_Util_Ref_Job_Results    
FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))

SET @body ='<html><body><H3>Job_Name</H3>
<table border = 1> 
<tr>
<th> tbl_Key </th> <th> Prev Rec Cnt </th> <th> Rec Cnt </th>  <th> Job Status </th>  <th> etl_End_Dt </th></tr>'    

SET @body = @body + @xml +'</table></body></html>'

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'AM-Email',
@body = @body,
@body_format ='HTML',
@recipients ='AMDataSQLNotifications@hyster-yale.com',
@subject = 'AMData Nightly Data Load';


--EXEC msdb.dbo.sp_send_dbmail
--@profile_name = 'Am-Email',
--@body = @body,
--@body_format ='HTML',
--@recipients = 'PartsReadiness-PDCDanville@hyster-yale.com',
--@subject = 'AM Data Nightly Job Results';

-- 'AMDataSQLNotifications@hyster-yale.com'
GO
