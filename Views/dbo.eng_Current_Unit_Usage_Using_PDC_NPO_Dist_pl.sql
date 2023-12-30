SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[eng_Current_Unit_Usage_Using_PDC_NPO_Dist_pl] AS
--Gets uint usage grom the CORE and Agile distribution tables for Units which have AM, LAM, EUR and AP theater usage.  
--Note:  This view does not show unit usgae for parts which do not have usage on one of the above theaters. 
WITH p AS
(
SELECT PN
FROM dbo.inp_Picklist_Current_Unit_Usage
)
, d AS
(
SELECT [PN]
	  ,[Unit]
      ,[Contract]
      ,[Div]
      ,[List]
	  ,[Loc]
      ,[Col]
      ,[Structure_PN]
      ,[Structure]
      ,[Dist_Div]
  FROM [dbo].[eng_PDC_Part_Dist_CORE]
  UNION
  SELECT [PN]
	  ,[Unit]
      ,[Contract]
      ,[Div]
      ,[List]
	  ,[Loc]
      ,[Col]
      ,[Structure_PN]
      ,[Structure]
      ,[Dist_Div]
  FROM [dbo].[eng_NPO_Part_Dist_CORE]
  )
SELECT DISTINCT p.[PN]
	  ,p1.[Status] AS PN_Status
  	  ,[Unit]
      ,[Contract]
      ,[Div]
      ,[List]
	  ,p2.[Status] AS List_Status
	  --,d.[Loc]
      ,[Col]
      ,[Structure_PN]
	  ,p3.[Status] AS Structure_PN_Status
      ,[Structure]
      ,[Dist_Div]
  FROM p
  LEFT JOIN d
  ON p.PN=d.PN
  LEFT JOIN eng_Part_Master p1
  ON d.PN=p1.PN
  LEFT JOIN eng_Part_Master p2
  ON d.List=p2.PN
  LEFT JOIN eng_Part_Master p3
  ON d.Structure_PN=p3.PN
  WHERE p1.[Status]='' or p1.[Status] IS NULL AND p2.[Status] ='' OR p2.[Status] IS NULL AND p3.[Status] ='' OR p3.[Status] IS NULL



GO
