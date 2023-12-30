SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
--Author: Latoz, K
--Date: 2020-03-01
--Purpose: This view shows information from the last data load for each table
--         It calculates amount of time for the load along with 
--         source and destination record differences and "new records" against the 
--         previous sql record count.  
--         NOTE: PrevSQLRecCount data is generated at the end of the previous run.  
--               If there was a problem with the previous run this number could be inaccurate.
--               It's future purpose will be to determine if record counts are reasonable - i.e. the number should never be negative.
--Last modified date:
--Modification notes:
-- =============================================

CREATE view [dbo].[sys_Table_Load_Info] as
SELECT [Source_System]
      ,[Source_Library]
      ,[Source_Table]
      ,[Description]
      ,[Destination_System]
      ,[Destination_DB]
      ,[Destination_Table]
      ,[StartLoad]
      ,[LastLoadDate]
    --, DATEDIFF(second, startload, lastloaddate) / 60 as Load_time  
      , DATEDIFF(second, startload, lastloaddate) as Load_Seconds
      ,[SourceRecCount]
      ,[DestRecCount]
      , PrevSQLRecCount
	  , (DestRecCount - SourceRecCount) as RecDiff
      , destreccount - prevSQLRECCount as NewRecs
      ,[ReadyToLoad]
  FROM sys_Master_Table_Load
  --Order by LastLoadDate




GO
