SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE view  [dbo].[wrk_NPO_Part_Dist_Agile] as 
select 
Series as Unit
, Contract
, Division as Div
, GLNumber as List
, PartNumber as PN
, Theater
from openquery(CPMSQL03, 'Select * From PartsDistribution.dbo.NPO_PartDistribution')
GO
