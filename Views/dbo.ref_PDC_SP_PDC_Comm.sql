SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays displays all the PDC Comm Codes (coming from PDC's AM crosses) for Single PNs.
--			
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_SP_PDC_Comm] AS

WITH ns AS
(
SELECT DISTINCT [CORE_PN]
,[Comm]
FROM [dbo].[ref_PDC_SP_AMPN_to_COREPN]
GROUP BY [CORE_PN]
,[Comm]
)
,ns_c AS
(
SELECT DISTINCT [CORE_PN]
,COUNT([Comm]) AS [CORE_PN_COUNT]
FROM ns
GROUP BY [CORE_PN]
)
, p AS
(
SELECT DISTINCT [CORE_PN]
,[PN]
,[Comm]
FROM [dbo].[ref_PDC_SP_AMPN_to_COREPN]
GROUP BY [CORE_PN]
,[PN]
,[Comm]
)
SELECT DISTINCT ns_c.[CORE_PN]
      ,ns_c.[CORE_PN_COUNT]
	  ,p.[PN]      
	  ,p.[Comm]
FROM ns_c LEFT JOIN p ON ns_c.[CORE_PN]=p.[CORE_PN]
--WHERE ns_c.[CORE_PN_COUNT]>1
--WHERE ns_c.CORE_PN='8537083' OR ns_c.CORE_PN='8605819'

--ORDER BY ns_c.[CORE_PN]
--      ,ns_c.[CORE_PN_COUNT]
--	  ,p.[PN]      
--	  ,p.[Comm]

GO
