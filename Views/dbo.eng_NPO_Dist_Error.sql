SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE View [dbo].[eng_NPO_Dist_Error] as

--/ Gets divisions which should not have NPO distribution.
WITH x AS
(
SELECT [Div]
      ,[Name]
      ,[Type]
  FROM [AMData].[dbo].[eng_Div]
  WHERE ([Name] Like '%-LAM%' Or [Name] Like '%-JPN%' Or [Name] Like '%-AM%' Or [Name] Like '%-SAP%' Or [Name] Like '%- LAM%' Or [Name] Like '%- JPN%' Or [Name] Like '%- AM%' Or [Name] Like '%- SAP%' Or [Name] Like '%SAO%PAULO%')
  AND [Type]='M'
  )
--/ Gets units and divisions which should not have NPO distribution.
SELECT d.[Unit]
      ,d.[Contract]
      ,d.[Div]
	  ,x.[Type]
	  ,x.[Name]
	  ,u.[Status]
      ,d.[Loc]
      ,d.[Final_Assy]
  FROM [AMData].[dbo].[eng_Unit_Dist] d
  JOIN [AMData].[dbo].[eng_Unit_Contract] u
  ON   d.[Unit]=u.[Unit] AND d.[Contract]=u.[Contract]
  JOIN x
  ON   d.[Div]=x.[Div]
  WHERE d.[loc]='NPO' AND u.[Status]<>'CAN'
GO
