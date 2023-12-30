SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
--Author: Newell, R
--Date: 2021-10-18
--Purpose:	This procedure creates tables containing parts used on various demand classes.                                         
--Last modified date:
--Modification notes:

-- =============================================

CREATE PROCEDURE [dbo].[sp_ref_PDC_Demand_Class_Groups] AS


TRUNCATE TABLE dbo.ref_PDC_DC_BT;
TRUNCATE TABLE dbo.ref_PDC_DC_Jumbo;
TRUNCATE TABLE dbo.ref_PDC_DC_BT_Jumbo;
TRUNCATE TABLE dbo.ref_PDC_DC_VNA;
TRUNCATE TABLE dbo.ref_PDC_DC_WW;
TRUNCATE TABLE dbo.ref_PDC_DC_NP;
TRUNCATE TABLE dbo.ref_PDC_DC_EURtoAM;
TRUNCATE TABLE dbo.ref_PDC_DC_EURtoLAM;
TRUNCATE TABLE dbo.ref_PDC_DC_UTILEV;


BEGIN


	-- Populates table with parts used on Big trucks.
	WITH c AS
	(
	SELECT [Unit]
	  FROM [dbo].[ref_Unit]
	  WHERE [Group]='BT'
	)
	, pu AS
	(
	SELECT [PartNumber]
		  ,[UnitCode]
		  ,[PN]
	  FROM [dbo].[ref_PDC_PartsToUnit_Formatted] ptu
	  JOIN c
	  ON ptu.UnitCode=c.Unit
	)
	INSERT INTO ref_PDC_DC_BT
	SELECT DISTINCT RTRIM(pu.PN) AS PN
	FROM pu
	JOIN c
	ON pu.UnitCode=c.Unit
	;
	-- Populates table with parts used on Jumbo trucks.
	WITH c AS
	(
	SELECT [Unit]
	  FROM [dbo].[ref_Unit]
	  WHERE [Group]='JUMBO'
	)
	, pu AS
	(
	SELECT [PartNumber]
		  ,[UnitCode]
		  ,[PN]
	  FROM [dbo].[ref_PDC_PartsToUnit_Formatted] ptu
	  JOIN c
	  ON ptu.UnitCode=c.Unit
	)
	INSERT INTO ref_PDC_DC_Jumbo
	SELECT DISTINCT RTRIM(pu.PN) AS PN
	FROM pu
	JOIN c
	ON pu.UnitCode=c.Unit
	;
	-- Populates table with parts used on BT and Jumbo trucks.
	With u AS
	(
	SELECT PN
	  FROM ref_PDC_DC_BT
	UNION
	SELECT PN
	  FROM ref_PDC_DC_Jumbo
	)
	INSERT INTO ref_PDC_DC_BT_Jumbo
	SELECT DISTINCT PN
	FROM u
	;
	-- Populates table with parts used on VNA trucks.
	WITH c AS
	(
	SELECT [Unit]
	  FROM [dbo].[ref_Unit]
	  WHERE [Group]='VNA'
	)
	, pu AS
	(
	SELECT [PartNumber]
		  ,[UnitCode]
		  ,[PN]
	  FROM [dbo].[ref_PDC_PartsToUnit_Formatted] ptu
	  JOIN c
	  ON ptu.UnitCode=c.Unit
	)
	INSERT INTO ref_PDC_DC_VNA
	SELECT DISTINCT RTRIM(pu.PN) AS PN
	FROM pu
	JOIN c
	ON pu.UnitCode=c.Unit
	;
	-- Populates table with parts used pm Warehouse Warriors trucks.
	WITH c AS
	(
	SELECT [Unit]
	  FROM [dbo].[ref_Unit]
		WHERE [Warehouse_Warriors]='Y'
	)
	, pu AS
	(
	SELECT [PartNumber]
		  ,[UnitCode]
		  ,[PN]
	  FROM [dbo].[ref_PDC_PartsToUnit_Formatted] ptu
	  JOIN c
	  ON ptu.UnitCode=c.Unit
	)
	INSERT INTO ref_PDC_DC_WW
	SELECT DISTINCT RTRIM(pu.PN) AS PN
	FROM pu
	JOIN c
	ON pu.UnitCode=c.Unit
	;
	-- Populates table with parts used pm NP trucks.
	WITH c AS
	(
	SELECT [Unit]
	  FROM [dbo].[ref_Unit]
	  WHERE [Group]='NP'
	)
	, pu AS
	(
	SELECT [PartNumber]
		  ,[UnitCode]
		  ,[PN]
	  FROM [dbo].[ref_PDC_PartsToUnit_Formatted] ptu
	  JOIN c
	  ON ptu.UnitCode=c.Unit
	)
	INSERT INTO ref_PDC_DC_NP
	SELECT DISTINCT RTRIM(pu.PN) AS PN
	FROM pu
	JOIN c
	ON pu.UnitCode=c.Unit
	;
	-- Populates table with parts used pm EURtoAM trucks.
	WITH c AS
	(
	SELECT [Unit]
	  FROM [dbo].[ref_Unit]
	  WHERE [Group]='EURtoAM'
	)
	, pu AS
	(
	SELECT [PartNumber]
		  ,[UnitCode]
		  ,[PN]
	  FROM [dbo].[ref_PDC_PartsToUnit_Formatted] ptu
	  JOIN c
	  ON ptu.UnitCode=c.Unit
	)
	INSERT INTO ref_PDC_DC_EURtoAM
	SELECT DISTINCT RTRIM(pu.PN) AS PN
	FROM pu
	JOIN c
	ON pu.UnitCode=c.Unit
	;
	-- Populates table with parts used on EURtoLAM trucks.
	WITH c AS
	(
	SELECT [Unit]
	  FROM [dbo].[ref_Unit]
	  WHERE [Group]='EURtoLAM'
	)
	, pu AS
	(
	SELECT [PartNumber]
		  ,[UnitCode]
		  ,[PN]
	  FROM [dbo].[ref_PDC_PartsToUnit_Formatted] ptu
	  JOIN c
	  ON ptu.UnitCode=c.Unit
	)
	INSERT INTO ref_PDC_DC_EURtoLAM
	SELECT DISTINCT RTRIM(pu.PN) AS PN
	FROM pu
	JOIN c
	ON pu.UnitCode=c.Unit
	;
	-- Populates table with parts used on UTILEV trucks.
	WITH pm AS
	(
	SELECT [PN]
		  ,[PrdCls]
	  FROM [dbo].[ref_PDC_Part_Detail]
	  WHERE [PrdCls]='UT'
	)

	, c AS
	(
	SELECT [Unit]
	  FROM [dbo].[ref_Unit]
	  WHERE [Group]='UTILEV'
	)
	, pu AS
	(
	SELECT ptu.[PartNumber]
		  ,ptu.[UnitCode]
		  ,ptu.[PN]
	  FROM [dbo].[ref_PDC_PartsToUnit_Formatted] ptu
	  JOIN c
	  ON ptu.UnitCode=c.Unit
	  LEFT JOIN pm
	  ON ptu.PN=pm.PN
	  WHERE pm.PN IS NULL
	)
	, u AS
	(
	SELECT PN
	FROM pm
	UNION 
	SELECT PN
	FROM pu
	)

	INSERT INTO ref_PDC_DC_UTILEV
	SELECT DISTINCT RTRIM(PN) AS PN
	FROM u


END

GO
