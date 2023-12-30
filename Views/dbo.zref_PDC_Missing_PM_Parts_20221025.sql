SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



  CREATE view [dbo].[zref_PDC_Missing_PM_Parts_20221025] as 

  -- =============================================
--Author: Newell, R
--Date: 2022-06-06
--Purpose: Returns PNs which are not set up on the PDC Part Master which require PDC support.  The source for this audit is ref_PDC_Part_to_Unit (which combines PDC Agile/CORE distribtution parts with PartstoUnit Formatted parts). 
--Modification notes:
-- =============================================


--PNs to ignore or exclude (like ORMIC and DECA PNs) from the distribution audit as they should not require PDC support.
With e AS
(
SELECT DISTINCT CORE_PN
	  ,ptu.PN
	  ,Type
	  ,Serviced
	  ,Status
FROM dbo.ref_PDC_Part_to_Unit ptu
JOIN dbo.eng_Part_Master epm
ON ptu.CORE_PN=epm.PN
WHERE ((HY_Fmt='D' OR HY_Fmt='O'OR HY_Fmt='G') AND 'Y'+ptu.CORE_PN=ptu.PN)
OR epm.Type<>'P'
OR epm.Serviced='N' 
OR epm.Status='CAN'
OR epm.Comm ='59300'
OR epm.Desc_2+epm.Desc_3 LIKE 'NAMEPLATE%'
OR epm.Desc_2+epm.Desc_3 LIKE 'MODIFICA%'
OR epm.Desc_2+epm.Desc_3 LIKE '*PORTUG%'
OR epm.Desc_2+epm.Desc_3 LIKE '*SERBIAN%'
OR epm.Desc_2+epm.Desc_3 LIKE '*CHINESE%'
OR epm.Desc_2+epm.Desc_3 LIKE '*CROAT' 
OR epm.Desc_2+epm.Desc_3 LIKE '*BRAZIL%'
OR epm.Desc_2+epm.Desc_3 LIKE '*CZECH%'
OR epm.Desc_2+epm.Desc_3 LIKE '*DANISH%'
OR epm.Desc_2+epm.Desc_3 LIKE '*DUTCH%'
OR epm.Desc_2+epm.Desc_3 LIKE '*FINISH%'
OR epm.Desc_2+epm.Desc_3 LIKE '*FRENCH%'
OR epm.Desc_2+epm.Desc_3 LIKE '*GERMAN%'
OR epm.Desc_2+epm.Desc_3 LIKE '*GREEK%'
OR epm.Desc_2+epm.Desc_3 LIKE '*HUNGAR%'
OR epm.Desc_2+epm.Desc_3 LIKE '*ICELAND%'
OR epm.Desc_2+epm.Desc_3 LIKE '*ITALI%'
OR epm.Desc_2+epm.Desc_3 LIKE '*NORWEG%'
OR epm.Desc_2+epm.Desc_3 LIKE '*POLISH%'
OR epm.Desc_2+epm.Desc_3 LIKE '*PORUG%'
OR epm.Desc_2+epm.Desc_3 LIKE '*RUSSIAN%'
OR epm.Desc_2+epm.Desc_3 LIKE '*SWEDISH%'
OR epm.Desc_2+epm.Desc_3 LIKE '*BULGAR%'
OR epm.Desc_2+epm.Desc_3 LIKE '*ESTONI%'
OR epm.Desc_2+epm.Desc_3 LIKE '*LATVIAN%'
OR epm.Desc_2+epm.Desc_3 LIKE '*LITHUAN%'
OR epm.Desc_2+epm.Desc_3 LIKE '*ROMANI%'
OR epm.Desc_2+epm.Desc_3 LIKE '*SLOV%'
OR epm.Desc_2+epm.Desc_3 LIKE '*SOLV%'
OR epm.Desc_2+epm.Desc_3 LIKE '*TURK%'
OR epm.Desc_2+epm.Desc_3 LIKE '*NON-US%'
OR epm.Desc_2+epm.Desc_3 LIKE '*NON-U.S.%'
OR epm.Desc_2+epm.Desc_3 LIKE '*NON US%'
OR epm.Desc_2+epm.Desc_3 LIKE '*NON U.S.'
OR epm.Desc_2+epm.Desc_3 LIKE '*(CH)%'
OR epm.Desc_2+epm.Desc_3 LIKE '*(ESP)%'
OR epm.Desc_2+epm.Desc_3 LIKE '*(FR)%'
OR epm.Desc_2+epm.Desc_3 LIKE '*SOFTWARE%'
)

--Gets supported units and type of PDC support required.
, u AS
(
SELECT Unit
	  ,Support
FROM ref_Unit
WHERE Support <>'Not Supported'
)

, f AS
(
SELECT DISTINCT ptu.CORE_PN
	  ,ptu.PN
	  ,epm.Desc_1+Desc_2 AS [Desc]
	  ,ptu.Unit
	  ,Support
FROM dbo.ref_PDC_Part_to_Unit ptu
LEFT JOIN dbo.ref_PDC_Distribution_Reviewed r
ON ptu.PN=r.PN
LEFT JOIN e
ON ptu.CORE_PN=e.PN
LEFT JOIN dbo.ref_PDC_Part_Detail pm
ON ptu.PN=pm.PN
JOIN u
ON ptu.Unit=u.Unit
JOIN dbo.eng_Part_Master epm
ON ptu.CORE_PN=epm.PN
WHERE r.PN IS NULL AND e.PN IS NULL AND pm.PN IS NULL
AND 
(
ptu.PN LIKE ' _______ %'
OR ptu.PN LIKE ' ________ %'
OR ptu.PN LIKE 'Y%'
OR ptu.PN LIKE 'S%'
OR ptu.PN LIKE 'U%'
)
)

SELECT DISTINCT CORE_PN
	  ,f.PN
	  ,[Desc]
	  ,Unit
	  ,Support
	  ,ptuf.IB_Total
FROM f
JOIN ref_PDC_PartsToUnit_Formatted ptuf
ON f.PN=ptuf.PN

 
GO
