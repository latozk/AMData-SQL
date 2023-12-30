SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





-- =============================================
--Author: Newell, R
--Date: 2023-06-12
--Purpose:	This view creates the data needed to upload in the SVG file \\GlobalParts\CP_US\SSPTRD.txt
--			
--Last modified date:
--Modification notes:

-- =============================================

-- If Readiness is provided Manual_SS and OVRSL_SS, those values will be loaded into SKUCUST34 and OVRSL respectively
-- otherwise the Manual_SS values provided will be compared to SVG values to determine what should be loaded into SKUCUST34 and OVRSL

--New SS values are provided to the Parts Readiness team, but these values are not necessarily uploaded to SVG,
	--Manual_SS
	--OVRSL_SS 
--These new values are compared to the SS values already stored in SVG and the logic below is used to determine 
--what values should be uploaded for:
	--OVRSL:  the current OVRSL value in SVG - which is equal to the greater of SVG's current SKUCUST34 and CSL (demand) SS values
	--SKUCUST34:  the current Manual SS in SVG 
	--No values are provided for the CSL SS field
--The comparison logic also utilizes two additional fields:  SLMinSLQty and SLMaxSLQty.

--Logic to use (provided by Blake on 05/25/2023)
--The first 3 scenarios where the Manual SS increases or stays the same is pretty straight forward, but gets a little trickier when it decreases
	--•	If NewSS = current SKUCUST34, then no change to anything
	--•	If NewSS > current SKUCUST34 and >= OVRSL, change both to NewSS
	--•	IF NewSS > current SKUCUST34, but < OVRSL, SKUCUST34 = NewSS; OVRSL stays at current OVRSL
	--•	If New SS < current SKUCUST34, change SKUCUST34 to the New SS
	--	For the OVRSL, take the greater of (NewSS, SLMinSLQty and the smaller of (CSL and SLMaxSLQty))


CREATE VIEW [dbo].[mdi_Daily_Safety_Stock_Adds_and_Updates_SSPTRD] AS


--Gets qualifying PN and SS changes which are only those changes in the last 7 days
With q As
(
Select Case 
			When LTrim(RTrim(PN)) Like 'Y_________'
			Then Right(LTrim(RTrim(PN)),9)
			When LTrim(RTrim(PN)) Like 'Y___________'
			Then Right(LTrim(RTrim(PN)),11)
			Else LTrim(RTrim(PN))
			End As PN
	  ,Append_Time
From dbo.mdi_Daily_Safety_Stock_Adds_and_Updates
Where Append_Time>DateAdd(day,-7,GetDate())
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
, r As
(
Select Distinct d.PN
	  ,u.Manual_SS
	  ,u.OVRSL_SS
	  ,LstChngDt
From d
Left Join u
On d.PN=u.PN And d.LstChngDt=u.Append_Time
--Where d.PN In ('Y524141197', ' 1691113', ' 2036277', ' 2059720', ' 4116403', ' 1553762', ' 1359562')
)

--For each PN, gets the minimum value between the following fields in mdi: CSL, SLMinSLQty and SLMaxSLQty
, q1 As
(
SELECT r.PN
      ,r.Manual_SS
	  ,r.OVRSL_SS
      ,s.SKUCUST34
      ,s.CSL
	  ,s.SLMinSLQty
      ,s.SLMaxSLQty
	  ,s.OVRSL
	  ,(Select Min(v) From (Values (s.CSL),(s.SLMaxSLQty)) As Value (v)) As v1
  FROM r
  Left Join [dbo].[mdi_SS] s
  On r.PN=s.PN
  Where r.PN Is Not Null
)
, q2 As
(
Select PN
	  ,Manual_SS
	  ,OVRSL_SS
      ,SKUCUST34
      ,CSL
	  ,SLMinSLQty
      ,SLMaxSLQty
	  ,OVRSL
	  ,v1	
	  ,(Select Max(v) From (Values (Manual_SS),(SLMinSLQty),(v1)) As Value (v)) As v2
From q1
)

Select PN, Manual_SS As New_Manual_SS, OVRSL_SS As New_OVRSL_SS, SKUCUST34 As SKUCUST34_Current, OVRSL As OVRSL_Current, CSL, SLMinSLQty, SLMaxSLQty, v1 As MinValue_v1, v2 As MaxValue_v2
	  , Case 
			When LTrim(RTrim(PN)) Like 'Y_________'
			Then 'NMH-'+Right(LTrim(RTrim(PN)),9)
			When LTrim(RTrim(PN)) Like 'Y___________'
			Then 'NMH-'+Right(LTrim(RTrim(PN)),11)
			Else 'NMH-'+LTrim(RTrim(PN))
			End As HostPartID
	  ,'000014' As HostLocID
	  ,Case
			When OVRSL_SS Is Not Null
			Then OVRSL_SS
			-- 2023-06-12 Added the following line as OVRSL needs a value for parts getting SVG SS for the first time (without this line OVRSL is blank in the upload file).
			When OVRSL Is Null And Manual_SS Is Not Null
			Then Manual_SS
			--When Manual_SS=SKUCUST34
			--Then OVRSL
			When Manual_SS>SKUCUST34 And Manual_SS>=OVRSL
			Then Manual_SS
			--When Manual_SS>SKUCUST34 And Manual_SS<OVRSL
			--Then OVRSL
			When Manual_SS<SKUCUST34
			Then Cast(v2 As Numeric(5,0))
			Else Cast(OVRSL As Numeric(5,0))
			End As OVRSL
	  ,Case
			When Manual_SS Is Not Null And OVRSL_SS Is Not Null
			Then Manual_SS
			--When Manual_SS=SKUCUST34
			--Then SKUCUST34
			-- 2023-06-12 Added the following line as SKUCUST34 needs a value for parts getting SVG SS for the first time (without this line SKUCUST34 is blank in the upload file).
			When Manual_SS Is Not Null And SKUCUST34 Is Null
			Then Manual_SS
			When Manual_SS>SKUCUST34 And Manual_SS>=OVRSL
			Then Manual_SS
			When Manual_SS>SKUCUST34 And Manual_SS<OVRSL
			Then Manual_SS
			When Manual_SS<SKUCUST34
			Then Manual_SS
			Else SKUCUST34
			End As SKUCUST34
From q2	
Where PN Is Not Null

GO
