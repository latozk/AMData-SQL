SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE view [dbo].[sys_Compare_Field_Doc] as 
-- =============================================
--Author: Latoz, K
--Date: 2020-03-27
--Description: This view compares actual field names in the database to those documented in
--in the sys_Master_Table_Detail table.  This helps to ensure good documentation.
--Last modified date: 
--Modification notes:
-- =============================================

SELECT t1.Table_Name
, t1.column_name
, t2.Destination_Tbl
, t2.Destination_Field 
FROM sys_db_Field t1
  Left outer Join sys_Master_Table_Detail t2 on
  t1.Table_Name = t2. Destination_Tbl and
  t1.COLUMN_NAME = t2.Destination_Field 
  where t1.table_type = 'Base Table' 
   And t2.Destination_field is null
  --order by t1.table_name, t1.column_name


--Fields in the documentation table that do not exist

--  SELECT t1.Table_Name
--, t1.column_name
--, t2.Destination_Tbl
--, t2.Destination_Field 
--FROM sys_Master_Table_Detail t2
--Left outer join sys_db_Fields t1 on 
--  t1.Table_Name = t2. Destination_Tbl and
--  t1.COLUMN_NAME = t2.Destination_Field 
--  where t1.table_type = 'Base Table' 
--   And t1.Column_Name is null
--  --order by t1.table_name, t1.column_name




--Tables in documentation table that are not in SQL

--  select * from sys_Master_Table_Load
--  where destination_Table not in
--  (select table_Name from sys_db_Fields


GO
