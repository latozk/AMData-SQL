SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- =============================================
--Author: Newell, R
--Date: 2021-10-18
--Purpose:	This procedure creates tables containing unique parts for various demand classes.                                         
--Last modified date:
--Modification notes:

-- =============================================


CREATE PROCEDURE [dbo].[sp_ref_PDC_Demand_Class_Group_Uniques] AS

TRUNCATE TABLE dbo.ref_PDC_DC_BT_Unique;
TRUNCATE TABLE dbo.ref_PDC_DC_Jumbo_Unique;
TRUNCATE TABLE dbo.ref_PDC_DC_BT_Jumbo_Unique;
TRUNCATE TABLE dbo.ref_PDC_DC_VNA_Unique;
TRUNCATE TABLE dbo.ref_PDC_DC_WW_Unique;

BEGIN

-- Populates table with parts unique to Big trucks.
WITH c AS
(
SELECT PN
FROM dbo.ref_PDC_DC_BT
)
, nc AS
(
SELECT PN
FROM dbo.ref_PDC_DC_PTU_PNs_wo_Big_Trucks
)
, i AS
(
SELECT c.PN
FROM c
JOIN nc
ON c.PN=nc.PN
)
INSERT INTO dbo.ref_PDC_DC_BT_Unique
SELECT RTRIM(c.PN) AS PN
FROM c
LEFT JOIN i
ON c.PN=i.PN
WHERE i.PN IS NULL
;
-- Populates table with parts unique to Jumbo trucks.
WITH c AS
(
SELECT PN
FROM dbo.ref_PDC_DC_Jumbo
)
, nc AS
(
SELECT PN
FROM dbo.ref_PDC_DC_PTU_PNs_wo_Jumbo_Trucks
)
, i AS
(
SELECT c.PN
FROM c
JOIN nc
ON c.PN=nc.PN
)
INSERT INTO dbo.ref_PDC_DC_Jumbo_Unique
SELECT RTRIM(c.PN) AS PN
FROM c
LEFT JOIN i
ON c.PN=i.PN
WHERE i.PN IS NULL
;
-- Populates table with parts unique to BT and Jumbo trucks.
WITH c AS
(
SELECT PN
FROM dbo.ref_PDC_DC_BT_Jumbo
)
, nc AS
(
SELECT PN
FROM dbo.ref_PDC_DC_PTU_PNs_wo_Big_Jumbo_Trucks
)
, i AS
(
SELECT c.PN
FROM c
JOIN nc
ON c.PN=nc.PN
)
INSERT INTO dbo.ref_PDC_DC_BT_Jumbo_Unique
SELECT RTRIM(c.PN) AS PN
FROM c
LEFT JOIN i
ON c.PN=i.PN
WHERE i.PN IS NULL
;
-- Populates table with parts unique to VNA trucks.
WITH c AS
(
SELECT PN
FROM dbo.ref_PDC_DC_VNA
)
, nc AS
(
SELECT PN
FROM dbo.ref_PDC_DC_PTU_PNs_wo_VNA_Trucks
)
, i AS
(
SELECT c.PN
FROM c
JOIN nc
ON c.PN=nc.PN
)
INSERT INTO dbo.ref_PDC_DC_VNA_Unique
SELECT RTRIM(c.PN) AS PN
FROM c
LEFT JOIN i
ON c.PN=i.PN
WHERE i.PN IS NULL
;
-- Populates table with parts unique to Warehouse Warriors trucks.
WITH c AS
(
SELECT PN
FROM dbo.ref_PDC_DC_WW
)
, nc AS
(
SELECT PN
FROM dbo.ref_PDC_DC_PTU_PNs_wo_WW_Trucks
)
, i AS
(
SELECT c.PN
FROM c
JOIN nc
ON c.PN=nc.PN
)
INSERT INTO dbo.ref_PDC_DC_WW_Unique
SELECT RTRIM(c.PN) AS PN
FROM c
LEFT JOIN i
ON c.PN=i.PN
WHERE i.PN IS NULL

END
GO
