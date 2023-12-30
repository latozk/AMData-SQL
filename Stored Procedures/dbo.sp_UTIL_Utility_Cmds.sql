SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure  [dbo].[sp_UTIL_Utility_Cmds] as


--SELECT db_name(dbid) as DB,
--count(dbid) as Connections,
--loginame as Login
--FROM sys.sysprocesses
--WHERE dbid > 0
--GROUP BY dbid, loginame
--ORDER BY DB



----Kill connection
--alter database <amdata> set restricted_user with rollback immediate

----Return to multi-user
--alter database <dbname> set multi_user




----This will terminate connections, rollback their transactions, and take the database offline.
--alter database Amdata set offline with rollback immediate


----See running processes
--SELECT sqltext.TEXT,
--req.session_id,
--req.status,
--req.start_time,
--req.command,
--req.cpu_time,
--req.total_elapsed_time
--FROM sys.dm_exec_requests req
--CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext 


----Change location of data files
--ALTER DATABASE AMData  
--    MODIFY FILE ( NAME = AMData,   
--                  FILENAME = 'E:\SQL_Data_Files\AMData.mdf');  
--GO
 
--ALTER DATABASE AMData  
--    MODIFY FILE ( NAME = AMData_Log,   
--                  FILENAME = 'D:\SQL_Log_Files\AMData_Log.ldf'); 



----sys_Master_Table_Load
--  With t1 as (
--  select * from openquery(ac4prod_gdc, 'SELECT 
--WHSYSN
--, WHLIB
--,  WHFILE
--, WHTEXT
--  FROM apklatoz.EWACREP_kl')
--  )

--  Insert into sys_Master_Table_Load 
-- select distinct t1.WHSYSN as Source_System
--, t1.whlib as Source_Library
--, t1.whfile as Source_Table
--, 'ACMSQLPRD2012' as Destination_System
--, 'AMDATA' as Destination_DB
--, 'eng_Part_Master_Ext_2' as Destination_Table
--, t1.whtext as Description
--, Null as StartLoad
--, Null as LastLoadDate
--, Null as SourceRecCount
--, Null as DestRecCount
--, Null as PrevSQLRecCount
--, 1 as ReadyToLoad
--from t1





----sys_Master_Table_Detail
--  With t1 as (
--  select * from openquery(ac4prod_gdc, 'SELECT 
--  WHFILE
-- , WHFLDE
-- , WHFOBO

-- , WHFTXT
-- , WHCHD1
-- , WHFLDT
--  , WHFLDB
-- --, WHFLDI
--  FROM apklatoz.EWACREP_kl')
--  )
--  Insert into sys_Master_Table_Detail 
--  Select 'AMData' as Destination_DB -- 
--    , 'eng_Part_Master_Ext_2' as destination_tbl
--	  , t1.whftxt as destination_Field 
--	   , whflde as Source_Field
-- , t1.whfobo as tbl_Ord_No
--  , Null as fld_Length
--  ,  whftxt as Fld_Desc
--, '' as Col_Head_1
-- , '' as Col_Head_2
--   , '' as Fld_Type  
--   from t1
GO
