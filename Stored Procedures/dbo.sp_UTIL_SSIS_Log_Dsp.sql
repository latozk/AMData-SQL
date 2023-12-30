SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[sp_UTIL_SSIS_Log_Dsp] as 
Select * from vw_Proc_Status 
;

select * from vw_Monitor_Status
;
SELECT *
  FROM vw_SSIS_Log
  where not source in ('proc_dwn_Monitor', 'proc_etl_Monitor')
  Order by ID desc 
;
  --exec x_SSIS_Log_Dsp 




GO
