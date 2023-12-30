SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[zsp_ref_CORE_PN_XRef_2021_01_13] as

--exec sp_ref_CORE_PN_XRef
/*************************************************************************
                           sp_ref_CORE_PN_XRef
***********************************************************************
Author: Latoz, K
Date: 2020-08-01
Purpose: Populates ref_CORE_PN_Xref with all CORE_PN and their crosses.
         The PN to XPN (crosses) have records for both directions.  
		 You should be able to search the PN field for any PN and find it's crosses
Note: This stored procedure is a conversion from the CORE PNs access database.
  
Last modified date: 
Modification notes: 

 */



/* Empties CORE PN XRef */
Truncate table ref_CORE_PN_XRef;


/*Step 1  Load parts in eng_Product_Master with no cross in eng_AMPN Master */

Step_1: 

INSERT INTO ref_CORE_PN_XRef 
	Select 
	p.[PN] AS CORE_PN
	, p.HY_Fmt as CORE_Brand
	, p.[PN] AS PN
	, p.[HY_Fmt] AS PN_Brand
	, a.[AMPN] AS XPN
	, c.HY_FMT as XPN_Brand 
	,[ECN_EPO_Dt] AS ECN_EPO_dt
	, '' as PNAS400Fmt --Since PN is technically just CORE wih no cross to AM
	, '' as XPNAS400FMT -- See above 
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
	FROM [dbo].[eng_Part_Master] p 
		LEFT JOIN [dbo].[eng_AMPN_Master] a 
		ON p.[PN]=a.[PN]
		Left Join eng_AM_Abbr c
		on a.Abbr = c.Abbr 
	WHERE p.[Status]<>'CAN' 
			and p.type = 'P'
			and a.pn is null 
;

--

/* Step 2: Load records from eng_Part_Master with match in eng_AMPN_Master
   on PN=PN */

Step_2:

INSERT INTO ref_CORE_PN_XRef 
	SELECT 
	p.[PN] AS CORE_PN
	, p.HY_Fmt as CORE_Brand
	,p.[PN] AS PN
	,p.[HY_Fmt] AS PN_Brand
	,a.[AMPN] AS XPN
	, c.HY_Fmt as XPN_Brand
	,[ECN_EPO_Dt] AS ECN_PO_Dt
	, dbo.fn_PN_Fmt_Core_AM(p.PN) as Prod_PN_AS400 -- Calls function to format PN for PDC Part Master
	, dbo.fn_PN_Fmt_Core_AM([AMPN]) as AM_PN_AS400  -- Calls function to format PN for PDC Part Master
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
	  FROM [dbo].[eng_Part_Master] p 
	  LEFT JOIN [dbo].[eng_AMPN_Master] a 
		ON p.[PN]=a.[PN]
      Left Join eng_AM_Abbr c
	  on a.Abbr = c.Abbr 
	  WHERE p.[Status]<>'CAN' 
;

Step_3:
/* Step 3 Load AMPN as PN with EPM PN as Cross' */

INSERT INTO ref_CORE_PN_XRef
	SELECT 
	p.[PN] AS CORE_PN
	, p.HY_Fmt as CORE_Brand
	,a.[AMPN] AS PN
	, c.HY_Fmt AS PN_Brand
	,p.[PN] AS XPN
	,p.[HY_Fmt] AS XPN_Brand
	,[ECN_EPO_Dt] AS PN_Dt
	,  dbo.fn_PN_Fmt_Core_AM(AMPN) as Prod_PN_AS400 /* Function convert PN to PDC Part Master Format */
	, dbo.fn_PN_Fmt_Core_AM(p.PN) as AM_PN_AS400  /* Function convert PN to PDC Part Master Format */
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
	  FROM [dbo].[eng_Part_Master] p 
		LEFT JOIN [dbo].[eng_AMPN_Master] a 
		ON p.[PN]=a.[PN]
		Left Join eng_AM_Abbr c
		on a.Abbr = c.Abbr 
	  WHERE p.[Status]<>'CAN' 
;

/* Step 4: Link eng_AMPN_Master to itself and compare to ref_CORE_PN_Xref to pick up any where
   PNs are equal but AMPN is not   */
with apm_g as 
(
SELECT
ltrim(rtrim(am.PN)) as CORE_PN
, ltrim(rtrim(am.AMPN)) as PN
, c.hy_fmt AS PN_Brand
, ltrim(rtrim(am_1.AMPN)) as XPN
, c_1.HY_FMT AS XPN_Brand
, dbo.fn_PN_Fmt_Core_AM(am.AMPN) as PNAS400Fmt
, dbo.fn_PN_Fmt_Core_AM(am_1.AMPN) as XPNAS400FMT
from eng_AMPN_Master am
Left Join eng_AM_Abbr c
	On am.Abbr = c.Abbr 
join eng_AMPN_Master am_1
on am.PN = am_1.pn 
Left join eng_AM_Abbr c_1
on am_1.Abbr = c_1.abbr 
where am.AMPN<>am_1.AMPN 
)

INSERT Into ref_CORE_PN_XRef 
SELECT 
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



GO
