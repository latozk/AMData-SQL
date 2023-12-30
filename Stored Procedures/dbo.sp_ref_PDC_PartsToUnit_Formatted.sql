SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[sp_ref_PDC_PartsToUnit_Formatted] AS

EXEC sp_ref_PDC_Unit_Install_Base;

EXEC sp_ref_PDC_PartsToUnit_Formatted_non_TRD;

TRUNCATE TABLE dbo.ref_PDC_PartsToUnit_Formatted;


---- =============================================
----Author: Newell, R
----Date: 2021-09-28
----Purpose: Create a table containing all Parts to Unit information using Parts to Unit files from O'Neil and static data not included in the O'Neil files.
----Background:  Even though there is a PartsToUnit_US.txt file available, it does not include all of the units sold into the Americas.  However, the PartsToUnit_All.txt
----file does include all Americas units and all Europe units.
----Therefore, this process gets all PNs and unit pairs appearing in the PartsToUnit_All.txt file that are not in the PartsToUnit_Eur.txt file.  This information is combined
----with information in any static tables including information not contained in the O'Neil PartsToUnit text files.
----Lastly, an additional source is used to capture SPED Parts in CORE tied to Big or Jumbo trucks.
----Last modified date:
----Modification notes: 
----2021-09-21 
---- =============================================


--Gets PN to Unit Code relationships from all table sources.


--Part Group 1
--This section gets PN to Unit Code relationships from O'Neil's PartsToUnit_All.txt file while excluding those also in PartsToUnit_Europe.txt file.  
--Note:  Part to Unit relationships are captured this way since the PartsToUnit_US.txt file does not have all of the units the PDC needs to support.
WITH p1 AS
(
SELECT CASE
		WHEN LEN(a1.PartNumber)<7
		THEN Right('00000'+a1.PartNumber,7)
		ELSE a1.PartNumber
		END AS PartNumber
  , CASE
		WHEN LEN(a1.HysterPartNumber)<7
		THEN Right('00000'+a1.HysterPartNumber,7)
		ELSE a1.HysterPartNumber
		END AS HysterPartNumber
  , a1.YalePartNumber
  , LEFT(a1.UnitCode,4) AS UnitCode
  , CASE
		WHEN Len(a1.PartNumber)=9
		THEN 'Y'+a1.PartNumber
		WHEN Len(a1.PartNumber)<7
		THEN ' '+Right('00000'+a1.PartNumber,7)
		ELSE ' '+a1.PartNumber
		END AS PN
  , CASE
		WHEN Len(a1.PartNumber)<7
		THEN ' '+Right('00000'+a1.PartNumber,7)
		WHEN Len(a1.PartNumber)=7
		THEN ' '+a1.PartNumber
		ELSE NULL
		END AS H_PN
  , CASE
		WHEN Len(a1.PartNumber)<12
		THEN 'Y'+a1.PartNumber
		WHEN Len(a1.PartNumber)=12
		THEN a1.PartNumber
		ELSE NULL
		END AS Y_PN
  , CASE
		WHEN Len(a1.PartNumber)=9
		THEN 'Y'
		ELSE 'H'
		END AS Brand
	,e.PartNumber inEuropeFile
	FROM dbo.TRD_PartsToUnit_All a1
	LEFT JOIN dbo.TRD_PartsToUnit_Europe e 
	ON a1.PartNumber=e.PartNumber AND a1.UnitCode = e.UnitCode
	WHERE e.PartNumber Is Null
)
--Part Group 2
--This section gets static PN to Unit Code relationships not available in the O"Neil PartsToUnit_All.txt file.  
, p2 AS
(
SELECT a2.PartNumber
	, a2.HysterPartNumber
	, a2.YalePartNumber
	, a2.UnitCode
	, a2.PN
	, a2.H_PN
	, a2.Y_PN
	, LEFT(u.Brand,1) AS Brand
	FROM dbo.ref_PDC_PartsToUnit_Formatted_non_TRD a2
	LEFT JOIN dbo.ref_Unit u 
	ON a2.UnitCode=u.Unit
	LEFT JOIN p1
	ON a2.PartNumber=p1.PartNumber AND a2.UnitCode=p1.UnitCode
	WHERE p1.PartNumber Is Null
)
--Part Group 3
--This section gets SPED PNs (S% numbers) from CORE with usage on PDC Supported Big or Jumbo trucks. 
, c AS
(
SELECT Unit
 	 , Brand
  FROM dbo.ref_Unit
  WHERE [Group]='BT' OR [Group]='Jumbo' OR [Group]='VNA'
)
, p AS
(
SELECT PN
  FROM dbo.eng_Part_Master
  WHERE [Type]='P'
)
, k1 AS
(
SELECT DISTINCT cpu.KEY_1 AS PN
	 , cpu.Unit
  FROM dbo.eng_ECN_Tran_Usage cpu
  JOIN c
  ON cpu.Unit=c.Unit
  JOIN p
  ON cpu.KEY_1=p.PN
  WHERE cpu.KEY_1 Like 'S[0-9]%'
 )
