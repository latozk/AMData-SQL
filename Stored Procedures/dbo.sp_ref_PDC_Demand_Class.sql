SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--For SPN Implemetation, look for the following to make changes (2 places):
--Uncomment with implementation of SPN

-- =============================================
--Author: Newell, R
--Date: 2021-10-18
--Purpose:	This procedure creates a table containing Demand Class information by PN for Servigistics. 
--The Demand Class information is to be exported to each evening just prior to the job that uses the file. 
--Below is a sample of the fixed width data format.
--------Data Sample
--------NMH-0000125                   000014    JUMBO                                                                           
--------NMH-0000126                   000014    JUMBO                                                                           
--------NMH-0000138                   000014    BT                                                                              
--------NMH-0000139                   000014    JUMBO                                                                           
--------NMH-0000141                   000014    NP                                                                              
--------NMH-0000142                   000014    BT                                                                              
--------NMH-0000153                   000014    NP                                                                              
--------NMH-0000172                   000014    NP                                                                              
--Last modified date:
--Modification notes:

-- =============================================

CREATE PROCEDURE [dbo].[sp_ref_PDC_Demand_Class] AS

--Procedure sp_ref_PDC_Demand_Class_Groups needs to run before procedure sp_ref_PDC_Demand_Class_Groups_Uniques.
EXEC sp_ref_PDC_Demand_Class_Groups;
EXEC sp_ref_PDC_Demand_Class_Group_Uniques;

TRUNCATE TABLE [dbo].[ref_PDC_DC];

--2023-09-28 Added the following (and other changes with this date) as part of the code needed to empty and repopulate the 
--Orderable SPN table so it can be used to substitute SPNs in for replace PNs in the Demand Class table with Orderable SPNs.
--Tested with the following SPNs '0000125', '0000126', '0000138' and '0000139'

--Uncomment with implementation of SPN
----Truncate Table ref_PDC_SPN_Orderable;

----Insert Into ref_PDC_SPN_Orderable

----Select *
 
----from openquery
----(
----    [ACMAMSQLP1\AMPARTS],
----    'SELECT DISTINCT 
----         SPN
----    , Mimic_PN
----    , Date
----FROM PDCData.dbo.SPN_Ready'  
----)
----;

--Gets Jumbo truck parts.
With a AS
(
SELECT PN
 	 , 'Jumbo' AS Class
FROM dbo.ref_PDC_DC_Jumbo j
)

