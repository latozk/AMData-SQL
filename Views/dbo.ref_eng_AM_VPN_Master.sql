SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays the contents of the eng_AM_VPN_Master table and
--			also includes corresponding Aftermarket/Vendor Names available in the 
--			eng_AM_Vendor_Name table.
--			This view will be used in the compilation of ECN information for
--			Aftermarket ECN processing.
--Last modified date:
--Modification notes:

-- =============================================




CREATE VIEW [dbo].[ref_eng_AM_VPN_Master] AS
SELECT n.[ECN]
, n.[PN]
, n.[Abbr]
, n.[AMPN_VPN]
, n.[Status]
, n.[Equiv]
--, v.[Abbr]
, v.[Name]
--, v.[Reference]
FROM [dbo].[eng_AM_VPN_Master] n JOIN [dbo].[eng_AM_Vendor_Name] v ON n.Abbr=v.Abbr
--WHERE n.[ECN]='16098-01' 
--or n.[ECN]='98704-33'
--or n.[ECN]='70448'
--or n.[ECN]='70473-01'
--or n.[ECN]='59401-17'
--or n.[ECN]='70491'
--or n.[ECN]='70046'
--or n.[ECN]='72111'
--or n.[ECN]='72115-01'
--or n.[ECN]='70215'
--or n.[ECN]='99520'
--or n.[ECN]='70427'

GO
