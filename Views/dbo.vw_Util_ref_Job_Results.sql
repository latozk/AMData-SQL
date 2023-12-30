SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE View [dbo].[vw_Util_ref_Job_Results] as 
select tbl_key
, isnull(Prev_Dwn_Rec_Cnt,0) as Prev_Dwn_Rec_Cnt--src_rec_Cnt
, isnull(etl_Rec_Cnt,0) as etl_Rec_Cnt
--, isnull(dwn_Flag,'') as dwn_Flag 
, isnull(etl_Flag,'') as Job_Status
--, dwn_end_dt
, etl_End_dt
from ref_table_Dictionary
Where Active = 'Y'
GO
