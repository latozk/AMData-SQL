SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




--Finds duplicate Production PN records for given Hyster and/or Yale PN



CREATE View [dbo].[hose_BOM_Prod_Duplicates] as

--Finds Production PN duplicates for HPNs
With hb As
(
Select Origin_Date
	  ,Maint_Date
	  ,Initials
	  ,[Type]
	  ,PN
	  ,Right(PN,1) As Suffix
	  ,HPN
	  ,YPN
	  ,Assy_Length_IN
	  ,Bulk_PN
	  From dbo.hose_BOM
	  Where HPN<>'NONE' AND HPN Is Not NUll
)
,hc AS
(
Select Distinct HPN
	  ,Right(PN,1) As Suffix
	  ,Count(Right(PN,1)) As Duplicate
  	  From hose_BOM
	  Where HPN<>'NONE' AND HPN Is Not NUll
	  Group By HPN, Right(PN,1)
)
,hf As
(
Select PN
      ,hb.HPN
      ,YPN
	  ,Duplicate
      ,Assy_Length_IN
      ,Bulk_PN
	  ,'Multiple Production PNs for HPN' As Audit_Message
	  ,Origin_Date
      ,Maint_Date
      ,Initials
      ,[Type]
From hb
Join hc
on hb.HPN=hc.HPN And hb.Suffix=hc.Suffix
Where hc.Duplicate>1
)

--Finds Production PN duplicates for YPNs
, yb As
(
Select Origin_Date
	  ,Maint_Date
	  ,Initials
	  ,[Type]
	  ,PN
	  ,Right(PN,1) As Suffix
	  ,HPN
	  ,YPN
	  ,Assy_Length_IN
	  ,Bulk_PN
	  From dbo.hose_BOM
	  Where YPN<>'NONE' AND YPN Is Not NUll
)
,yc AS
(
Select Distinct YPN
	  ,Right(PN,1) As Suffix
	  ,Count(Right(PN,1)) As Duplicate
  	  From hose_BOM
	  Where YPN<>'NONE' AND YPN Is Not NUll
	  Group By YPN, Right(PN,1)
)
,yf As
(
Select PN
      ,HPN
      ,yb.YPN
	  ,Duplicate
      ,Assy_Length_IN
      ,Bulk_PN
	  ,'Multiple Production PNs for YPN' As Audit_Message
	  ,Origin_Date
      ,Maint_Date
      ,Initials
      ,[Type]
From yb
Join yc
on yb.YPN=yc.YPN And yb.Suffix=yc.Suffix
Where yc.Duplicate>1
)
,u As
(
Select *
From hf
Union
Select *
From yf
)

Select *
From u
GO
