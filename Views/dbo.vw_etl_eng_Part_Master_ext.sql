SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_etl_eng_Part_Master_ext] AS 
SELECT 
FEB9CD as PN
,FEO5TX as JA_Rev
,FETRCD as Similar_Part
,FEARQT as Weight_kg
,FEA4CE as MSDS
,FEA5CE as Comp_Ref
,FEIWSS as Key_Char
,FEA6CE as Matl_Spec
,FEV1TX as Matl_Note
,FEL0SS as Cat
,FED1CE as UNSPSC
,FECVIG as JA_Part_Desc_2
,FECWIG as JA_Part_Desc_3
,FEOJSS as Agile_Mstr
FROM dwn_eng_Part_Master_Ext
GO
