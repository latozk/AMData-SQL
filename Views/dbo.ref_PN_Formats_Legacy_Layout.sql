SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[ref_PN_Formats_Legacy_Layout] AS

SELECT [PN]
      ,[SVG] AS [SVG PN]
      ,[CORE] AS [CORE_PN]
      ,[PM_Entry] AS [PM_Entered_PN]
      ,[DB_Entry] AS [DB_Entered_PN]
  FROM [dbo].[ref_PN_Fmt]
GO