--Gets Gets Big truck parts not used on Jumbo trucks.
, b AS
(
SELECT bt.PN
	 , 'BT' AS Class
FROM dbo.ref_PDC_DC_BT bt
LEFT JOIN a
ON a.PN=bt.PN
WHERE a.PN IS NULL
)
--Gets Warehouse Warriors truck parts not used on Jumbo or Big trucks.
, c AS
(
SELECT ww.PN
	 , 'WW' AS Class
FROM dbo.ref_PDC_DC_WW ww
LEFT JOIN a
ON a.PN=ww.PN
LEFT JOIN b
ON b.PN=ww.PN
WHERE a.PN IS NULL AND b.PN IS NULL
)
--Gets VNA truck parts not used on Jumbo, Big or Warehouse Warriors trucks.
, d AS
(
SELECT vna.PN
	 , 'VNA' AS Class
FROM dbo.ref_PDC_DC_VNA vna
LEFT JOIN a
ON a.PN=vna.PN
LEFT JOIN b
ON b.PN=vna.PN
LEFT JOIN c
ON c.PN=vna.PN
WHERE a.PN IS NULL AND b.PN IS NULL AND c.PN IS NULL
)
--Gets UTILEV truck parts not used on Jumbo, Big, Warehouse Warriors or VNA trucks.
, e AS
(
SELECT u.PN
	 , 'UTILEV' AS Class
FROM dbo.ref_PDC_DC_UTILEV u
LEFT JOIN a
ON a.PN=u.PN
LEFT JOIN b
ON b.PN=u.PN
LEFT JOIN c
ON c.PN=u.PN
LEFT JOIN d
ON d.PN=u.PN
WHERE a.PN IS NULL AND b.PN IS NULL AND c.PN IS NULL AND d.PN IS NULL
)
--Gets EURtoAM truck parts not used on Jumbo, Big, Warehouse Warriors, VNA or UTILEV trucks.
, f AS
(
SELECT ea.PN
	 , 'EURtoAM' AS Class
FROM dbo.ref_PDC_DC_EURtoAM ea
LEFT JOIN a
ON a.PN=ea.PN
LEFT JOIN b
ON b.PN=ea.PN
LEFT JOIN c
ON c.PN=ea.PN
LEFT JOIN d
ON d.PN=ea.PN
LEFT JOIN e
ON e.PN=ea.PN
WHERE a.PN IS NULL AND b.PN IS NULL AND c.PN IS NULL AND d.PN IS NULL AND e.PN IS NULL
)
--Gets NP truck parts not used on Jumbo, Big, Warehouse Warriors, VNA, UTILEV or EURtoAM trucks.
, g AS
(
SELECT np.PN
	 , 'NP' AS Class
FROM dbo.ref_PDC_DC_NP np
LEFT JOIN a
ON a.PN=np.PN
LEFT JOIN b
ON b.PN=np.PN
LEFT JOIN c
ON c.PN=np.PN
LEFT JOIN d
ON d.PN=np.PN
LEFT JOIN e
ON e.PN=np.PN
LEFT JOIN f
ON f.PN=np.PN
WHERE a.PN IS NULL AND b.PN IS NULL AND c.PN IS NULL AND d.PN IS NULL AND e.PN IS NULL AND f.PN IS NULL 
)
--Gets EURtoLAM truck parts not used on Jumbo, Big, Warehouse Warriors, VNA, UTILEV, EURtoAM or NP trucks.
, h AS
(
SELECT el.PN
	 , 'EURtoLAM' AS Class
FROM dbo.ref_PDC_DC_EURtoLAM el
LEFT JOIN a
ON a.PN=el.PN
LEFT JOIN b
ON b.PN=el.PN
LEFT JOIN c
ON c.PN=el.PN
LEFT JOIN d
ON d.PN=el.PN
LEFT JOIN e
ON e.PN=el.PN
LEFT JOIN f
ON f.PN=el.PN
LEFT JOIN g
ON g.PN=el.PN
WHERE a.PN IS NULL AND b.PN IS NULL AND c.PN IS NULL AND d.PN IS NULL AND e.PN IS NULL AND f.PN IS NULL AND g.PN IS NULL 
)
, dc AS
(
SELECT PN
	 , Class
FROM a
UNION 
SELECT PN
	 , Class
FROM b
UNION 
SELECT PN
	 , Class
FROM c
UNION 
SELECT PN
	 , Class
FROM d
UNION 
SELECT PN
	 , Class
FROM e
UNION 
SELECT PN
	 , Class
FROM f
UNION 
SELECT PN
	 , Class
FROM g
)

--2023-09-28 Added dcf section to substitute orderable SPNs in for PNs
--Orderable SPNs for legacy PNs are documented in an SQL table each time Module 2 runs.  
--All new SPNs set up after SPN implements will be orderable at setup.
--Orderable SPNs for non-legacy will be identified by Origin Dates after SPN implementation 
--and presence in the PDCData talbe called SPN_Ready.

, dcf As
(
Select Case
----Uncomment with implementation of SPN the next two lines when SPN is implemented 
----and change the date to the date when SPN implements.
--			When d.Origin_Dt>='2024-01-22'
--			Then d.SPN
			When o.SPN Is Not Null
			Then o.SPN
			Else dc.PN
			End As PN
	  ,Class
From dc
Left Join ref_PDC_Part_Set_Detail d
On dc.PN=d.PN
Left Join ref_PDC_SPN_Orderable o
On d.SPN=o.SPN
)

INSERT INTO dbo.ref_PDC_DC
SELECT DISTINCT LEFT(dcf.PN,12) AS PN
     , SVG AS HostPartID
     , '000014' AS HostLocID
	 , Class AS SKUCust17
FROM dcf
JOIN dbo.ref_PN_Fmt f
ON
dcf.PN=f.PN
--WHERE (LEN(LTRIM(RTRIM(dc.PN)))=12 AND dc.PN NOT Like 'Y%') OR LEN(LTRIM(RTRIM(dc.PN)))<12




GO
