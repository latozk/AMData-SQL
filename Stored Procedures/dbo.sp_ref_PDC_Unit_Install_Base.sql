SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
--Author: Newell, R
--Date: 2021-09-29
--Purpose:	This procedure creates a table containing units sold into the Americas and requiring PDC support.  The table is to contain the total install base for each unit as well as the install base for each supported market area for each unit.
--			
--Last modified date:
--Modification notes:

-- =============================================



CREATE PROCEDURE [dbo].[sp_ref_PDC_Unit_Install_Base] AS

TRUNCATE TABLE [dbo].[ref_PDC_Unit_Install_Base];


With a AS
--Gets all NA and LAM installed SNs with their installation dates.
(
SELECT Left(Unit_Serial_Number,4) AS Series_Code
     , CASE
	    WHEN Marketing_Group='-'
		THEN '-'
		WHEN Marketing_Group<>'-'
		THEN Right('00' + Marketing_Group,3) 
		END AS MktGrp3
     ,Unit_Serial_Number
     ,Install_Date
  FROM dbo.ref_PDC_Americas_Units_1st_Installation
  WHERE Unit_Serial_Number>'A'
 --GROUP [BY Install_Date], [Marketing_Group], [Unit_Serial_Number]
)
, f AS
--Gets the first installation date for each SN since trucks can lbe installed more than once and the first date would be closest to the build date.
(
SELECT Unit_Serial_Number
	  ,Max(Install_Date) AS Install_Date
  FROM a
  GROUP BY Unit_Serial_Number
)
, i AS
--Gets the first installation date and Market Group for each SN since trucks can lbe installed more than once and the first date would be closest to the build date.
(
SELECT DISTINCT a.Series_Code
	 , a.MktGrp3
	 , a.Unit_Serial_Number
	, a.Install_Date
  FROM a
  JOIN f
  ON a.Unit_Serial_Number=f.Unit_Serial_Number AND a.Install_Date=f.Install_Date
)
, maib AS
--Gets install base for a series in a market area.
(
SELECT Series_Code
	 , Count(Series_Code) AS MktGrpIB
	 , i.MktGrp3
	 , SupptLvlCd
	 , SupptLvlDesc
  FROM i
  LEFT JOIN ref_PDC_Support_by_Market_Area s
  ON i.MktGrp3=s.MktGrp3
  GROUP BY Series_Code
	 , i.MktGrp3
	 , SupptLvlCd
	 , SupptLvlDesc
  --HAVING SupptLvlCd<99
)
, totib AS
--Gets total install base for a series (for all market areas).
(
SELECT Series_Code
	 , sum(MktGrpIB) AS TotIB
  FROM maib
  GROUP BY Series_Code
)
INSERT INTO dbo.ref_PDC_Unit_Install_Base
SELECT maib.Series_Code As Unit
	 , totib.TotIB AS IB
	 , maib.MktGrpIB
	 , maib.MktGrp3
	 , SupptLvlDesc AS MktSupptReq
	 , SupptLvlCd AS MktSupptReqCd
	 , u.Support AS UnitSuppt
	 --INTO dbo.ref_PDC_Unit_Install_Base
	 FROM maib
	 JOIN totib
	 ON maib.Series_Code=totib.Series_Code
	 LEFT JOIN ref_Unit u
	 ON maib.Series_Code=u.Unit
	 GROUP BY maib.Series_Code
	 , totib.TotIB
	 , maib.MktGrpIB
	 , maib.MktGrp3
	 , SupptLvlDesc
	 , SupptLvlCd
	 ,u.Support


GO