, k3 AS
(
SELECT DISTINCT cpu.KEY_3 AS PN
	 , cpu.Unit
  FROM dbo.eng_ECN_Tran_Usage cpu
  JOIN c
  ON cpu.Unit=c.Unit
  JOIN p
  ON cpu.KEY_3=p.PN
  WHERE cpu.KEY_3 Like 'S[0-9]%'
 )
 , k AS
 (
SELECT k1.PN AS PartNumber
	 , k1.Unit AS UnitCode
  FROM k1
UNION
SELECT k3.PN AS PartNumber
	 , k3.Unit AS UnitCode
  FROM k3
)
, p3 AS
(
SELECT CASE WHEN c.Brand='Y'
	   THEN 'Y'+Right(k.PartNumber,11)
	   ELSE k.PartNumber
	   END AS PartNumber
	 , k.PartNumber AS HysterPartNumber
	 , 'Y'+Right(k.PartNumber,11) AS YalePartNumber
	 , k.UnitCode	 
	 , CASE WHEN c.Brand='Y'
	   THEN 'Y'+Right(k.PartNumber,11)
	   ELSE k.PartNumber
	   END AS PN
	 , k.PartNumber AS H_PN
	 , 'Y'+Right(k.PartNumber,11) AS Y_PN
	 , NULL AS Brand
  FROM k
  LEFT JOIN c
  ON k.UnitCode=c.Unit
    LEFT JOIN p1
  ON k.PartNumber=p1.PartNumber AND k.UnitCode=p1.UnitCode
  LEFT JOIN p2
  ON k.PartNumber=p2.PartNumber AND k.UnitCode=p2.UnitCode
  WHERE p1.PartNumber Is Null AND p2.PartNumber Is Null
)
--This section combines all PartToUnit data from the above sources.
----O'Neil PartsToUnit txt files
----Static PartsToUnit non_TRD table
----Parts on PDC Part master tied to BT or Jumbo trucks
----SPED PNs in CORE tied to BT or Jumbo trucks
, pf_all AS
(
SELECT PartNumber
	 , HysterPartNumber
	 , YalePartNumber
	 , UnitCode
	 , PN
	 , H_PN
	 , Y_PN
	 , Brand
	FROM p1
UNION
SELECT PartNumber
	 , HysterPartNumber
	 , YalePartNumber
	 , UnitCode
	 , PN
	 , H_PN
	 , Y_PN
	 , Brand
	FROM p2
UNION
SELECT PartNumber
	 , HysterPartNumber
	 , YalePartNumber
	 , UnitCode
	 , PN
	 , H_PN
	 , Y_PN
	 , Brand
	FROM p3
)
--Gets unique parts to unit information
, pf AS
(
Select Distinct *
From pf_all
)
--Gets PNs with duplicate Hyster and/or Yale crosses
, dup AS
(
SELECT PN
      ,PN_Brand
	  ,XPN_Brand
      ,COUNT(XPN_Brand) AS XPNCOUNT
  FROM dbo.ref_CORE_PN_XRef
  WHERE Status<>'CAN' AND (XPN_Brand='H' or XPN_Brand='Y')
  GROUP BY PN
  ,PN_Brand
  ,XPN_Brand
  HAVING COUNT(XPN_Brand)>1
)
--Gets min Cross PN when duplicate Hyster and/or Yale crosses exist
, m AS
(
SELECT dup.PN
	  ,dup.PN_Brand
	  ,dup.XPN_Brand
 	  ,Min(XPN) AS XPN
	  ,Min(XPNAS400Fmt) AS XPNAS400Fmt
FROM dup
JOIN dbo.ref_CORE_PN_XRef x1
ON dup.PN=x1.PN AND dup.PN_Brand=x1.PN_Brand AND dup.XPN_Brand=x1.XPN_Brand
GROUP BY dup.PN
      ,dup.PN_Brand
	  ,dup.XPN_Brand
)
--Gets PNs without duplicate Hyster and/or Yale crosses
, sing AS
(
SELECT PN
      ,PN_Brand
	  ,XPN_Brand
      ,COUNT(XPN_Brand) AS XPNCOUNT
  FROM dbo.ref_CORE_PN_XRef
  WHERE Status<>'CAN' AND (XPN_Brand='H' or XPN_Brand='Y')
  GROUP BY PN
      ,PN_Brand
      ,XPN_Brand
  HAVING COUNT(XPN_Brand)<2
)
--Gets cross for SPNs with single Hyster and/or Yale cross
, s AS
(
SELECT sing.PN
	  ,sing.PN_Brand
	  ,sing.XPN_Brand
	  ,XPN
	  ,XPNAS400Fmt
FROM sing
JOIN dbo.ref_CORE_PN_XRef x2
ON sing.PN=x2.PN AND sing.PN_Brand=x2.PN_Brand AND sing.XPN_Brand=x2.XPN_Brand
GROUP BY sing.PN
      ,sing.PN_Brand
	  ,sing.XPN_Brand
      ,XPN
      ,XPNAS400Fmt
)
--Gets all Hyster and Yale cross for all PNs
, x AS
(
SELECT PN
	  ,PN_Brand
	  ,XPN_Brand
	  ,XPN
	  ,XPNAS400Fmt
	  FROM m
UNION
SELECT PN
	  ,PN_Brand
	  ,XPN_Brand
	  ,XPN
	  ,XPNAS400Fmt
	  FROM s
)
--Gets single Hyster cross for all PNs
, h AS
(
SELECT PN
	 ,XPN_Brand
	 ,XPN
	 ,XPNAS400Fmt
FROM x
WHERE XPN_Brand='H'
)
--Gets single Yale cross for all PNs
, y AS
(
SELECT PN
	 ,XPN_Brand
	 ,XPN
	 ,XPNAS400Fmt
FROM x
WHERE XPN_Brand='Y'
)
, fe AS
(
SELECT m.Part_No AS PN
      ,Curr_Mo_Line_Ship AS LF
      ,Curr_Mo_Line_Ent AS LE
	  ,Vend
	  ,DS
	  ,[Status]
  FROM [dbo].[pdc_Monthend_Master] m
  JOIN [dbo].[ref_PDC_Part_Detail] pdc
  ON m.Part_No=pdc.PN
  WHERE Curr_Mo_Line_Ent>0
)
, pm AS
(
SELECT PN
      ,MTD_LF
      ,MTD_LE
	  ,[12_Mo_LF]
      ,[12_Mo_LE]
FROM dbo.ref_PDC_Part_Detail
)
--Gets Single Hyster and Single Yale cross for PartNumber when not supplied in O'Neil (TRD) PartsToUnit_Formatted file while including Unit Install Base
, t AS
(
SELECT DISTINCT PartNumber
	, CASE
	    WHEN HysterPartNumber IS NOT NULL
	    THEN HysterPartNumber
		WHEN HysterPartNumber IS NULL AND h.XPN_Brand='H'
	    THEN h.XPN
		ELSE NULL
		END AS HysterPartNumber
	, CASE
	    WHEN YalePartNumber IS NOT NULL
	    THEN YalePartNumber
		WHEN YalePartNumber IS NULL AND y.XPN_Brand='Y'
		THEN y.XPN
		ELSE NULL
		END AS YalePartNumber
	, UnitCode
	, pf.PN
	, CASE
	    WHEN HysterPartNumber IS NOT NULL
	    THEN ' '+HysterPartNumber
		WHEN HysterPartNumber IS NULL AND h.XPN_Brand='H'
		THEN h.XPNAS400Fmt
		ELSE NULL
		END AS H_PN
	, CASE
	    WHEN YalePartNumber IS NOT NULL AND YalePartNumber Not Like 'S%' AND YalePartNumber Not Like 'Y%'
	    THEN 'Y'+YalePartNumber
		WHEN YalePartNumber Like 'S%'
	    THEN 'Y'+Right(YalePartNumber,11)
		WHEN YalePartNumber IS NULL AND y.XPN_Brand='Y'
		THEN y.XPNAS400Fmt
		ELSE NULL
		END AS Y_PN
	, Brand
	, CAST(IB AS NUMERIC (9,2)) AS IB_Series
	, LF AS LF_Total
	, LE AS LE_Total
    , MTD_LF AS MTD_LF_Total
	, MTD_LE AS MTD_LE_Total
	, [12_Mo_LF] AS [12_Mo_LF_Total]
    , [12_Mo_LE] AS [12_Mo_LE_Total]
FROM pf
LEFT JOIN h
ON pf.PartNumber=h.PN
LEFT JOIN y
ON pf.PartNumber=y.PN
LEFT JOIN ref_PDC_Unit_Install_Base ib
ON pf.UnitCode=ib.Unit
LEFT JOIN pm
ON pf.PN=pm.PN
LEFT JOIN fe
ON Pf.PartNumber=fe.PN
)
, tot AS
(
SELECT PartNumber
	 , SUM(IB_Series) AS IB_Total
	  FROM t
GROUP BY PartNumber
)
--Adds Part Install Base and Series to Total Install Base Ratio
, totlfle AS
(
SELECT t.PartNumber
	 , UnitCode
	 , Brand
	 , HysterPartNumber
	 , YalePartNumber
	 , PN
	 , H_PN
	 , Y_PN
	 , t.IB_Series
	 , tot.IB_Total
	 , CASE
		WHEN tot.IB_Total=0 OR tot.IB_Total IS NULL
		THEN Null
		ELSE CAST((t.IB_Series / tot.IB_Total) AS Numeric (4,3))
    	END AS IB_Ratio
	 , t.LF_Total
	 , t.LE_Total
	 , t.MTD_LF_Total
	 , t.MTD_LE_Total
	 , t.[12_Mo_LF_Total]
	 , t.[12_Mo_LE_Total]
 FROM t
 LEFT JOIN tot
 ON t.PartNumber=tot.PartNumber
  --INTO dbo.ref_PDC_PartsToUnit_Formatted
 WHERE UnitCode <>'MILT'
 GROUP BY t.PartNumber
	 , UnitCode
	 , t.IB_Series
	 , tot.IB_Total
	 , t.MTD_LF_Total
	 , t.MTD_LE_Total
	 , t.LF_Total
	 , t.LE_Total
	 , t.[12_Mo_LF_Total]
	 , t.[12_Mo_LE_Total]
	 , HysterPartNumber
	 , YalePartNumber
	 , PN
	 , H_PN
	 , Y_PN
	 , Brand
)
, f AS
(
SELECT PartNumber
	 , UnitCode
	 , Brand
	 , HysterPartNumber
	 , YalePartNumber
	 , PN
	 , H_PN
	 , Y_PN
	 , IB_Series
	 , IB_Total
	 , IB_Ratio	
	 , LF_Total*IB_Ratio AS LF
	 , LE_Total*IB_Ratio AS LE
	 , LF_Total
	 , LE_Total
	 , MTD_LF_Total*IB_Ratio AS MTD_LF
	 , MTD_LE_Total*IB_Ratio AS MTD_LE	
	 , MTD_LF_Total
	 , MTD_LE_Total
	 , [12_Mo_LF_Total]*IB_Ratio AS [12_Mo_LF]	
     , [12_Mo_LE_Total]*IB_Ratio AS [12_Mo_LE]	
	 , [12_Mo_LF_Total]
	 , [12_Mo_LE_Total]
 FROM totlfle
   --INTO dbo.ref_PDC_PartsToUnit_Formatted
 GROUP BY PartNumber
	 , UnitCode
	 , IB_Series
	 , IB_Total
	 , IB_Ratio
	 , LF_Total
	 , LE_Total
	 , MTD_LF_Total
	 , MTD_LE_Total
	 , [12_Mo_LF_Total]
	 , [12_Mo_LE_Total]
	 , HysterPartNumber
	 , YalePartNumber
	 , PN
	 , H_PN
	 , Y_PN
	 , Brand
)
, ulfle AS
(
SELECT UnitCode
	 , SUM(LF) AS LF_Series
	 , SUM(LE) AS LE_Series
	 , SUM(MTD_LF) AS MTD_LF_Series
	 , SUM(MTD_LE) AS MTD_LE_Series
	 , SUM([12_Mo_LF]) AS [12_Mo_LF_Series]
	 , SUM([12_Mo_LE]) AS [12_Mo_LE_Series]
FROM f
GROUP BY UnitCode
)

