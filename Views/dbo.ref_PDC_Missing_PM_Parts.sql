SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





  CREATE view [dbo].[ref_PDC_Missing_PM_Parts] as 

  -- =============================================
--Author: Newell, R
--Date: 2022-06-06
--Purpose: Returns PNs which are not set up on the PDC Part Master which require PDC support.  The source for this audit is ref_PDC_Part_to_Unit (which combines PDC Agile/CORE distribtution parts with PartstoUnit Formatted parts). 
--Modification notes:
-- =============================================


--PNs to ignore or exclude (ORMIC and DECA PNs) from the distribution audit as they should not require PDC support.
--PNs to exclude from PDC Missing Parts Audit
--Exclude AM PNs which are equal to CORE PNs having 
-----Type O (for Ormic), Type D (for Deca) or Type G (for Generic).  
-----These PNs do not need to be set up at th PDC.  
-----These PNs will need added to the PDC master once Single PNs are required to be loaded to the PDC PM.
--Exclude Non-serviced Parts
--Exclude Cancelled Parts
With ex AS
(
SELECT DISTINCT ptu.CORE_PN
         ,ptu.PN
         ,Type
         ,Serviced
         ,Status
FROM dbo.ref_PDC_Part_to_Unit ptu
JOIN dbo.eng_Part_Master epm
ON ptu.CORE_PN=epm.PN
WHERE Rel_Dt<'2012-01-01'
OR Rel_Dt Is Null
OR ((HY_Fmt='D' OR HY_Fmt='O'OR HY_Fmt='G') AND 'Y'+ptu.CORE_PN=ptu.PN)
OR ((HY_Fmt='M') AND ' '+ptu.CORE_PN=ptu.PN)
OR CORE_PN Like 'F%'
OR CORE_PN Like 'C%'
OR ptu.PN Like '765%'
OR LEN(ptu.PN)=11
OR epm.[Type]<>'P'
OR epm.[Type]Is Null
OR epm.Serviced='N' 
OR epm.[Status]='CAN'
OR epm.[Test_Status]='T'
OR epm.Comm ='59300'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%PORTUG%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%PORTU%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%PORUG%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%SERBIAN%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%CHINESE%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%CROAT%' 
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%BRAZIL%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%BRASIL%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%CZECH%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%DANISH%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%DUTCH%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%FINISH%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%FINNISH%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%FRENCH%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%GERMAN%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%GREEK%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%HUNGAR%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%ICELAND%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%ITALI%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%ITALY%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%NORWEG%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%POLISH%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%RUSSIAN%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%SWEDISH%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%BULGAR%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%ESTONI%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%LATVIAN%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%LITHUAN%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%ROMANI%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%SLOV%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%SOLV%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%TURK%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%(CH)%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%(ESP)%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%(FR)%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%EUROPE%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%EUR%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%AUSTRALIA%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%BRITISH%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%INDIA%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%AFRICA%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%ISRAEL%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%SWISS%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%BRIZILIA%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%UKRAIN'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%NON-US%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%NON-U.S.%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%NON US%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%NON U.S.%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%NSS%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%N.S.S.%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%NOT SERVICED%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%NAMEPLATE%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%MODIFICA%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%ARR%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%CHART%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%EPROM%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%CASTING%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%MANUAL%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%LITERATURE%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%DIAGRAM%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%DRAWING%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%DWG%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%INSTRUCTION%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%IDENTIFICATION BAND%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%DATE PLATE%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%CONFORMITY%'
OR epm.Desc_1+epm.Desc_2+epm.Desc_3 LIKE '%SOFTWARE%'
)
,e AS
(
Select *
From ex
)
--Excluded, already reviewed and PNs already on PM can be ignored
, ignore AS
(
Select PN
From dbo.ref_PDC_Distribution_Reviewed r
Union
Select PN
From e
Union
Select PN
From dbo.ref_PDC_Part_Detail pm
)
,i As
(
Select Distinct *
From ignore
)
,u AS
(
SELECT Unit
      ,Support
FROM dbo.ref_Unit
WHERE Support <>'Not Supported' And Support <>'Unknown'
)
, f AS
(
SELECT DISTINCT ptu.CORE_PN
         ,ptu.PN
FROM dbo.ref_PDC_Part_to_Unit ptu
LEFT JOIN i
ON ptu.PN=i.PN
JOIN u
ON ptu.Unit=u.Unit
WHERE i.PN IS NULL
AND 
(
ptu.PN LIKE ' _______ %'
OR ptu.PN LIKE ' ________ %'
OR ptu.PN LIKE 'Y%'
OR ptu.PN LIKE 'S%'
OR ptu.PN LIKE 'U%'
)
)
-- m for missing PNs
,m As
(
SELECT DISTINCT f.CORE_PN
         ,f.PN
FROM f
)
SELECT DISTINCT m.CORE_PN
         ,m.PN
         ,epm.Desc_1+Desc_2 As [Desc]
         ,ptu.Unit
         ,u.Support
         ,ptuf.IB_Total
		 ,epm.Rel_ECN
FROM m
LEFT JOIN dbo.ref_PDC_Part_to_Unit ptu
ON m.PN=ptu.PN
JOIN u
ON ptu.Unit=u.Unit
JOIN dbo.eng_Part_Master epm
ON m.CORE_PN=epm.PN
LEFT JOIN dbo.ref_PDC_PartsToUnit_Formatted ptuf
ON m.PN=ptuf.PN
GO
