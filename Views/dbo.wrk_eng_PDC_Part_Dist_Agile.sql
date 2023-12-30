SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE view [dbo].[wrk_eng_PDC_Part_Dist_Agile] as 
select Series as Unit
, Contract
, Division as Div
, GLNumber as List
, PartNumber as PN
, Theater
from openquery(CPMSQL03, 'Select * From PartsDistribution.dbo.PDC_PartDistribution')
GO