INSERT INTO dbo.ref_PDC_PartsToUnit_Formatted
SELECT DISTINCT PartNumber
	 , f.UnitCode
	 , Brand
	 , HysterPartNumber
	 , YalePartNumber
	 , PN
	 , H_PN
	 , Y_PN
	 , IB_Series
	 , IB_Total
	 , IB_Ratio	
	 , LF
	 , LE
	 , LF_Total
	 , LE_Total
	 , LF_Series
	 , LE_Series
	 , CASE
		WHEN LE_Series=0 OR LE_Series IS NULL
		THEN Null
		ELSE (LF_Series / LE_Series) 
    	END AS Series_Fill
	 , MTD_LF
	 , MTD_LE	
	 , MTD_LF_Total
	 , MTD_LE_Total
	 , MTD_LF_Series
	 , MTD_LE_Series
	 , CASE
		WHEN MTD_LE_Series=0 OR MTD_LE_Series IS NULL
		THEN Null
		ELSE (MTD_LF_Series / MTD_LE_Series) 
    	END AS MTD_Series_Fill
	 , [12_Mo_LF]	
     , [12_Mo_LE]	
	 , [12_Mo_LF_Total]
	 , [12_Mo_LE_Total]
	 , [12_Mo_LF_Series]
	 , [12_Mo_LE_Series]
	 , CASE
		WHEN [12_Mo_LE_Series]=0 OR [12_Mo_LE_Series] IS NULL
		THEN Null
		ELSE ([12_Mo_LF_Series] / [12_Mo_LE_Series])
    	END AS [12_Mo_Series_Fill]
FROM f
LEFT JOIN ulfle
ON f.UnitCode=ulfle.UnitCode
GROUP BY f.UnitCode
	 , PartNumber
	 , Brand
	 , HysterPartNumber
	 , YalePartNumber
	 , PN
	 , H_PN
	 , Y_PN
	 , IB_Series
	 , IB_Total
	 , IB_Ratio	
	 , LF
	 , LE	
	 , LF_Total
	 , LE_Total
	 , LF_Series
	 , LE_Series
	 , MTD_LF
	 , MTD_LE	
	 , MTD_LF_Total
	 , MTD_LE_Total
	 , MTD_LF_Series
	 , MTD_LE_Series
	 , [12_Mo_LF]	
     , [12_Mo_LE]	
	 , [12_Mo_LF_Total]
	 , [12_Mo_LE_Total]
	 , [12_Mo_LF_Series]
	 , [12_Mo_LE_Series];
	
EXEC sp_ref_PDC_Demand_Class;


GO
