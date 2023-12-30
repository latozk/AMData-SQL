SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





-- =============================================
--Author: Newell, R
--Date: 2021-10-20
--Purpose:	This view displays a list of parts used ontrucks other than Warehouse Warriors trucks.
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_DC_PTU_PNs_wo_WW_Trucks] AS
WITH c AS
(
SELECT [Unit]
      ,[Group]
  FROM [dbo].[ref_Unit]
  WHERE [Warehouse_Warriors]<>'Y' OR [Warehouse_Warriors] is NULL
)
, pu AS
(
SELECT [PN]
	 , [UnitCode]
  FROM [dbo].[ref_PDC_PartsToUnit_Formatted]
)
SELECT DISTINCT pu.PN
FROM pu
JOIN c
ON pu.UnitCode=c.Unit


GO
