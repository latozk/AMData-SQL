SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



create view [dbo].[eng_PDC_Part_Dist_Unit_pl] as 


WITH p AS
  (
  SELECT [Unit]
  FROM [dbo].[inp_Picklist_Unit] p
  )
, u AS
(
SELECT [Unit]
      ,[Contract]
      ,[Div]
      ,[List]
      ,[PN]
  FROM [dbo].[eng_PDC_Part_Dist_CORE]
UNION
SELECT [Unit]
      ,[Contract]
      ,[Div]
      ,[List]
      ,[PN]
  FROM [dbo].[eng_PDC_Part_Dist_Agile]
  )
, c AS
(
SELECT [CORE_PN]
      ,[CORE_Brand]
      ,[PN]
      ,[PN_Brand]
      ,[XPN]
      ,[XPN_Brand]
      ,[ECN_EPO_dt]
      ,[PNAS400Fmt]
  FROM [dbo].[ref_CORE_PN_XRef] c
)
SELECT DISTINCT p.[Unit]
  ,u.[PN] AS CORE_PN
  ,c.[PNAS400Fmt] AS PDC_PN
  --,u.[Contract]
  --,u.[Div]
  --,u.[List]
  FROM p
  LEFT JOIN u ON p.[Unit]=u.[unit]
  LEFT JOIN c ON u.[PN]=c.[CORE_PN]

GO
