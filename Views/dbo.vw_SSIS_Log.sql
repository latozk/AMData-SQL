SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





/****** Script for SelectTopNRows command from SSMS  ******/

CREATE view [dbo].[vw_SSIS_Log] as
SELECT
ID
, Event
, Computer
, Source
, Starttime as Log_Time
, Message 
  FROM sysssislog
  Where not Source in ('proc_etl_monitor', 'proc_dwn_monitor')
 -- order by starttime desc 

  

GO
