SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
select * from ref_table_dictionary 
where Dest_tbl like '%pdc%'
order by etl_end_dt desc

Select * from aftcmsql02.analytics.dbo.ref_table_dictionary
Where dest_tbl like '%pdc%'
*/





CREATE view [dbo].[vw_IMPDWNLD_Ready] as


 With t1 as (
--select * from openquery(AP4PDC, 'Select * from pdcdata.impdwnld where dwn_flag =''C''')
select * from openquery(AP4PDC, 'Select * from pdcdata.impdwnld')
--Select * from AFTCMSQL02.Analytics.dbo.ref_Table_Dictionary
)

select 
tm.tbl_Key
, t1.SRC_TBL
, t1.Rec_Cnt
, t1.Dwn_Flag
, tm.dwn_Pkg
, tm.Priority
, tm.dwn_End_dt
, t1.flag_dt
from t1
inner join ref_Table_Dictionary tm
on  t1.src_tbl = tm.src_tbl 
where not tm.dwn_Flag in ('R', 'A', 'E', 'M')
and tm.Active = 'Y' 
--And (t1.flag_dt > tm.dwn_End_dt or dwn_End_dt is null)
And t1.Flag_dt>tm.dwn_End_Dt or tm.dwn_End_dt is null

--and not tm.dwn_End_dt >=CONVERT(date, getdate()) 




GO
