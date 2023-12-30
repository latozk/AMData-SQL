SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE  [dbo].[sp_ref_PDC_Prime_PQ] AS


TRUNCATE TABLE [dbo].[ref_PDC_Prime_PQ];


---- =============================================
----Author: Newell, R
----Date: 2021-05-21
----Purpose: Populate a table with only Prime PDC PQs (does not include non-prime or other depot/plant PQs).
----Last modified date:
----Modification notes: 
----2021/06/14 Removed duplicate fields VC and VPN (same as VEND_CODE and VENDOR_REF_NO).
---- =============================================



INSERT INTO dbo.ref_PDC_Prime_PQ
SELECT DISTINCT PART_NO
, PRIME_FLAG AS PrimeFlg
, VEND_CODE
, VENDOR_REF_NO
--, VEND_CODE AS VC
--, VENDOR_REF_NO AS VPN
, PLANT_CODE
, e.EOQ
, CURRENT_PQ_COST
, FUTURE_PQ_COST
, CURRENT_EFF_DATE
, NULL AS CURRENT_EFF_DT
, REVIEW_DATE
, NULL as REVIEW_DT
, PB_FLAG
, BRAND
FROM dbo.pdc_EOQ e LEFT JOIN dbo.ref_PDC_Part_Detail p
ON e.VEND_CODE=p.Vend
WHERE [PRIME_FLAG]='Y' AND [PLANT_CODE]='014' AND [VEND_CODE]<>'14599' AND [VENDOR_REF_NO] Not Like '1459%'
--WHERE [PRIME_FLAG]='Y' AND [PLANT_CODE]='014' AND [VEND_CODE]<>'14599' AND [VENDOR_REF_NO] Not Like '1459%' AND PART_NO=' 0000125    '
GO
