SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [dbo].[vw_UTIL_Table_Load_Status] as
select 
tbl_key
, dwn_flag
, dwn_end_dt
, etl_flag
, etl_End_dt
, src_tbl
, dest_tbl
, src_rec_cnt
, dwn_rec_cnt
, prev_dwn_rec_cnt
, dwn_flag_dt
, dwn_start_dt


, etl_flag_dt
, etl_Start_dt

, etl_Rec_Cnt

from ref_table_dictionary 
where active = 'y'
--order by etl_end_dt desc 
GO
