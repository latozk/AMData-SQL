SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- =============================================
--Author: Newell, R
--Date: 2023-07-31
--Purpose:	This view gets all new SS values to be uploaded to SVG requested or added on or after a given date.
--Once the list is created, the Readiness team can add the PNs to the "dbo.mdi_Daily_Safety_Stock_Adds_and_Updates" table
--again so the can be reloaded.  This view will ensure the latest record added since the desired date is captured and older
--records are ignored.
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[mdi_Daily_Safety_Stock_Adds_and_Updates_For_From_Date] AS

--Gets SS update changes recorded since the entered date
With q As
(
Select Case 
			When LTrim(RTrim(PN)) Like 'Y_________'
			Then Right(LTrim(RTrim(PN)),9)
			When LTrim(RTrim(PN)) Like 'Y___________'
			Then Right(LTrim(RTrim(PN)),11)
			Else LTrim(RTrim(PN))
			End As PN
	  ,Manual_SS
	  ,Append_Time
	  ,Dt
From dbo.mdi_Daily_Safety_Stock_Adds_and_Updates, dbo.inp_Dt
Where Append_Time>=Dt
--And PN='2090998'
)

--Gets last SS change request date for a PN
, d As
(
Select PN
	  , Max(Append_Time) As LstChngDt
From q
Group By PN
)
--Reformats PNs in Update table
, u As
(
Select Case 
			When LTrim(RTrim(PN)) Like 'Y_________'
			Then Right(LTrim(RTrim(PN)),9)
			When LTrim(RTrim(PN)) Like 'Y___________'
			Then Right(LTrim(RTrim(PN)),11)
			Else LTrim(RTrim(PN))
			End As PN
		,Manual_SS
		,OVRSL_SS
		,Append_Time
From dbo.mdi_Daily_Safety_Stock_Adds_and_Updates
)
--Gets Safety Stock requests for PN on the last SS change date
Select Distinct d.PN
	  ,u.Manual_SS
	  ,u.OVRSL_SS
	  ,LstChngDt
From d
Left Join u
On d.PN=u.PN And d.LstChngDt=Append_Time

GO
