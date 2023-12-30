SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE view [dbo].[sys_db_Object] as 
with t1 as (
SELECT 
Name
, Type
, Type_Desc
, create_Date
, Modify_Date
FROM sys.objects 
WHERE SCHEMA_NAME(schema_id) <> 'sys'  
AND is_ms_shipped = 0  
AND parent_object_id NOT IN (
 SELECT object_id  
 FROM sys.objects  
 WHERE SCHEMA_NAME(schema_id) = 'sys'  
        OR is_ms_shipped = 1)
and not type in ( 'PK', 'd')
)

--insert into sys_master_object_doc
Select 
 'ACCSQLPRD2012' as Sys_Name
, 'AMData' as DB
, t1.name as Obj_Name 
, t1.Type_Desc as Obj_Type
, la.last_access 
, Create_Date
, modify_date
,d.Description
, d.Source_System
,d.Source_Library
, d.Source_Table, d.StartLoad
,d.LastLoadDate
, d.SourceRecCount
, d.DestRecCount
, d.PrevSqlRecCount
, d.ReadyToLoad
From t1  Left outer Join sys_Master_Table_Load d
on t1.Name = d.Destination_Table
left outer join sys_table_Last_Access la
on d.Destination_Table=la.table_name 
--Order by t1.Type_Desc 

GO
