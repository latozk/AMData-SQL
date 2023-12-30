SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




--When SPN is implemented, uncomment lines 232 to 294 and 304 to 305.

CREATE View [dbo].[cable_Detail] As

Select b.PN
      ,b.Bulk_PN
      ,c1.HPN As Bulk_HPN
      ,c1.YPN As Bulk_YPN
	  ,c1.[Desc] As Bulk_Desc
      ,c1.[Type] As Bulk_Type
	  ,c1.Gauge As Bulk_Gauge
      ,c1.Additional_Info As Bulk_Comments
      ,b.Terminal_PN
	  ,c2.HPN As Terminal_HPN
      ,c2.YPN As Terminal_YPN
      ,b.Rev
      ,b.Bulk_L1
      ,b.Bulk_L2
      ,b.Shield_L1
      ,b.Heat_Shrink_PN
	  ,c3.HPN As Heat_Shrink_HPN
      ,c3.YPN As Heat_Shrink_YPN
      ,b.Gland_PN
	  ,c4.HPN As Gland_HPN
      ,c4.YPN As Gland_YPN
      ,b.L4
      ,b.Terminal_Strip_L4
      ,b.Terminal_Angle
      ,b.Label1_PN
	  ,c5.HPN As Label1_HPN
      ,c5.YPN As Label1_YPN
      ,b.Label2_PN
	  ,c6.HPN As Label2_HPN
      ,c6.YPN As Label2_YPN
      ,b.[Desc] As Assy_Desc
      ,b.Initials
      --,b.Alt_Build
      ,b.Rev_Date

  From dbo.cable_BOM b
  Left Join dbo.cable_Comp c1
  On b.Bulk_PN=c1.PN
  Left Join dbo.cable_Comp c2
  On b.Terminal_PN=c2.PN
  Left Join dbo.cable_Comp c3
  On b.Heat_Shrink_PN=c3.PN
  Left Join dbo.cable_Comp c4
  On b.Gland_PN=c4.PN
  Left Join dbo.cable_Comp c5
  On b.Label1_PN=c5.PN
  Left Join dbo.cable_Comp c6
  On b.Label2_PN=c6.PN

GO
