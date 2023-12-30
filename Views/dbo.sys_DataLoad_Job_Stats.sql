SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
--Author: Latoz, K
--Date: 2020-03-01
--Description: Show start date/time and end date/time of last daily run

--Last modified date:
--Modification notes:
-- =============================================

CREATE view [dbo].[sys_DataLoad_Job_Stats] as 
 with t1 as (
 select min(startload) JobStart
 , max(lastloaddate) JobEnd
 from sys_Master_Table_Load
 where not startload is null 
 )
 Select t1.JobStart
 , t1.Jobend
 , DATEDIFF(second, t1.JobStart, t1.JobEnd)/60 as JobMins
 From t1


GO
