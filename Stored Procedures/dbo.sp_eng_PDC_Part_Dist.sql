SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/



CREATE PROCEDURE  [dbo].[sp_eng_PDC_Part_Dist] AS


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
With aptu AS
---Gets Agile PartToUnit information but excludes PN-Mast info as Masts distribution in controlled in CORE.
(
SELECT DISTINCT a.[PN]
	  ,a.[Unit]
  FROM [dbo].[eng_PDC_Part_Dist_Agile] a
  LEFT JOIN ref_eng_Mast_Unit mu
  ON a.Unit=mu.MastCode
  WHERE mu.MastCode IS NULL
      --AND a.PN='4247511'
)
, cptu AS
---Gets CORE PartToUnit information but excludes PN-Mast info.
(
SELECT DISTINCT c.[PN]
	  ,c.[Unit]
  FROM [dbo].[eng_PDC_Part_Dist_CORE] c
  LEFT JOIN ref_eng_Mast_Unit mu
  ON c.Unit=mu.MastCode
  WHERE mu.MastCode IS NULL
    --AND c.PN='4247511'
)
, cptmu AS
---Gets CORE PartToUnit information by replacing mast codes with unit codes in PN-Mast relationships.
(
SELECT DISTINCT c.[PN]
	  --,Unit
	  ,mu.UnitCode AS Unit
  FROM [dbo].[eng_PDC_Part_Dist_CORE] c
  JOIN ref_eng_Mast_Unit mu
  ON c.Unit=mu.MastCode
      --WHERE c.PN='4247511'
)
---Gets PDC Parts to Unit relationships from CORE and Agile. Results do not contain mast codes
---but rather the unit codes the masts are used on.
---Reason for replacing Mast codes with Corresponding unit codes is the Aftermarket has
---is not able to track last build dates of mast units. 
, d1 AS --Agile and CORE Unit distribution and CORE Unit distribution from Masts
(
SELECT [PN]
,[Unit]
  FROM aptu --Agile Parts to Unit
  --WHERE PN='1522293'
UNION
SELECT [PN]
,[Unit]
  FROM cptu --CORE Parts to Unit
  --WHERE PN='1522293'
UNION
SELECT [PN]
,[Unit]
  FROM cptmu --CORE Parts to Unit by way of Parts to Mast (Parts to Mast converted to Parts to Unit using Mast to Unit cross reference)
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
  --WHERE PN='4247511'
  --WHERE PN='1522293'
)
INSERT INTO [AMData].[dbo].[eng_PDC_Part]
SELECT [PN]
FROM p
END
GO
