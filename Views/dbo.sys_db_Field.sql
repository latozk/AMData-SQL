SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
--Author: Latoz, K
--Date: 2020-03-01
--Description: This view returns all field names currently in the AMData tables.  
--         It pulls from the Information_Schema.Columns so it shows actual current fields
--Last modified date: 2020-03-25
--Modification notes:Added linke to Information_Schema.Tables so could determine Table or View 
-- =============================================

CREATE view [dbo].[sys_db_Field] as
 SELECT 
       c.TABLE_NAME
	   , t.table_type 
	   , COLUMN_NAME 
	   , ORDINAL_POSITION as Position
      -- , COLUMN_DEFAULT 
       , DATA_TYPE  
       , CHARACTER_MAXIMUM_LENGTH as Max_Len
       , NUMERIC_PRECISION as Precision
       --, NUMERIC_PRECISION_RADIX 
       , NUMERIC_SCALE as Scale
    --   , DATETIME_PRECISION
FROM   INFORMATION_SCHEMA.COLUMNS  c
	inner join INFORMATION_SCHEMA.TABLES t 
	on c.table_name=t.table_name 
GO
