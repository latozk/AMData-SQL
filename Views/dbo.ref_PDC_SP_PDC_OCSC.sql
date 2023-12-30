SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays displays all the PDC OC - SC (coming from PDC's AM crosses) for Single PNs.
--			
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_SP_PDC_OCSC] AS



WITH ns AS
(
SELECT DISTINCT [CORE_PN]
,CONCAT([OC],' - ',[SC]) AS OC_SC
FROM [dbo].[ref_PDC_SP_AMPN_to_COREPN]
GROUP BY [CORE_PN]
,[OC]
,[SC]
)
,ns_c AS
(
SELECT DISTINCT [CORE_PN]
,COUNT([OC_SC]) AS [CORE_PN_COUNT]
FROM ns
GROUP BY [CORE_PN]
)
, p AS
(
SELECT DISTINCT [CORE_PN]
,[PN]
,[OC]
,[SC]
FROM [dbo].[ref_PDC_SP_AMPN_to_COREPN]
GROUP BY [CORE_PN]
,[PN]
,[OC]
,[SC]
)
SELECT DISTINCT ns_c.[CORE_PN]
      ,ns_c.[CORE_PN_COUNT]
	  ,p.[PN]      
	  ,p.[OC]
	  ,p.[SC]
FROM ns_c LEFT JOIN p ON ns_c.[CORE_PN]=p.[CORE_PN]
--WHERE ns_c.[CORE_PN_COUNT]>1
--WHERE ns_c.CORE_PN='8608106' OR ns_c.CORE_PN='8801811'
--ORDER BY ns_c.[CORE_PN]
--      ,ns_c.[CORE_PN_COUNT]
--	  ,p.[PN]      
--	  ,p.[OC]
--	  ,p.[SC]
GO
