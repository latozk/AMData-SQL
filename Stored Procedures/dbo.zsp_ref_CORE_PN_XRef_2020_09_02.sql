SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[zsp_ref_CORE_PN_XRef_2020_09_02] as

--exec sp_ref_CORE_PN_XRef
--************************************************************************
--                            sp_ref_CORE_PN_XRef
--***********************************************************************
-- =============================================
--Author: Latoz, K
--Date: 2020-08-01
--Purpose: This stored procedure is a conversion from the CORE PNs access database.
--   
--Last modified date: 
--Modification notes: 
-- =============================================


--01a) Empties CORE PN XRe f
Truncate table ref_CORE_PN_XRef;

--**************************



--01b) Adds Gen PNs no Crosses to CORE XRef
INSERT INTO ref_CORE_PN_XRef --2,001,522
SELECT 
PN as CORE_PN
, PN
, 'NONE' as XPN
, dbo.fn_PN_Fmt_Core_AM(PN)  as PNAS400Fmt
, '' as XPNAS400FMT
, Status
, Type
, epm.Desc_1 
, epm.Desc_2
, epm.Desc_3 
, HCE
, Kit_List
, Part_In_Use
, Comm
, Rel_Proj
, Rel_ECN
, Rel_Date
, Replacing_Part
, VASP_List
, VASP_ECN_Date
, Chart
, CAD_Sys
, Loc
, Rev
, epm.Dwg_Size
, Shts
, UOM
, Tran_Status
, ECN
, Serviced
FROM eng_Part_Master epm
	left outer join ref_CORE_AM car
		on epm.pn = car.Prod_PN
		Where epm.type = 'P'
		--and prod_pn is null


--01c) Adds Gen PNs and Crosses to CORE XRef
INSERT INTO ref_CORE_PN_XRef --324,470
SELECT 
epm.PN as CORE_PN
, Prod_PN AS PN
,AM_PN AS XPN
, Prod_PN_AS400 as PNAS400Fmt
, AM_PN_AS400 as XPNAS400FMT
, Status
, Type
, Desc_1 
, Desc_2
, Desc_3 
, HCE
, Kit_List
, Part_In_Use
, Comm
, Rel_Proj
, Rel_ECN
, Rel_Date
, Replacing_Part
, VASP_List
, VASP_ECN_Date
, Chart
, CAD_Sys
, Loc
, Rev
, Dwg_Size
, Shts
, UOM
, Tran_Status
, ECN
, Serviced
FROM ref_Generic_AM_PN a
	left outer join eng_Part_Master epm
	on epm.PN = a.Prod_PN
where not prod_pn = AM_pn 


--01d) Adds Gen PNs and Crosses to CORE XRef
INSERT INTO ref_CORE_PN_XRef --324,470
SELECT   
epm.PN as CORE_PN
, AM_PN AS PN
,Prod_PN AS XPN
, AM_PN_AS400 as PNAS400Fmt
, Prod_PN_AS400 as XPNAS400FMT
, epm.Status
, epm.Type
, epm.Desc_1 
, epm.Desc_2       
, epm.Desc_3 
, epm.HCE
, epm.Kit_List
, epm.Part_In_Use
, epm.Comm
, epm.Rel_Proj
, epm.Rel_ECN
, epm.Rel_Date
, epm.Replacing_Part
, epm.VASP_List
, epm.VASP_ECN_Date
, epm.Chart
, epm.CAD_Sys
, epm.Loc
, epm.Rev
, epm.Dwg_Size
, epm.Shts
, epm.UOM
, epm.Tran_Status
, epm.ECN
, epm.Serviced
FROM ref_Generic_AM_PN a
	left outer join eng_Part_Master epm
	on epm.PN = a.prod_pn 
	where not prod_pn = AM_pn;


--01e) Adds AM Crosses to CORE XRef
with apm_g as 
(
SELECT
apm.Prod_PN as CORE_PN
, ltrim(rtrim(apm.AM_PN))  AS  PN --gets am pn from ref_core_am
 ,ltrim(rtrim(apm_1.AM_PN))  AS XPN -- gets am xpn based on link to itself
, dbo.fn_PN_Fmt_Core_AM(apm.AM_PN) as PNAS400Fmt
, dbo.fn_PN_Fmt_Core_AM(apm_1.AM_PN) as XPNAS400FMT
FROM ref_CORE_AM apm
	LEFT JOIN ref_CORE_AM AS apm_1
		ON apm.Prod_PN =apm_1.Prod_PN
WHERE apm.AM_PN<>apm_1.AM_PN
and  apm.AM_Brand<>'AMSN '
and apm_1.am_brand<>'AMSN'
--and apm.am_pn = '1370729'
)

INSERT Into ref_CORE_PN_XRef 
SELECT -- distinct
apm_g.CORE_PN AS core_pn 
, apm_g.PN as PN
,apm_g.XPN
, apm_g.PNAS400Fmt
, apm_g.XPNAS400FMT
, epm.Status
, epm.Type
, epm.Desc_1 
, epm.Desc_2       
, epm.Desc_3 
, epm.HCE
, epm.Kit_List
, epm.Part_In_Use
, epm.Comm
, epm.Rel_Proj	
, epm.Rel_ECN
, epm.Rel_Date
, epm.Replacing_Part
, epm.VASP_List
, epm.VASP_ECN_Date
, epm.Chart
, epm.CAD_Sys
, epm.Loc
, epm.Rev
, epm.Dwg_Size
, epm.Shts
, epm.UOM
, epm.Tran_Status
, epm.ECN
, epm.Serviced
FROM apm_g 
	Left join ref_CORE_PN_XRef cpm
	on apm_g.pn = cpm.pn
		and apm_g.xpn = cpm.xpn 
	left outer join eng_Part_Master epm
	on epm.PN = apm_g.CORE_PN
where cpm.pn is null 
and not epm.pn is null














GO
