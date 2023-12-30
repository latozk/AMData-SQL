SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[ref_PDC_Distribution_CORE_PN_pl] AS

WITH u AS
(
SELECT [Unit]
      ,[Contract]
      ,[Div]
      ,[List]
      ,[PN]
      ,[Loc]
	  ,Null AS [Theater]
  FROM [dbo].[eng_PDC_Part_Dist_CORE] c
   WHERE [Loc]='PDC'
UNION
SELECT [Unit]
      ,[Contract]
      ,[Div]
      ,[List]
      ,[PN]
	  ,Null AS [Loc]
      ,[Theater]
 FROM [dbo].[eng_PDC_Part_Dist_Agile] a
  WHERE [Theater]='AM' OR [Theater]='LAM'
)
SELECT [Unit]
      ,[Contract]
      ,[Div]
      ,[List]
      ,u.[PN]
      ,[Loc]
	  ,[Theater]
  FROM u
   JOIN [dbo].[inp_Picklist_CORE_PN] p
   ON u.PN = p.PN


GO
