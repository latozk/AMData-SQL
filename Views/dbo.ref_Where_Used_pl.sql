SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- =============================================
--Author: Newell, R
--Date: 2021-09-09
--Purpose:	This view displays part where and when used information for PDC supported units.  
--This information if analyzed further can provide a more accurate RYOS values for parts (by using part removed dates) than what is determined by only using a trucks last build date. 
--To determine RYOS, results should be grouped by PN and analyzed.
-----If any PN record indicates there is Current Usage then RYOS cannot be determined (RYOS can only be found once the part is no longer used on any PDC supported units).
-----If there is a Parent_PS_REM_Dt, the part has been removed from the parent on the unit and division listed and should have the Support_Req years added to the date to find a "support through date".
-----If there is no Parent_PS_REM_Dt and there is a Last_Build_Dt, then the Support_Req years should be added to it to find a "support through date".
-----Each records should then have a support through date or be flagged with Current Usage.
-----Each part group should be analyzed to find the greatest "support through date".
-----The RYOS can be calculated by subtracting the current date from the "support through date".
--Last modified date:
--Modification notes:

-- =============================================
CREATE VIEW [dbo].[ref_Where_Used_pl] AS

SELECT DISTINCT pl.PN AS Part
	  , c1.Key_1 AS Parent1 
	  , s1.[ECN_Add_DT] AS Parent_PS_ADD_Dt
      , s1.[ECN_Rem_DT] AS Parent_PS_REM_Dt
	  , c1.PN AS List1
	  , s2.[ECN_Add_DT] AS List_PS_ADD_Dt
      , s2.[ECN_Rem_DT] AS List_PS_REM_Dt
	  , c1.Unit
	  , c1.Div
	  , u.Last_Build_Dt AS Last_Build_Dt
	  , u.Class
	  , u.Support
	  , CASE
			WHEN u.Class='3'
			THEN '7'
			WHEN u.Capacity_US_Min>=16000
			THEN '15'
			ELSE '10'
			END AS Support_Req
FROM dbo.inp_Picklist_Where_Used pl
LEFT JOIN eng_Part_Unit_Contract_Div c1
ON pl.PN=c1.Key_3
LEFT JOIN ref_Unit u
ON c1.unit=u.unit
--/ Join used to get ADD/REM dates when Component (Key_3) and Parent (Key_1) equal PS Component (Comp) and Parent (PN)
LEFT JOIN eng_Product_Structure s1
ON c1.Key_1=s1.PN and c1.Key_3=S1.Comp
--/ Join used to get ADD/REM dates when Component's parent (Key_1) and Parent List (PN) equal PS Component (Comp) and Parent (PN)
LEFT JOIN eng_Product_Structure s2
ON c1.PN=s2.PN and c1.Key_3=S2.Comp
WHERE c1.UNIT > ''

GO
