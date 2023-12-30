SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays displays all the PDC Vend Codes (coming from PDC's AM crosses) for Single PNs.
--			
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_SP_PDC_Vend] AS



WITH ns AS
(
SELECT DISTINCT [CORE_PN]
,[Vend]
FROM [dbo].[ref_PDC_SP_AMPN_to_COREPN]
GROUP BY [CORE_PN]
,[Vend]
)
,ns_c AS
(
SELECT DISTINCT [CORE_PN]
,COUNT([Vend]) AS [CORE_PN_COUNT]
FROM ns
GROUP BY [CORE_PN]
)
, p AS
(
SELECT DISTINCT [CORE_PN]
,[PN]
,[Vend]
FROM [dbo].[ref_PDC_SP_AMPN_to_COREPN]
GROUP BY [CORE_PN]
,[PN]
,[Vend]
)
SELECT DISTINCT ns_c.[CORE_PN]
      ,ns_c.[CORE_PN_COUNT]
	  ,p.[PN]      
	  ,p.[Vend]
FROM ns_c LEFT JOIN p ON ns_c.[CORE_PN]=p.[CORE_PN]
--WHERE ns_c.[CORE_PN_COUNT]>1
--WHERE ns_c.CORE_PN='8607389' OR ns_c.CORE_PN='8834887'
--ORDER BY ns_c.[CORE_PN]
--      ,ns_c.[CORE_PN_COUNT]
--	  ,p.[PN]      
--	  ,p.[Vend]

GO
