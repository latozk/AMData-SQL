SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/

create view [dbo].[res_Kit_BOM_8] as
SELECT [Brand]
      ,[Maint_Date]
      ,[PN]
      ,[COMM1]
      ,[Comp_1]
      ,[Comp_1_Qty]
      ,[Comp_2]
      ,[Comp_2_qty]
      ,[Comp_3]
      ,[Comp_3_Qty]
      ,[Comp_4]
      ,[Comp_4_Qty]
      ,[Comp_5]
      ,[Comp_5_Qty]
      ,[Comp_6]
      ,[Comp_6_Qty]
      ,[Comp_7]
      ,[Comp_7_qty]
      ,[Comp_8]
      ,[Comp_8_Qty]
      ,[COMM2]
      ,[COMM3]
      ,[COMM4]
      ,[COMM5]
      ,[COMM6]
      ,[COMM7]
      ,[COMM8]

  FROM [AMData].[dbo].[res_Kit_BOM]
GO
