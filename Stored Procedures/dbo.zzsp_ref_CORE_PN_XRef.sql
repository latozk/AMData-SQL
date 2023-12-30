SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[zzsp_ref_CORE_PN_XRef] as

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

Print 'Starting ref_CORE_PN_XRef Load'

--01a) Empties CORE PN XRe f
Truncate table ref_CORE_PN_XRef;
Print 'ref_CORE_PNXref Table Truncated'

--******************************
Step_1: 
Print 'Starting Step_1  load parts in eng_Product_Master with no cross in eng_AMPN Master';


INSERT INTO ref_CORE_PN_XRef -- 1,434,532 (2,001,522)----901661
Select 
p.[PN] AS CORE_PN
		 , p.HY_Fmt as CORE_Brand
         ,p.[PN] AS PN
         ,p.[HY_Fmt] AS PN_Brand
      ,a.[AMPN] AS XPN
         ,CASE  
               WHEN a.[Abbr]='AMHYS'
               THEN 'H'
               WHEN a.[Abbr]='AMYALE'
               THEN 'Y'
               WHEN a.[Abbr]='YALE'
               THEN 'Y'
               WHEN a.[Abbr]='AMUTIL'
               THEN 'U'
               WHEN a.[Abbr]='AMRICO'
               THEN 'R'
               WHEN a.[Abbr]='AMNUV'
               THEN 'N'
           END AS XPN_Brand
             ,[ECN_EPO_Dt] AS ECN_EPO_dt
, '' as PNAS400Fmt --Since PN is technically just CORE wih no cross to AM    dbo.fn_PN_Fmt_Core_AM(epm,PN)  as PNAS400Fmt
, '' as XPNAS400FMT
, p.Status
, Type
, p.Desc_1 
, p.Desc_2
, p.Desc_3 
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
, p.Dwg_Size
, Shts
, UOM
, Tran_Status
, p.ECN
, Serviced
  FROM [dbo].[eng_Part_Master] p LEFT JOIN [dbo].[eng_AMPN_Master] a ON p.[PN]=a.[PN]
  WHERE p.[Status]<>'CAN' --AND p.[PN]='0292531'
  and p.type = 'P'
and a.pn is null 
;
Print 'Finish Step_1';
--
Step_2:

INSERT INTO ref_CORE_PN_XRef --324,470 ---1,682,616
SELECT 
p.[PN] AS CORE_PN
, p.HY_Fmt as CORE_Brand
         ,p.[PN] AS PN
         ,p.[HY_Fmt] AS PN_Brand
      ,a.[AMPN] AS XPN
         ,CASE  
               WHEN a.[Abbr]='AMHYS'
               THEN 'H'
               WHEN a.[Abbr]='AMYALE'
               THEN 'Y'
               WHEN a.[Abbr]='YALE'
               THEN 'Y'
               WHEN a.[Abbr]='AMUTIL'
               THEN 'U'
               WHEN a.[Abbr]='AMRICO'
               THEN 'R'
               WHEN a.[Abbr]='AMNUV'
               THEN 'N'
           END AS XPN_Brand
             ,[ECN_EPO_Dt] AS ECN_PO_Dt
,  dbo.fn_PN_Fmt_Core_AM(p.PN) as Prod_PN_AS400
, dbo.fn_PN_Fmt_Core_AM([AMPN]) as AM_PN_AS400
, p.Status
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
, p.ECN
, Serviced
  FROM [dbo].[eng_Part_Master] p LEFT JOIN [dbo].[eng_AMPN_Master] a 
	ON p.[PN]=a.[PN]
  WHERE p.[Status]<>'CAN' --AND p.[PN]='0292531'
;
Print 'Finish Step_2';

Step_3:
Print 'Starting Step_3 Load AMPN as PN with EPM PN as Cross'
--

INSERT INTO ref_CORE_PN_XRef --324,470
SELECT 
p.[PN] AS CORE_PN
, p.HY_Fmt as CORE_Brand
      ,a.[AMPN] AS PN
         ,CASE  
               WHEN a.[Abbr]='AMHYS'
               THEN 'H'
               WHEN a.[Abbr]='AMYALE'
               THEN 'Y'
               WHEN a.[Abbr]='YALE'
               THEN 'Y'
               WHEN a.[Abbr]='AMUTIL'
               THEN 'U'
               WHEN a.[Abbr]='AMRICO'
               THEN 'R'
               WHEN a.[Abbr]='AMNUV'
               THEN 'N'
           END AS PN_Brand
         ,p.[PN] AS XPN
         ,p.[HY_Fmt] AS XPN_Brand
		   ,[ECN_EPO_Dt] AS PN_Dt
,  dbo.fn_PN_Fmt_Core_AM(AMPN) as Prod_PN_AS400
, dbo.fn_PN_Fmt_Core_AM(p.PN) as AM_PN_AS400
, p.Status
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
, p.ECN
, Serviced
  FROM [dbo].[eng_Part_Master] p LEFT JOIN [dbo].[eng_AMPN_Master] a ON p.[PN]=a.[PN]
  WHERE p.[Status]<>'CAN' --AND p.[PN]='0292531'
;
Print 'Step_3 Complete';


Print 'Step_4 Starting'
;
with apm_g as 
(
SELECT
ltrim(rtrim(am.PN)) as CORE_PN
, ltrim(rtrim(am.AMPN)) as PN
         ,CASE  
               WHEN am.[Abbr]='AMHYS'
               THEN 'H'
               WHEN am.[Abbr]='AMYALE'
               THEN 'Y'
               WHEN am.[Abbr]='YALE'
               THEN 'Y'
               WHEN am.[Abbr]='AMUTIL'
               THEN 'U'
               WHEN am.[Abbr]='AMRICO'
               THEN 'R'
               WHEN am.[Abbr]='AMNUV'
               THEN 'N'
           END AS PN_Brand
, ltrim(rtrim(am_1.AMPN)) as XPN
         ,CASE  
               WHEN am_1.[Abbr]='AMHYS'
               THEN 'H'
               WHEN am_1.[Abbr]='AMYALE'
               THEN 'Y'
               WHEN am_1.[Abbr]='YALE'
               THEN 'Y'
               WHEN am_1.[Abbr]='AMUTIL'
               THEN 'U'
               WHEN am_1.[Abbr]='AMRICO'
               THEN 'R'
               WHEN am_1.[Abbr]='AMNUV'
               THEN 'N'
           END AS XPN_Brand
, dbo.fn_PN_Fmt_Core_AM(am.AMPN) as PNAS400Fmt
, dbo.fn_PN_Fmt_Core_AM(am_1.AMPN) as XPNAS400FMT
from eng_AMPN_Master am
join eng_AMPN_Master am_1
on am.PN = am_1.pn 
where am.AMPN<>am_1.AMPN
--and am.pn = '8605898' 
)

INSERT Into ref_CORE_PN_XRef 
SELECT -- distinct
apm_g.CORE_PN AS core_pn 
, epm.HY_FMT as CORE_Brand 
, apm_g.PN as PN
, apm_g.PN_Brand
,apm_g.XPN
, apm_g.XPN_Brand
,[ECN_EPO_Dt] AS ECN_EPO_Dt
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

Print 'Step_4 Complete'
Print 'sp_ref_CORE_PN_Xref Complete';





GO
