SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE view [dbo].[ref_SS_Legacy_Layout] as

Select * from openquery([ACMAMSQLP1\AMPARTS],
'SELECT DISTINCT
sku.SKUCUST27 As Part_No
,  ISNULL(sku.skucust34,0)as ManSS
, ISNULL(sl.CSL, 0) AS CalcSS
, ISNULL(sl.OVRSL, 0) AS SS
, ISNULL(sku.skucust34,0)as SKUCUST34
, ISNULL(sl.CSL,0) AS CSL
, ISNULL(sl.OVRSL,0) AS OVRSL
, ISNULL(sl.SLMinSLQty,0) As SLMinSLQty
, ISNULL(sl.SLMaxSLQty,0) As SLMaxSLQty
FROM OfflineDB.dbo.IPCSCUST_SKU  sku
INNER JOIN OfflineDB.dbo.IPCS_Stock_Level sl ON
sku.LocID = sl.LocID and
sku.PartID = sl.PartID
where not sku.skucust27 is null
and sl.LocID=3601')

/*Select * from openquery(
    ACMAMSQLP1,
    'SELECT DISTINCT 
sku.SKUCUST27 As Part_No
	,  ISNULL(sku.skucust34,0)as ManSS
	, ISNULL(sl.CSL, 0) AS CalcSS
	, ISNULL(sl.OVRSL, 0) AS SS
FROM servi_data.dbo.IPCSCUST_SKU  sku
	INNER JOIN servi_data.dbo.IPCS_Stock_Level sl ON
		sku.LocID = sl.LocID and
		sku.PartID = sl.PartID
Where not sku.skucust27 is null
  and sl.LocID=3601')
GO
*/


GO
