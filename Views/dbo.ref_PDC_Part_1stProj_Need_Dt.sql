SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[ref_PDC_Part_1stProj_Need_Dt] AS


SELECT [SPN]
      ,[AMPN]
      ,[Proj]
      ,[ImplDt]
      ,[RelDt]
      ,[NewRplcng]
  FROM [dbo].[ref_PDC_Part_1st_Proj_Impl_Dt]

GO
