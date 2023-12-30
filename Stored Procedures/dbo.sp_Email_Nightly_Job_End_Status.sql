SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[sp_Email_Nightly_Job_End_Status] as
EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'Am-Email',
@recipients = 'kevin.latoz@hyster-Yale.com',
@query = 'SELECT * from amdata.dbo.sys_Job_Failures',
@subject = 'AM Data Nightly Job Results',
@attach_query_result_as_file = 1,
@body='test';
GO
