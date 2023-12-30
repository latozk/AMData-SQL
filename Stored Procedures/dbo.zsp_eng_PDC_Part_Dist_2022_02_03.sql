SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




/****** Script for SelectTopNRows command from SSMS  ******/



CREATE PROCEDURE  [dbo].[zsp_eng_PDC_Part_Dist_2022_02_03] AS


TRUNCATE TABLE [AMData].[dbo].[eng_PDC_Part];
TRUNCATE TABLE [AMData].[dbo].[eng_PDC_Part_Dist];

---- =============================================
----Author: Newell, R
----Date: 2021-05-21
----Purpose: This procedure populates a table containing a unique list of all engineering PN and unit combinations currently having PDC distribution (whether distribution is driven by Agile Attributes or CORE Master List Divisions).
----Once the distribution table is populated, a second table is populated with just the PNs with current usage which require PDC support (a much smaller table).  These tables are preferred over views due to the amount of records involved.
----and will allow for faster Access queries when trying to identify PDC supported Parts.  
----Last modified date:
----Modification notes: 
---- =============================================

BEGIN
---Part I
With d1 AS
(
SELECT DISTINCT [PN]
,[Unit]
  FROM [dbo].[eng_PDC_Part_Dist_Agile]
  --WHERE PN='1522293'
UNION
SELECT DISTINCT [PN]
,[Unit]
  FROM [dbo].[eng_PDC_Part_Dist_CORE]
  --WHERE PN='1522293'
)
, d2 AS
(
SELECT DISTINCT [PN]
,[Unit]
FROM d1
GROUP BY [PN]
,[Unit]
)
INSERT INTO [dbo].[eng_PDC_Part_Dist]
SELECT DISTINCT [PN]
,[Unit]
FROM d2
;
---Part II
With p AS
(
SELECT DISTINCT [PN]
  FROM [dbo].[eng_PDC_Part_Dist]
  --WHERE PN='1522293'
)
INSERT INTO [AMData].[dbo].[eng_PDC_Part]
SELECT [PN]
FROM p
END
GO
