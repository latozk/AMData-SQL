SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays the contents of the eng_Part_Master table and also includes
--			various corresponding information only available in the eng_Part_Master_Ext 
--			table.
--			This view will be used in the compilation of ECN information for
--			Aftermarket ECN processing.
--Last modified date:
--Modification notes:
-- =============================================

CREATE VIEW [dbo].[ref_eng_Part_Master] AS

SELECT p.[PN]
--, p.[Warranty]
--, p.[ECN]
--, p.[Loc]
--, p.[Vend]
--, p.[VPN]
, p.[Replacing_Part]
, p.[Comm]
--, p.[Test_Status]
, p.[Type]
, p.[Dwg_Size]
, p.[Chart]
, p.[Rel_Proj]
, p.[Rel_EPO]
, p.[Rel_ECN]
--, p.[Rel_Date]
--, p.[EPO_Cur_Rev]
--, p.[Latest_EPO_Date]
, p.[VASP_List]
, p.[Status]
--, p.[HCE]
--, p.[VASP_ECN_Date]
, p.[HY_Fmt]
, p.[Desc_1]
, p.[Desc_2]
, p.[Desc_3]
--, p.[Part_In_Use]
, p.[Kit_List]
, p.[Rev]
--, p.[Tran_Status]
--, p.[EPO_Rev]
--, p.[CAD_Sys]
--, p.[Shts]
--, p.[UOM]
, p.[Serviced]
, p.[Software_Rqd]
, p.[Software_Msg]
--, p.[Rel_Dt]
--, p.[Latest_EPO_Dt]
--, px.PN
--, px.JA_Rev
--, px.[Similar_Part]
, px.[Weight_kg]
, px.[MSDS]
--, px.[Comp_Ref]
--, px.[Key_Char]
--, px.[Matl_Spec]
--, px.[Matl_Note]
--, px.[Cat]
--, px.[UNSPSC]
--, px.[JA_Part_Desc_2]
--, px.[JA_Part_Desc_3]
--, px.[Agile_Mstr]
FROM [eng_Part_Master] p LEFT JOIN [eng_Part_Master_Ext] px ON p.[PN]=px.[PN]
--WHERE p.[PN]='0000125'
GO
