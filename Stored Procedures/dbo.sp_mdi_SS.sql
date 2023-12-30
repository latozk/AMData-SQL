SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[sp_mdi_SS]  As

Truncate Table mdi_SS;

Insert Into mdi_SS 

Select *

from openquery
(
    [ACMAMSQLP1\AMPARTS],
    'SELECT DISTINCT 
sku.SKUCUST27 AS PN
	, ISNULL(sku.skucust34,0)as Man_SS
	, ISNULL(sl.CSL,0) AS Calc_SS
	, ISNULL(sl.OVRSL,0) AS SS
	, ISNULL(sku.skucust34,0)as SKUCUST34
	, ISNULL(sl.CSL,0) AS CSL
	, ISNULL(sl.OVRSL,0) AS OVRSL
	, ISNULL(sl.SLMinSLQty,0) As SLMinSLQty
	, ISNULL(sl.SLMaxSLQty,0) As SLMaxSLQty
FROM OfflineDB.dbo.IPCSCUST_SKU  sku
	INNER JOIN OfflineDB.dbo.IPCS_Stock_Level sl ON
		sku.LocID = sl.LocID and
		sku.PartID = sl.PartID
Where not sku.skucust27 is null
  and sl.LocID=3601')
 
GO
