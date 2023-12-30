SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





--Moved c2 and c3 in front of c1 because of PNs like 1481997 which is a stand alone and an AMPN.
--2023-10-12 Renamed Set c6a to Set c6a1 and added Set c6a2
--2023-10-12 Renamed Set c3a to Set c3a1 and added Set c3a2

CREATE PROCEDURE [dbo].[sp_ref_PDC_SPN_X_Ref_2023_11_01]  AS
Truncate Table dbo.ref_PDC_SPN_X_Ref;



-- _______________________
--Adding this section to pick up PNs missed using Kevin's X ref,
--________________________



--Set c2a':  Gets non-cancelled CORE SPNs which are equal to PDC PNs

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

-----Gets non-cancelled CORE SPNs
,spn As
(
Select PN
	  ,[Status] As nonCAN
From dbo.eng_Part_Master epm
Where (epm.[Status]<>'CAN' Or epm.[Status]='' Or epm.[Status] Is Null)
  And (Rev<80 Or (Rev>99 And Rev<300))
  And (Test_Status<>'T' Or Test_Status='' Or Test_Status Is Null)
)

,c2 As
(
Select spn.PN As SPN
	  ,d.PN
	  ,'SPN=CORE PN for PM PN = Non-canceled CORE SPN' As Category
	  From d
	  Join dbo.ref_PN_Fmt f
	  On d.PN=f.PN
	  Join spn
	  On f.CORE=spn.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
--Into dbo.ref_PDC_SPN_X_Ref
From c2
Where c2.SPN Is Not Null And c2.PN Is Not Null
;

--Set c3a1:  Gets non-cancelled CORE SPNs which have non-OBS AM PNs equal to PDC PNs
-----Picks up non-cancelled CORE PNs which have PDC PNs showing as AM PNs 

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail

)
--Non-Canceled CORE PNs

,spna As
(
Select pm.PN As SPN
	  ,AMPN AS PN
	  From eng_Part_Master pm
	  Left Join eng_AMPN_Master am
	  On pm.PN=am.PN
	  Where (pm.[Status]<>'CAN'Or pm.[Status]='')
	  And am.[Status] <>'OBS'
	  And (Rev<80 Or (Rev>99 And Rev<300))
      And (Test_Status<>'T' Or Test_Status='' Or Test_Status Is Null)
)

,spnh As
(
Select *
From spna
Where PN Like '_______'
)

,spny As
(
Select *
From spna
Where PN Like '_________'
)

,spnu As
(
Select *
From spna
Where PN Like '________'
)

,spn As
(
Select * 
From spnh
Union
Select *
From spny
Union
Select *
From spnu
)

,c3 As
(
Select spn.SPN
	  ,d.PN
	  ,'SPN = Non-cancelled CORE PN for PM PN = non-OBS AMPN' As Category
	  From spn
	  Join dbo.ref_PN_Fmt f
	  On spn.PN=f.CORE
	  Join d
	  On f.PN=d.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  --Where x.PN=' 0376763    '
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From c3
Where c3.SPN Is Not Null And c3.PN Is Not Null
;

--Set c1:  Gets non-canceled CORE SPNs for PDC PNs using the CORE X Ref table which only includes non-cancelled CORE PN and non-obsoleted AM PNs.

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)
,cx As
(
Select CORE_PN
	  --,PNAS400Fmt
	  ,Case
		  When PNAS400Fmt Like' _______    '
		  Then Left(PNAS400Fmt,8)
		  Else PNAS400Fmt
		  End As PNAS400Fmt
      ,PN_Brand
	  --,XPNAS400Fmt
	  ,Case
		  When XPNAS400Fmt Like' _______    '
		  Then Left(XPNAS400Fmt,8)
		  Else XPNAS400Fmt
		  End As XPNAS400Fmt
	  ,XPN_Brand
      ,[Status]
	  From dbo.ref_CORE_PN_XRef
)

,c As
(
Select CORE_PN
      ,PNAS400Fmt
      ,PN_Brand
	  ,XPNas400Fmt
	  ,XPN_Brand
      ,cx.[Status]
  From cx
  Left Join dbo.ref_PDC_SPN_TRD_Exceptions e
  On CORE_PN=e.SPN
  Join eng_Part_Master epm
  On CORE_PN=epm.PN
  Where e.SPN Is Null
  And (Rev<80 Or (Rev>99 And Rev<300))
  And (cx.[Status] <>'CAN' Or cx.[Status] ='' Or cx.[Status] Is Null)
)

,c1 As 
(
Select c.CORE_PN As SPN
	  ,c.PNAS400Fmt As PN
	  ,'SPN=CORE PN for PM PN=CORE PN or PM PN=CORE AMPN (uses CORE X Ref - No CAN or OBS PNs)' As Category
	  From c
	  Join d
	  On d.PN=c.PNAS400Fmt
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
--Into dbo.ref_PDC_SPN_X_Ref
From c1
Where c1.SPN Is Not Null And c1.PN Is Not Null
;

--Set c3a2:  Gets cancelled CORE SPNs which have non-OBS AM PNs equal to PDC PNs
-----Picks up cancelled CORE PNs which have PDC PNs showing as AM PNs 

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail

)
--Non-Canceled CORE PNs

,spna As
(
Select pm.PN As SPN
	  ,AMPN AS PN
	  From eng_Part_Master pm
	  Left Join eng_AMPN_Master am
	  On pm.PN=am.PN
	  Where (pm.[Status]='CAN')
	  And am.[Status] <>'OBS'
	  And (Rev<80 Or (Rev>99 And Rev<300))
      And (Test_Status<>'T' Or Test_Status='' Or Test_Status Is Null)
)

,spnh As
(
Select *
From spna
Where PN Like '_______'
)

,spny As
(
Select *
From spna
Where PN Like '_________'
)

,spnu As
(
Select *
From spna
Where PN Like '________'
)

,spn As
(
Select * 
From spnh
Union
Select *
From spny
Union
Select *
From spnu
)

,c3 As
(
Select spn.SPN
	  ,d.PN
	  ,'SPN = Cancelled CORE PN for PM PN = non-OBS AMPN' As Category
	  From spn
	  Join dbo.ref_PN_Fmt f
	  On spn.PN=f.CORE
	  Join d
	  On f.PN=d.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  --Where x.PN=' 0376763    '
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From c3
Where c3.SPN Is Not Null And c3.PN Is Not Null
;
--______________________________
--______________________________

--Runs set c2 and c3 again for cancelled PNs (first c2 and c3 runs for non-cancelled PNs)


--Set c2b:  Gets cancelled CORE SPNs which are equal to PDC PNs

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)
-----Gets cancelled CORE SPNs
,spn As
(
Select PN
	  ,[Status] As CAN
From dbo.eng_Part_Master epm
Where epm.[Status]='CAN'
  And (Rev<80 Or (Rev>99 And Rev<300))
  And (Test_Status<>'T' Or Test_Status='' Or Test_Status Is Null)
)

,c2 As
(
Select spn.PN As SPN
	  ,d.PN
	  ,'SPN=CORE PN for PM PN = canceled CORE SPN' As Category
	  From d
	  Join dbo.ref_PN_Fmt f
	  On d.PN=f.PN
	  Join spn
	  On f.CORE=spn.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
--Into dbo.ref_PDC_SPN_X_Ref
From c2
Where c2.SPN Is Not Null And c2.PN Is Not Null
;


--Set c3b:  Gets cancelled CORE SPNs which have non-OBS AM PNs equal to PDC PNs
-----Picks up cancelled CORE PNs which have PDC PNs showing as AM PNs 

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

--AM PNs
, am As
(
Select a.PN
	  ,a.AMPN
	  ,a.[Status]
	  From eng_AMPN_Master a
	  Where [Status]<>'OBS' Or [Status]='' Or [Status] Is Null
)

--Gets obsoleted Hyster AMPNs
,h As
(
Select *
From am
Where AMPN Like '_______'
)

--Gets obsoleted Yale AMPNs
,y As
(
Select *
From am
Where AMPN Like '_________'
)

--Gets Max SPN for Hyster AMPN
,msh As
(
Select AMPN As PN
	  ,Max(PN) As SPN
From h
Group By AMPN
)

--Gets Max Yale AMPN when multiple AMPNs are obsoleted on the same date
,msy As
(
Select AMPN As PN
	  ,Max(PN) As SPN
From y
Group By AMPN
)

,ms As
(
Select *
From msh
Union
Select *
From msy
)

,spna As
(
Select pm.PN As SPN
	  ,ms.PN
	  From eng_Part_Master pm
	  Left Join ms
	  On pm.PN=ms.PN
	  Where (pm.[Status]='CAN')
	  And (Rev<80 Or (Rev>99 And Rev<300))
      And (Test_Status<>'T' Or Test_Status='' Or Test_Status Is Null)
)

,c3 As
(
Select spna.SPN
	  ,d.PN
	  ,'SPN = Cancelled CORE PN for PM PN = non-OBS AMPN' As Category
	  From spna
	  Join dbo.ref_PN_Fmt f
	  On spna.PN=f.CORE
	  Join d
	  On f.PN=d.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From c3
Where c3.SPN Is Not Null And c3.PN Is Not Null
;


--Set c4:  Gets cancelled CORE SPNs which have AM PNs equal to PDC PNs and obsoleted AM PNs for the cancel date
-----Picks up cancelled CORE PNs which have PDC PNs showing as AM PNs obsoleted on the CORE PN canceled date
-----These were not picked up in Set 1 to avoid getting multiple SPNs when both HPN and Yale PN existed and one is now canceled.
-----This pass will get the SPN for PDC PNs when the SPN is an obsoleted AM PN due to a cancelled CORE_PN.

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)
-----Canceled AM PNs for Canceled CORE PNs where AM PN cancelled at the same time the CORE PN was cancelled.  This should provide valid SPNs for the AM PNs.

--------Gets last ECN date
, le As
(
Select PN
	  , Max(Rel_Dt) As LstECNDt
From eng_Part_ECN_History
Group By PN
)

--------Gets PM cancel dates
, cd As
(
Select h. PN
	  ,h.[Status] As CAN
	  ,h.Rel_Dt As CancelDt
From eng_Part_ECN_History h
Join le
On h.PN=le.PN 
Join dbo.eng_Part_Master epm
On h.PN=epm.PN
Where h.[Status]='CAN' And epm.[Status]='CAN' And h.Rel_Dt=le.LstECNDt
  And (epm.Rev<80 Or (epm.Rev>99 And epm.Rev<300))
  And (epm.Test_Status<>'T' Or epm.Test_Status='' Or epm.Test_Status Is Null)
)

--------Gets AM obsolete dates.
, od As
(
Select a.PN
	  ,a.AMPN
	  ,a.[Status] As OBS
	  ,a.ECN_EPO_Dt As OBSDt
	  From eng_AMPN_Master_OBS a
	  Where [Status]='OBS'
)

--Gets obsoleted Hyster AMPNs
,h As
(
Select *
From od
Where AMPN Like '_______'
)

--Gets obsoleted Yale AMPNs
,y As
(
Select *
From od
Where AMPN Like '_________'
)

--Gets Max SPN for Hyster AMPN
,fsh As
(
Select AMPN As PN
	  ,Max(PN) As SPN
From h
Group By AMPN
)

--Gets Max Yale AMPN when multiple AMPNs are obsoleted on the same date
,fsy As
(
Select AMPN As PN
	  ,Max(PN) As SPN
From y
Group By AMPN
)

,fs As
(
Select *
From fsh
Union
Select *
From fsy
)

----Gets first Hyster AMPN when multiple AMPNs are obsoleted on the same date
--,fah As
--(
--Select Min(AMPN) As AMPN
--	  ,PN
--From h
--Group By PN
--)

----Gets first Yale AMPN when multiple AMPNs are obsoleted on the same date
--,fay As
--(
--Select Min(AMPN) As AMPN
--	  ,PN
--From y
--Group By PN
--)

--,fa As
--(
--Select *
--From fah
--Union
--Select *
--From fay
--)

--------Gets canceled SPNs
,spn As
(
Select cd.PN
	  ,cd.CAN
	  ,cd.CancelDt
	  ,od.AMPN
	  ,od.OBS
	  ,od.OBSDt
From cd
Join od
On cd.PN=od.PN
)

,c4 As
(
Select spn.PN As SPN
	  ,d.PN
	  ,'SPN = CORE PN when PM PN = OBS AMPN SPN when AM PN OBS Dt=CORE PN CAN Dt' As Category
	  From d
	  Join dbo.ref_PN_Fmt f
	  On d.PN=f.PN
	  Join spn
	  On f.CORE=spn.AMPN
	  Join fs
	  On spn.PN=fs.SPN And spn.AMPN=fs.PN
	  --Join fa
	  --On spn.AMPN=fa.AMPN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
--Into dbo.ref_PDC_SPN_X_Ref
From c4
Where c4.SPN Is Not Null And c4.PN Is Not Null
;

--Set c5a:  Gets all SPNs not already loaded to the SPN X-Ref table using non-OBS AM PNs for Non-Cancelled PM Records
-----Gets PDC PNs equal to obsoleted AM PNs even if OBS date not equal to CORE PN CAN date.
-----This could pick up AM PNs obsoleted due to NSS.

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

--AM PNs
, am As
(
Select a.PN
	  ,a.AMPN
	  ,a.[Status]
	  From eng_AMPN_Master a
	  Where [Status]<>'OBS' Or [Status]='' Or [Status] Is Null
)

--Gets obsoleted Hyster AMPNs
,h As
(
Select *
From am
Where AMPN Like '_______'
)

--Gets obsoleted Yale AMPNs
,y As
(
Select *
From am
Where AMPN Like '_________'
)

--Gets Max SPN for Hyster AMPN
,msh As
(
Select AMPN As PN
	  ,Max(PN) As SPN
From h
Group By AMPN
)

--Gets Max Yale AMPN when multiple AMPNs are obsoleted on the same date
,msy As
(
Select AMPN As PN
	  ,Max(PN) As SPN
From y
Group By AMPN
)

,ms As
(
Select *
From msh
Union
Select *
From msy
)

,spna As
(
Select pm.PN As SPN
	  ,ms.PN
	  From eng_Part_Master pm
	  Left Join ms
	  On pm.PN=ms.PN
	  Where (pm.[Status]<>'CAN' Or pm.[Status]='' Or pm.[Status] Is Null)
	  And (Rev<80 Or (Rev>99 And Rev<300))
      And (Test_Status<>'T' Or Test_Status='' Or Test_Status Is Null)
)

, spn As
(
Select spna.SPN
	  ,spna.PN
   From spna
)

,c5 As
(
Select spn.SPN
	  ,d.PN
	  ,'SPN=AMPN Master PN when PM PN = nonOBS AMPN' As Category
	  From spn
	  Join dbo.ref_PN_Fmt f
	  On spn.PN=f.CORE
	  Join d
	  On f.PN=d.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
--Into dbo.ref_PDC_SPN_X_Ref
From c5
Where c5.SPN Is Not Null And c5.PN Is Not Null
;



--Set c5b:  Gets all SPNs not already loaded to the SPN X-Ref table using non-OBS AM PNs for Cancelled PM Records
-----Gets PDC PNs equal to obsoleted AM PNs even if OBS date not equal to CORE PN CAN date.
-----This could pick up AM PNs obsoleted due to NSS.

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

--AM PNs
, am As
(
Select a.PN
	  ,a.AMPN
	  ,a.[Status]
	  From eng_AMPN_Master a
	  Where [Status]<>'OBS' Or [Status]='' Or [Status] Is Null
)

--Gets obsoleted Hyster AMPNs
,h As
(
Select *
From am
Where AMPN Like '_______'
)

--Gets obsoleted Yale AMPNs
,y As
(
Select *
From am
Where AMPN Like '_________'
)

--Gets Max SPN for Hyster AMPN
,msh As
(
Select AMPN As PN
	  ,Max(PN) As SPN
From h
Group By AMPN
)

--Gets Max Yale AMPN when multiple AMPNs are obsoleted on the same date
,msy As
(
Select AMPN As PN
	  ,Max(PN) As SPN
From y
Group By AMPN
)

,ms As
(
Select *
From msh
Union
Select *
From msy
)

,spna As
(
Select pm.PN As SPN
	  ,ms.PN
	  From eng_Part_Master pm
	  Left Join ms
	  On pm.PN=ms.PN
	  Where (pm.[Status]='CAN')
	  And (Rev<80 Or (Rev>99 And Rev<300))
      And (Test_Status<>'T' Or Test_Status='' Or Test_Status Is Null)
)

, spn As
(
Select spna.SPN
	  ,spna.PN
   From spna
)

,c5 As
(
Select spn.SPN
	  ,d.PN
	  ,'SPN=AMPN Master PN when PM PN = nonOBS AMPN for Cancelled CORE PN' As Category
	  From spn
	  Join dbo.ref_PN_Fmt f
	  On spn.PN=f.CORE
	  Join d
	  On f.PN=d.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
--Into dbo.ref_PDC_SPN_X_Ref
From c5
Where c5.SPN Is Not Null And c5.PN Is Not Null
;

--Set c6a1:  Gets all SPNs not already loaded to the SPN X-Ref table using OBS AM PNs where PM PN not cancelled
-----Gets PDC PNs equal to obsoleted AM PNs even if OBS date not equal to CORE PN CAN date.
-----This could pick up AM PNs obsoleted due to NSS.

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

, spn As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
)

--The next two sections get:
----the first SPN for a obsoleted AMPNs
----the first obsoleted AMPN for a SPN (not used)


--Obsoleted Hyster AMPN for SPN
,h As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
   Where AMPN Like '_______' 
)

--Obsoleted Yale AMPN for SPN
,y As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
   Where AMPN Like '_________' 
)

--Obsoleted Utilev AMPN for SPN
,u As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
   Where AMPN Like '________' 
)

--Max SPN for obsoleted Hyster AMPN
,fsh As
(
Select Max(SPN) SPN
	  ,PN
   From h
   Group By PN
)

--Max SPN for obsoleted Yale AMPN
,fsy As
(
Select Max(SPN) As SPN
	  ,PN
   From y
   Group By PN
)

--Max SPN for obsoleted Utilev AMPN
,fsu As
(
Select Max(SPN) As SPN
	  ,PN
   From u
   Group By PN
)

--Max SPN for obsoleted AMPN
,fsa As
(
Select *
From fsh
Union 
Select *
From fsy
Union 
Select *
From fsu
)

,fs As
(
Select fsa.*
From fsa
Join eng_Part_Master epm
On fsa.SPN=epm.PN
Where (epm.[Status] <>'CAN' Or epm.[Status]='' Or epm.[Status] Is Null) 
)

----First Hyster AMPN for SPN
--,fah As
--(
--Select SPN
--	  ,Min(PN) As PN
--   From h
--   Group By SPN
--)

----First Yale AMPN for SPN
--,fay As
--(
--Select SPN
--	  ,Min(PN) As PN
--   From y
--   Group By SPN
--)
----First obsoleted AMPN for SPN
--,fa As
--(
--Select *
--From fah
--Union 
--Select *
--From fay
--)

,c6 As
(
Select spn.SPN
	  ,d.PN
	  ,'SPN=AMPN Master PN when PM PN = OBS AMPN - Non-cancelled' As Category
	  From d
	  Join dbo.ref_PN_Fmt f
	  On d.PN=f.PN
	  Join spn
	  On f.CORE=spn.PN
	  Join fs
	  On spn.SPN=fs.SPN And spn.PN=fs.PN
	  --Join fa
	  --On spn.PN=fa.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
--Into dbo.ref_PDC_SPN_X_Ref
From c6
Where c6.SPN Is Not Null And c6.PN Is Not Null
;

--Set c6a2:  Gets all SPNs not already loaded to the SPN X-Ref table using OBS AM PNs where PM PN is cancelled
-----Gets PDC PNs equal to obsoleted AM PNs even if OBS date not equal to CORE PN CAN date.
-----This could pick up AM PNs obsoleted due to NSS.

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

, spn As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
)

--The next two sections get:
----the first SPN for a obsoleted AMPNs
----the first obsoleted AMPN for a SPN (not used)


--Obsoleted Hyster AMPN for SPN
,h As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
   Where AMPN Like '_______' 
)

--Obsoleted Yale AMPN for SPN
,y As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
   Where AMPN Like '_________' 
)

--Obsoleted Utilev AMPN for SPN
,u As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
   Where AMPN Like '________' 
)

--Max SPN for obsoleted Hyster AMPN
,fsh As
(
Select Max(SPN) SPN
	  ,PN
   From h
   Group By PN
)

--Max SPN for obsoleted Yale AMPN
,fsy As
(
Select Max(SPN) As SPN
	  ,PN
   From y
   Group By PN
)

--Max SPN for obsoleted Utilev AMPN
,fsu As
(
Select Max(SPN) As SPN
	  ,PN
   From u
   Group By PN
)

--Max SPN for obsoleted AMPN
,fsa As
(
Select *
From fsh
Union 
Select *
From fsy
Union 
Select *
From fsu
)

,fs As
(
Select fsa.*
From fsa
Join eng_Part_Master epm
On fsa.SPN=epm.PN
Where epm.[Status]='CAN' 
)

----First Hyster AMPN for SPN
--,fah As
--(
--Select SPN
--	  ,Min(PN) As PN
--   From h
--   Group By SPN
--)

----First Yale AMPN for SPN
--,fay As
--(
--Select SPN
--	  ,Min(PN) As PN
--   From y
--   Group By SPN
--)
----First obsoleted AMPN for SPN
--,fa As
--(
--Select *
--From fah
--Union 
--Select *
--From fay
--)

,c6 As
(
Select spn.SPN
	  ,d.PN
	  ,'SPN=AMPN Master PN when PM PN = OBS AMPN - Cancelled' As Category
	  From d
	  Join dbo.ref_PN_Fmt f
	  On d.PN=f.PN
	  Join spn
	  On f.CORE=spn.PN
	  Join fs
	  On spn.SPN=fs.SPN And spn.PN=fs.PN
	  --Join fa
	  --On spn.PN=fa.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
--Into dbo.ref_PDC_SPN_X_Ref
From c6
Where c6.SPN Is Not Null And c6.PN Is Not Null
;

--Set c6b:  Gets all SPNs not already loaded to the SPN X-Ref table using OBS AM PNs where PM PN is cancelled
-----Gets PDC PNs equal to obsoleted AM PNs even if OBS date not equal to CORE PN CAN date.
-----This could pick up AM PNs obsoleted due to NSS.

--PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

, spn As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
)

--The next two sections get:
----the first SPN for a obsoleted AMPNs
----the first obsoleted AMPN for a SPN (not used)


--Obsoleted Hyster AMPN for SPN
,h As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
   Where AMPN Like '_______' 
)

--Obsoleted Yale AMPN for SPN
,y As
(
Select PN As SPN
	  ,AMPN As PN
   From eng_AMPN_Master_OBS
   Where AMPN Like '_________' 
)

--Max SPN for obsoleted Hyster AMPN
,fsh As
(
Select Max(SPN) SPN
	  ,PN
   From h
   Group By PN
)

--Max SPN for obsoleted Yale AMPN
,fsy As
(
Select Max(SPN) As SPN
	  ,PN
   From y
   Group By PN
)

--Max SPN for obsoleted AMPN
,fsa As
(
Select *
From fsh
Union 
Select *
From fsy
)

,fs As
(
Select fsa.*
From fsa
Join eng_Part_Master epm
On fsa.SPN=epm.PN
Where epm.[Status] ='CAN'
)


----First Hyster AMPN for SPN
--,fah As
--(
--Select SPN
--	  ,Min(PN) As PN
--   From h
--   Group By SPN
--)

----First Yale AMPN for SPN
--,fay As
--(
--Select SPN
--	  ,Min(PN) As PN
--   From y
--   Group By SPN
--)
----First obsoleted AMPN for SPN
--,fa As
--(
--Select *
--From fah
--Union 
--Select *
--From fay
--)

,c6 As
(
Select spn.SPN
	  ,d.PN
	  ,'SPN=AMPN Master PN when PM PN = OBS AMPN' As Category
	  From d
	  Join dbo.ref_PN_Fmt f
	  On d.PN=f.PN
	  Join spn
	  On f.CORE=spn.PN
	  Join fs
	  On spn.SPN=fs.SPN And spn.PN=fs.PN
	  --Join fa
	  --On spn.PN=fa.PN
	  Left Join dbo.ref_PDC_SPN_X_Ref x
	  On d.PN=x.PN
	  Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
--Into dbo.ref_PDC_SPN_X_Ref
From c6
Where c6.SPN Is Not Null And c6.PN Is Not Null
;

----Set c7:  Gets 69 Series CORE SPNs which have active and obsoleted AM PNs equal to PDC PNs 
-------These were not picked up in Set 2 because the AM PNs are obsolete and the 69 series PN is not cancelled.

-------PDC Part with P&Q Crosses
--With d As
--(
--Select PN
--      ,X_PN
--  From dbo.ref_PDC_Part_Set_Detail
--)

-------Gets all (existing and obsolete) AM PNs for 69 Series CORE PNs.

--,spn As
--(
--Select PN As SPN
--	  ,AMPN_VPN As PN
--	  From eng_AM_VPN_Master av
--	  Join eng_AM_Abbr a
--	  On av.abbr=a.abbr
--)

--,c7 As
--(
--Select spn.SPN
--	  ,d.PN
--	  --,'Unknown' As X_PN 
--	  ,'SPN=AMVPN PN when PM PM = Active Or OBS AM PNs' As Category
--	  From d
--	  Join dbo.ref_PN_Fmt f
--	  On d.PN=f.PN
--	  Join spn
--	  On f.CORE=spn.PN
--	  Left Join dbo.ref_PDC_SPN_X_Ref x
--	  On d.PN=x.PN
--	  Where x.PN Is Null
--)

--Insert Into dbo.ref_PDC_SPN_X_Ref
--Select Distinct *
----Into dbo.ref_PDC_SPN_X_Ref
--From c7
--Where c7.SPN Is Not Null And c7.PN Is Not Null
--;


--Set e1a:  Gets AMDC Hyster PNs with Yale crosses where both HPN and YPN will use the HPN as the SPN

--Actual Merchandising PN records are stored in the Merchandising table of the database at \\apmfle01\ameng$\USERS\WORKDATA\PN_request\Merchandising.accdb
--If possible export the Merchandising table to AMData dbo.merch_Eng_Records and use code below to determine SPN details.

With e As
(
SELECT Case
		When LTrim(RTrim(Hyster)) Like '____'
		Then ' 000'+LTrim(RTrim(Hyster))
		When LTrim(RTrim(Hyster)) Like '_____'
		Then ' 00'+LTrim(RTrim(Hyster))
		When LTrim(RTrim(Hyster)) Like '______'
		Then ' 0'+LTrim(RTrim(Hyster))
		When LTrim(RTrim(Hyster)) Like '% [A-Z]'
		Then ' '+Left(LTrim(RTrim(Hyster)),9)+'  '
		When LTrim(RTrim(Hyster)) Like '% RX'
		Then ' '+Left(LTrim(RTrim(Hyster)),7)+Right(LTrim(RTrim(Hyster)),2)+'  '
		When LTrim(RTrim(Hyster)) Like '____________'
		Then LTrim(RTrim(Hyster))
		Else ' '+LTrim(RTrim(Hyster))
		End As HPN
	,Case
		When LTrim(RTrim(Yale)) Like '[0-9]________ [A-Z]'
		Then 'Y'+Left(LTrim(RTrim(Yale)), 9)+Right(LTrim(RTrim(Yale)),1)+' '
		When Yale Like 'Y_________ [A-Z]'
		Then Left(LTrim(RTrim(Yale)), 10)+Right(LTrim(RTrim(Yale)),1)+' '
		Else Left(LTrim(RTrim(Yale)+'  '),12)
		End As YPN
		,Ignore
  FROM [dbo].[ref_PDC_SPN_AMDC_PN_XPN]
  Where Ignore Is Null
)

,eh As
(
 Select LTrim(RTrim(HPN)) As SPN
	  ,HPN As PN
  From e
  Join ref_PDC_Part_Set_Detail d
  On ' '+HPN=d.PN
  Where HPN Like ' %'
)

,ey As
(
 Select LTrim(RTrim(HPN)) As SPN
	  ,YPN As PN
  From e
  Join ref_PDC_Part_Set_Detail d
  On ' '+HPN=d.PN
  Where HPN Like ' %'
)

,e1 As
(
Select *
From eh
Union
Select *
From ey
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct e1.SPN
	  ,e1.PN
	  ,'AMDC Cross PNs' As Category
From e1
Left Join dbo.ref_PDC_SPN_X_Ref x
On e1.PN=x.PN
Where x.PN Is Null And e1.SPN Is Not Null And e1.PN Is Not Null
;

--Set e1b:  Gets AMDC Yale PNs with Hyster SPED crosses where both HPN and YPN will use the YPN as the SPN

--Actual Merchandising PN records are stored in the Merchandising table of the database at \\apmfle01\ameng$\USERS\WORKDATA\PN_request\Merchandising.accdb
--If possible export the Merchandising table to AMData dbo.merch_Eng_Records and use code below to determine SPN details.

With e As
(
SELECT Case
		When LTrim(RTrim(Hyster)) Like '____'
		Then ' 000'+LTrim(RTrim(Hyster))
		When LTrim(RTrim(Hyster)) Like '_____'
		Then ' 00'+LTrim(RTrim(Hyster))
		When LTrim(RTrim(Hyster)) Like '______'
		Then ' 0'+LTrim(RTrim(Hyster))
		When LTrim(RTrim(Hyster)) Like '% [A-Z]'
		Then ' '+Left(LTrim(RTrim(Hyster)),9)+'  '
		When LTrim(RTrim(Hyster)) Like '% RX'
		Then ' '+Left(LTrim(RTrim(Hyster)),7)+Right(LTrim(RTrim(Hyster)),2)+'  '
		When LTrim(RTrim(Hyster)) Like '____________'
		Then LTrim(RTrim(Hyster))
		Else ' '+LTrim(RTrim(Hyster))
		End As HPN
	,Case
		When LTrim(RTrim(Yale)) Like '[0-9]________ [A-Z]'
		Then 'Y'+Left(LTrim(RTrim(Yale)), 9)+Right(LTrim(RTrim(Yale)),1)+' '
		When Yale Like 'Y_________ [A-Z]'
		Then Left(LTrim(RTrim(Yale)), 10)+Right(LTrim(RTrim(Yale)),1)+' '
		Else Left(LTrim(RTrim(Yale)+'  '),12)
		End As YPN
		,Ignore
  FROM [dbo].[ref_PDC_SPN_AMDC_PN_XPN]
  Where Ignore Is Null
)

,eh As
(
 Select Right(YPN,9) As SPN
	  ,HPN As PN
  From e
  Join ref_PDC_Part_Set_Detail d
  On ' '+HPN=d.PN
  Where HPN Like 'S%' or HPN Like 'U%'
)

,ey As
(
 Select Right(YPN,9) As SPN
	  ,YPN As PN
  From e
  Join ref_PDC_Part_Set_Detail d
  On ' '+HPN=d.PN
  Where HPN Like 'S%' or HPN Like 'U%'
)

,e1 As
(
Select *
From eh
Union
Select *
From ey
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct e1.SPN
	  ,e1.PN
	  ,'AMDC Yale SPN for SPED Cross' As Category
From e1
Left Join dbo.ref_PDC_SPN_X_Ref x
On e1.PN=x.PN
Where x.PN Is Null And e1.SPN Is Not Null And e1.PN Is Not Null
;

--Set d0:  Gets YPN for SPN for YPN and S SPED PN when P&Q links YPN and S SPED PNs when only one cross set exists

-----PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

,c As
(
Select PN
	  ,Count(PN) As CrossCount
  From d
  Group By PN
  Having Count(PN)=1
)
,d0 As
(
Select
	Case
	When d.PN Like 'Y_________  ' And d.X_PN Like 'S%'
	Then Right(RTrim(d.PN),9)
	When d.PN Like 'S%' And (d.X_PN Like 'Y_________  ' Or d.X_PN Like 'Y_________')
	Then Right(RTrim(d.X_PN),9)
	End As SPN
	,d.PN
	,'SPN=YPN for traditional YPN and S SPED PN when YPN linked to S SPED PN' As Category
From d
Left Join dbo.ref_PDC_SPN_X_Ref x
On d.PN=x.PN
Join c
On d.PN=c.PN
Where x.PN Is Null 
And 
((d.PN Like 'Y_________  ' And d.X_PN Like 'S%') 
Or (d.PN Like 'S%' And d.X_PN Like 'Y_________  ')
Or (d.PN Like 'Y_________  ' And d.X_PN Like 'U%') 
Or (d.PN Like 'U%' And d.X_PN Like 'Y_________  '))
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From d0
Where d0.SPN Is Not Null And d0.PN Is Not Null
Order by SPN
;

--Set d1:  Gets SPNs for Hyster SPED PNs

-----PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

,d1 As
(
Select d.PN As SPN
	  ,d.PN
	  ,'Hyster SPED' As Category
From d
Left Join dbo.ref_PDC_SPN_X_Ref x
On d.PN=x.PN
Where x.PN Is Null And (d.PN Like 'S__________[0-9]' or d.PN Like 'U__________[0-9]')
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From d1
Where d1.SPN Is Not Null And d1.PN Is Not Null
;

--Set d2:  Gets CORE SPN for Yale SPED PNs if S SPED PN is not the CORE SPN
-----PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

,d2 As
(
Select x1.SPN
	  ,d.PN AS PN
	  ,'Yale PN SPN=CORE SPN for S SPED PN when S SPED PN <> CORE SPN' As Category
From d
Left Join dbo.ref_PDC_SPN_X_Ref x1
On 'S'+Right(d.PN,11)=x1.PN
Left Join dbo.ref_PDC_SPN_X_Ref x2
On d.PN=x2.PN
Where x1.PN Is Not Null And x2.PN Is Null And d.PN Like 'Y__________[0-9]'
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From d2
Where d2.SPN Is Not Null And d2.PN Is Not Null
;

--Set d3:  Gets CORE SPN for Yale SPED PNs if S SPED PN is the CORE SPN
-----PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

,d3 As
(
Select 'S'+Right(d.PN,11) As SPN
	  ,d.PN AS PN
	  ,'Yale PN SPN=S SPED PN when CORE SPN=S SPED PN' Category
From d
Left Join dbo.ref_PDC_SPN_X_Ref x
On d.PN=x.PN
Where x.PN Is Null And d.PN Like 'Y__________[0-9]' And d.X_PN Like 'S%'
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From d3
Where d3.SPN Is Not Null And d3.PN Is Not Null
;


--Set d4a:  Gets SPNs for Trailer and Compactor PNs (product class TA and CE) and for PNs with Package Quantity suffixes.

-----PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
  Where (PrdCls='CE' Or PrdCls='TA') And X_PN Is Null
)

,d4 As
(
Select LTrim(RTrim(d.PN)) As SPN
	  ,d.PN
	  ,'PrdTyp CE or PrdTyp TA' As Category
From d
Left Join dbo.ref_PDC_SPN_X_Ref x
On d.PN=x.PN
Where x.PN Is Null And d.PN Not Like ' % [0-9]%'
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From d4
Where d4.SPN Is Not Null And d4.PN Is Not Null
;

--Set d4b:  Gets SPNs for Trailer and Compactor PNs (product class TA and CE) and for PNs with Package Quantity suffixes.

-----PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail d
  Where (d.PN Like' _______  [0-9]%' Or d.PN Like' _______ [0-9][0-9]%') And X_PN Is Null
)

,d4 As
(
Select Left(LTrim(RTrim(d.PN)),7) As SPN
	  ,d.PN
	  ,'Numeric PkgQty' As Category
From d
Left Join dbo.ref_PDC_SPN_X_Ref x
On d.PN=x.PN
Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From d4
Where d4.SPN Is Not Null And d4.PN Is Not Null
;


--Set d5:  Gets SPNs for incorrectly formatted SPED PNs.  SPN will be the 12 digit version of PN.

--PDC Part with P&Q Crosses for incorrectly formatted SPED PNs
With d As
(
Select PN
      --,X_PN
	  ,Case
		When Len(RTrim(LTrim(PN)))=5
		Then 'S000'+Right(RTrim(LTrim(PN)),4)+'0000'
		When Len(RTrim(LTrim(PN)))=6
		Then 'S00'+Right(RTrim(LTrim(PN)),5)+'0000'
		When Len(RTrim(LTrim(PN)))=7
		Then 'S0'+Right(RTrim(LTrim(PN)),6)+'0000'
		When Len(RTrim(LTrim(PN)))=8
		Then Left(PN,8)+'0000'
		When Len(RTrim(LTrim(PN)))=9
		Then Left(PN,8)+'000'+Right(RTrim(LTrim(PN)),1)
		When Len(RTrim(LTrim(PN)))=10
		Then Left(PN,8)+'00'+Right(RTrim(LTrim(PN)),2)
		When Len(RTrim(LTrim(PN)))=11
		Then Left(PN,8)+'0'+Right(RTrim(LTrim(PN)),3)
		Else PN
		End As SPN
  From dbo.ref_PDC_Part_Set_Detail d
  Where PN Like 'S% ' And PN<>'S00010833-1 ' And PN<>'S00079941-W ' And PN<>'S0111453-2 '
)

,d5 As
(
Select d.SPN
	  ,d.PN
	  ,'SPN for Incorrect SPED PNs' As Category
From d
Left Join dbo.ref_PDC_SPN_X_Ref x
On d.PN=x.PN
Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From d5
Where d5.SPN Is Not Null And d5.PN Is Not Null
;


--Set d6  Gets SPNs for Terminal Tractor PNs (space followed by 7 digit PNs then followed by TT) and for PNs with Package Quantity suffixes.

-----PDC Part with P&Q Crosses
With d1 As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
 )

,d As
(
 Select *
 From d1
 Where (PN Like ' _______TT%' Or PN Like ' ________TT%' Or PN Like ' _______MX%' Or PN Like ' _______MX%' Or PN Like 'Y_________MX%') And X_PN Is Null
)

,d6 As
(
Select Case 
		When d.PN Like ' _______TT%' Or d.PN Like ' ________TT%' Or d.PN Like ' _______MX%' Or d.PN Like ' _______MX%'
		Then Ltrim(RTrim(d.PN)) 
		When d.PN Like 'Y_________MX%' 
		Then Right(RTrim(d.PN),11)
		End As SPN
	  ,d.PN
	  ,'Terminal Tractor PNs' As Category
From d
Left Join dbo.ref_PDC_SPN_X_Ref x
On d.PN=x.PN
Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From d6
Where d6.SPN Is Not Null And d6.PN Is Not Null
;

--Set a1a: Gets SPNs for HPN crosses to PRE PNs in the Allmakes system.  
-----Premier PNs will be added to the master for the SPN project...therefore capturing SPN now for all PRE PNs

With a1 As
(
SELECT LTRIM(RTrim(Hys_Part_No)) As SPN
      ,Case
		When Hys_Part_No Like ' _______ R'
		Then Hys_Part_No+'  '
		When Hys_Part_No Like ' _______RX'
		Then Hys_Part_No+'  '
		Else Hys_Part_No
	    End As PN
	  ,'Allmakes System - Uses PDC HPN as SPN if crossed to PRE PN' As Category
  FROM dbo.ref_PDC_SPN_PRE_YAL_to_HYS_X_Ref am
  Where OEM_Code='PRE' And Hys_Part_No<>' $'  And Hys_Part_No>' ' 
)

,a As
(
Select a1.*
From a1
Left Join dbo.ref_PDC_SPN_X_Ref x
On a1.PN=x.PN
Where x.PN Is Null
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From a
Where a.SPN Is Not Null And a.PN Is Not Null
;


--Set a1b: Gets SPNs for PRE PNs in the Allmakes system.  
-----Premier PNs will be added to the master for the SPN project...therefore capturing SPN now for all PRE PNs

With a1 As
(  
SELECT LTRIM(RTrim(Hys_Part_No)) As SPN
      ,Left('Y'+RTrim(LTrim(Oem_Part_No))+'  ',12) As PN
	  ,'Allmakes System - Uses PDC HPN as SPN for PRE PN' As Category
  FROM dbo.ref_PDC_SPN_PRE_YAL_to_HYS_X_Ref am
  Left Join dbo.ref_PDC_SPN_X_Ref x
  On Left('Y'+RTrim(LTrim(Oem_Part_No))+'  ',12)=x.PN
  Where OEM_Code='PRE' And Hys_Part_No<>' $'  And Hys_Part_No>' '  And OEM_Part_No Like '_________'
  And x.PN Is Null  
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From a1
Where a1.SPN Is Not Null And a1.PN Is Not Null
;


--Set a2: Gets SPNs for Hys PNs in the Allmakes system that are on the Part Master.  

-----PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

,a2 As
(
SELECT LTRIM(RTrim(Hys_Part_No)) As SPN
      ,Case
		When Hys_Part_No Like ' _______ R'
		Then Hys_Part_No+'  '
		When Hys_Part_No Like ' _______RX'
		Then Hys_Part_No+'  '
		Else Hys_Part_No
	    End As PN,'Allmakes System - Uses PDC HPN as SPN if in AllMakes as HPN not as OEM PN' As Category
  FROM dbo.ref_PDC_SPN_PRE_YAL_to_HYS_X_Ref am
  Join d
  On Hys_Part_No=d.PN
  Where Hys_Part_No<>' $' And Hys_Part_No>' '
) 

,a As
(
Select a2.*
From a2
Left Join dbo.ref_PDC_SPN_X_Ref x
On a2.PN=x.PN
Where x.PN Is NUll
)


Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From a
Where a.SPN Is Not Null And a.PN Is Not Null
;

--Removed 2023-03-02 as this was causing unwanted YAL OEM parts to get same SPN as Unisource PN
--Production and Unisource/Premeir should not have the same SPN.
----Set a3: Gets SPNs for YAL PNs in the Allmakes system and on the Part Master.  

-------PDC Part with P&Q Crosses
--With d As
--(
--Select PN
--      ,X_PN
--  From dbo.ref_PDC_Part_Set_Detail
--)  

--,a3 As
--(
--SELECT LTRIM(RTrim(Hys_Part_No)) As SPN
--      ,'Y'+Oem_Part_No As PN
--	  ,'Allmakes System - uses HPN for all YAL OEM PNs in same set' As Category
--  FROM dbo.ref_PDC_SPN_PRE_YAL_to_HYS_X_Ref am
--  Join d
--  On 'Y'+Oem_Part_No=d.PN
--  Left Join dbo.ref_PDC_SPN_X_Ref x
--  On 'Y'+Oem_Part_No=x.PN
--  Where x.PN Is Null And [OEM_Code]='YAL' And Hys_Part_No<>' $'
--)

--Insert Into dbo.ref_PDC_SPN_X_Ref
--Select Distinct *
--From a3
--Where a3.SPN Is Not Null And a3.PN Is Not Null
--;


--Set pm1:  Gets Hyster SPN for Hyster PM PNs without SPN and with a single Yale X_PN

-----PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)


,spn As
(
SELECT SPN
      ,PN
      ,[Category]
  FROM dbo.ref_PDC_SPN_X_Ref
)

,c As
(
Select PN
	  ,Count(PN) As [Count]
	  From dbo.ref_PDC_Part_Set_Detail
	  Group By PN
)

,pm1 As
(
Select Distinct RTrim(LTrim(d.PN)) As SPN
	  ,d.PN
	  ,'Hyster SPN for Hyster PDC PN with Single Yale X_PN' As Category
From d
Left Join spn
On d.PN=spn.PN
Left Join c
On d.PN=c.PN
Where spn.PN Is Null And c.[Count]='1' And d.X_PN Like 'Y%' 
  And (d.PN Like ' %' Or d.PN Like 'S%' Or d.PN Like 'U%')
  And d.PN Not Like ' 66______   '
  And d.PN Not Like ' 76______   '
  And d.PN Not Like ' 371_____   '
  And d.PN Not Like ' 771_____   '
  And d.PN Not Like ' 66______'
  And d.PN Not Like ' 76______'
  And d.PN Not Like ' 371_____'
  And d.PN Not Like ' 771_____'
  --And d.PN Not Like ' 31_____    ' Will consider 3 million PNs Hyster if no other HPN exists
  --And d.PN Not Like ' 31_____'
)
Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From pm1
Where pm1.SPN Is Not Null And pm1.PN Is Not Null
;


--Set pm2:  Gets Hyster SPN for Yale PM PNs without SPN and with a single Hyster X_PN

-----PDC Part with P&Q Crosses
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

,spn As
(
SELECT SPN
      ,PN
      ,[Category]
  FROM dbo.ref_PDC_SPN_X_Ref
)

,c As
(
Select PN
	  ,Count(PN) As [Count]
	  From dbo.ref_PDC_Part_Set_Detail
	  Group By PN
)

,pm2 As
(
Select Distinct LTrim(RTrim(d.X_PN)) As SPN
	  ,d.PN
	  ,'Hyster SPN for Yale PDC PN with Single Hyster X_PN' As Category
From d
Left Join spn
On d.PN=spn.PN
Left Join c
On d.PN=c.PN
Where spn.PN Is Null And c.[Count]='1' And d.PN Like 'Y%' 
  And (d.X_PN Like ' %' Or d.X_PN Like 'S%' Or d.X_PN Like 'U%')
  And d.X_PN Not Like ' 66______   '
  And d.X_PN Not Like ' 76______   '
  And d.X_PN Not Like ' 371_____   '
  And d.X_PN Not Like ' 771_____   '
  And d.X_PN Not Like ' 66______'
  And d.X_PN Not Like ' 76______'
  And d.X_PN Not Like ' 371_____'
  And d.X_PN Not Like ' 771_____'
  --And d.X_PN Not Like ' 31_____    ' Will consider 3 million PNs Hyster if no other HPN exists
  --And d.X_PN Not Like ' 31_____'
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From pm2
Where pm2.SPN Is Not Null And pm2.PN Is Not Null
;


--Set pm3:  Gets Hyster SPN for Hyster and Yale PM PNs without SPN and with multiple X_PNs where Origin Dates of PN and X_PN match
--PN and X_PNs with matching origin dates can identify which part sets within a part group go together.

-----PDC Part with P&Q Crosses where Origin_Dt=X_Origin_Dt
With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
  Where Origin_Dt=X_Origin_Dt
)

,spn As
(
SELECT SPN
      ,PN
      ,[Category]
  FROM dbo.ref_PDC_SPN_X_Ref
)

,c As
(
Select PN
	  ,Count(PN) As [Count]
	  From d
	  Group By PN
)

,h As
(
Select Distinct LTrim(RTrim(d.PN)) As SPN
	  ,d.PN As PN
	  ,'Hyster SPN for PDC HPN with Single Yale Cross' As Category
From d
Left Join spn
On d.PN=spn.PN
Left Join c
On d.PN=c.PN
Where spn.PN Is Null  And c.[Count]='1' And d.X_PN Like 'Y%'
  And (d.PN Like ' %' Or d.PN Like 'S%' Or d.PN Like 'U%')
  And d.PN Not Like ' 66______   '
  And d.PN Not Like ' 76______   '
  And d.PN Not Like ' 371_____   '
  And d.PN Not Like ' 771_____   '
  And d.PN Not Like ' 66______'
  And d.PN Not Like ' 76______'
  And d.PN Not Like ' 371_____'
  And d.PN Not Like ' 771_____'
  --And d.PN Not Like ' 31_____    ' Will consider 3 million PNs Hyster if no other HPN exists
  --And d.PN Not Like ' 31_____'
)

,y As
(
Select Distinct LTrim(RTrim(d.X_PN)) As SPN
	  ,d.PN As PN
	  ,'Hyster SPN for PDC YPN with Single Hyster Cross' As Category
From d
Left Join spn
On d.PN=spn.PN
Left Join c
On d.PN=c.PN
Where spn.PN Is Null  And c.[Count]='1' And d.PN Like 'Y%'
  And (d.X_PN Like ' %' Or d.X_PN Like 'S%' Or d.X_PN Like 'U%')
  And (d.X_PN Like ' %' Or d.X_PN Like 'S%' Or d.X_PN Like 'U%')
  And d.X_PN Not Like ' 66______   '
  And d.X_PN Not Like ' 76______   '
  And d.X_PN Not Like ' 371_____   '
  And d.X_PN Not Like ' 771_____   '
  And d.X_PN Not Like ' 66______'
  And d.X_PN Not Like ' 76______'
  And d.X_PN Not Like ' 371_____'
  And d.X_PN Not Like ' 771_____'
  --And d.X_PN Not Like ' 31_____    ' Will consider 3 million PNs Hyster if no other HPN exists
  --And d.X_PN Not Like ' 31_____'
)

,pm3 As
(
Select SPN
	  ,PN
	  ,Category
From h
Union
Select SPN
	  ,PN
	  ,Category
From y
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select * 
From pm3
Where pm3.SPN Is Not Null And pm3.PN Is Not Null
;


--Set pm4:  Gets Hyster SPN for Hyster and Yale PM PNs without SPN and with multiple X_PNs where Origin Dates of PN and X_PN do not match
--Where only one PNs set is left that is missing the SPNs in the set

With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
  --Where PN=' 3027597' Or PN='3023082' Or PN='Y150012829  '
)

,spn As
(
SELECT SPN
      ,PN
      ,[Category]
  FROM dbo.ref_PDC_SPN_X_Ref
)

,b As
(
Select d.PN
	  ,d.X_PN
From d
Left Join spn spn1
On d.PN=spn1.PN
Left Join spn spn2
On d.x_PN=spn2.PN
Left Join dbo.ref_PDC_SPN_Ignore i1
On d.PN=i1.PN
Left Join dbo.ref_PDC_SPN_Ignore i2
On d.X_PN=i2.PN
Where spn1.PN Is Null And spn2.PN is Null And i1.PN Is Null And i2.PN Is Null
And d.PN Like '[^Y]%' And Len(LTrim(RTrim(d.PN)))<>8 And d.X_PN Like 'Y%' 
And RTrim(d.PN) Like '%[0-9]' And RTrim(d.X_PN) Like '%[0-9]'
)

,c As
(
Select PN
	  ,Count(X_PN) As PNCount
From b
Group By PN
Having Count(PN)=1
)

,h As
(
Select LTrim(RTrim(d.PN)) As SPN
	  ,d.PN
	  ,'Uses HPN as SPN for Hyster PN in remaining single HPN-YPN set' As Category
From d
Join c
On d.PN=c.PN
)

,y As
(
Select LTrim(RTrim(d.PN)) As SPN
	  ,d.X_PN As PN
	  ,'Uses HPN as SPN for Yale PN in remaining single HPN_YPN set' As Category
From d
Join c
On d.PN=c.PN
Where d.X_PN Like 'Y%'
)

,pm4 As
(
Select SPN
	  ,PN
	  ,Category
From h
Union
Select SPN
	  ,PN
	  ,Category
From y
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select pm4.* 
From pm4
Left Join dbo.ref_PDC_SPN_X_Ref x
On pm4.PN=x.PN
Where x.PN Is Null And pm4.SPN Is Not Null And pm4.PN Is Not Null
;


--Set pm5:  Gets SPN using modified Hyster PN for both Hyster and Yale FPI PNs in P&Q part sets.

With h As
(
Select RTrim(LTrim(d.PN)) As SPN
	  ,d.PN
      ,'SPN = Trimmed HPN for Hyster FPI PNs' As Category
  From [dbo].[ref_PDC_Part_Set_Detail] d
  Left Join [dbo].[ref_PDC_SPN_X_Ref] x
  On d.PN=x.PN
  Where x.PN Is Null And d.X_PN Is Not Null And d.PN Like '%F%' And d.PN Like '[^Y]%' And d.X_PN Like 'Y%FP%' 
)

,y As
(
Select RTrim(LTrim(d.PN)) As SPN
	  ,d.X_PN As PN
      ,'SPN = Trimmed HPN for Yale FPI PNs' As Category
  From [dbo].[ref_PDC_Part_Set_Detail] d
  Left Join [dbo].[ref_PDC_SPN_X_Ref] x
  On d.PN=x.PN
  Where x.PN Is Null And d.X_PN Is Not Null And d.PN Like '%F%' And d.PN Like '[^Y]%' And d.X_PN Like 'Y%FP%'
)

, pm5 As
(
Select * 
From h
Union
Select *
From y
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From pm5
Where pm5.SPN Is Not Null And pm5.PN Is Not Null
;


--Set pm6:  The SFP888 PNs are already being picked up in one of the CORE groups, but that process
--doesn't pick up the YFP88 PNs as they are not in CORE...need to use other logic...see below.
--Set pm6:  Use SFP888 as SPN for all YFP888 PM PNs

--This Hyster section may not be needed.
With h As
(
Select d.PN As SPN
	  ,d.PN
      ,'SPN = SFP888 PN for Hyster SFP888 PN' As Category
  From [dbo].[ref_PDC_Part_Set_Detail] d
  Left Join [dbo].[ref_PDC_SPN_X_Ref] x
  On d.PN=x.PN
  Where x.PN Is Null And d.PN Like 'SFP888%' 
)

--This section is needed to pick up SPN for YFP8888 PNs
,y As
(
Select 'S'+Right(d.PN,11) As SPN
	  ,d.PN
      ,'SPN = SFP888 PN for Yale YFP888 PN' As Category
  From [dbo].[ref_PDC_Part_Set_Detail] d
  Left Join [dbo].[ref_PDC_SPN_X_Ref] x
  On d.PN=x.PN
  Where x.PN Is Null And d.PN Like 'YFP888%' 
)

, pm6 As
(
Select * 
From h
Union
Select *
From y
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From pm6
Where pm6.SPN Is Not Null And pm6.PN Is Not Null
;

--Set pm7: SPN set to Hyster FPI PN for corresponding Yale FPI

With d As
(
Select d.PN
      ,X_PN
  From dbo.ref_PDC_Part_Set_Detail d
  Left Join dbo.ref_PDC_SPN_X_Ref x
  On d.PN=x.PN
Where x.PN Is Null
)

,pm7 As
(
Select Case 
When d.PN='F0051081 '
Then d.PN
When d.PN='F0511537'
Then d.PN
When d.PN='F0410001'
Then d.PN
When d.PN='FP091011'
Then d.PN
When d.PN='FP091012'
Then d.PN
When d.PN='FP091013'
Then d.PN
When d.PN='FP091014'
Then d.PN
When d.PN='FP121017'
Then d.PN
When d.PN='YFP0550091  '
Then 'F0051081'
When d.PN='YFP0551637  '
Then 'F0511537'
When d.PN='YFP0450011  '
Then 'F0410001'
When d.PN='YFP0950021  '
Then 'FP091011'
When d.PN='YFP0950022  '
Then 'FP091012'
When d.PN='YFP0950023  '
Then 'FP091013'
When d.PN='YFP0950024  '
Then 'FP091014' 
When d.PN='YFP1250181  '
Then 'FP121017'
Else Null
End As SPN
,PN
,'SPN-Hyster FPI for Yale FPI with same OriginDt' As Catefory
From d
Where d.PN IN ('FP121017'
, 'YFP0550091  '
, 'F0051081'
, 'YFP0551637  '
, 'F0511537'
, 'YFP0450011  '
, 'F0410001'
, 'YFP0950021  '
, 'FP091011'
, 'YFP0950022  '
, 'FP091012'
, 'YFP0950023  '
, 'FP091013'
, 'YFP0950024  '
, 'FP091014'
, 'YFP1250181  '
, 'FP121017')
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From pm7
Where pm7.SPN Is Not Null And pm7.PN Is Not Null
;

--Set pm8:  Sets SPN of Convenience PNs to equal PN

With d0 As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

, d As
(
SELECT --[SPN]
      d.[PN]
     ,d.[Desc]
     ,d.Origin_Dt
      --,d.X_PN
      --,[Category]
  FROM [dbo].[ref_PDC_Part_Set_Detail] d
  Left Join [dbo].[ref_PDC_SPN_X_Ref] x
  On d.PN=x.PN
  Where x.PN Is Null And (d.PN Like '[A-Z][A-Z]%999%' or d.[Desc] Like '%SMH%')
)
,pm8 As
(
Select d.PN As SPN
	  ,d.PN
	  ,'SPN=Convenience PN' As Category
From d
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct *
From pm8
Where pm8.SPN Is Not Null And pm8.PN Is Not Null
;

--Set pm9:  Sets SPN using Undocumented Cross Table

With d As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
  From dbo.ref_PDC_Part_Set_Detail
)

,nd As
(
Select SPN
	  ,Case
		  When LTrim(RTrim(PN)) Like'_______'
		  Then ' '+LTrim(RTrim(PN))
		  When LTrim(RTrim(PN)) Like'_______ [A-Z]%'
		  Then ' '+LTrim(RTrim(PN))+'  '
		  ELSE Left(PN+'  ',12)
		  End As PN
From dbo.ref_PDC_SPN_Non_Documented_Crosses
)

,s1 As
(
Select nd.SPN
	  ,nd.PN
From nd
)

,pm9 As
(
Select SPN
	  ,PN
	  ,'SPN=PN per Undocumented Cross Table' As Category
From s1
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct pm9.SPN
	,pm9.PN
	,pm9.Category
From pm9
Left Join dbo.ref_PDC_SPN_X_Ref x
On pm9.PN=x.PN
Where x.PN Is Null And pm9.SPN Is Not Null And pm9.PN Is Not Null
;

----Set pmf1a:  Sets SPN for remaining part set (if set count is 1) PNs where multiple sets in part group which still have no SPN
----In cases like HPN1, HPN2, YPN1, YPN2, UPN1 and UPN2...
----It is not possible to determine which HPN, YPN and UPNs go together if multiple Hyster and Yale PNs remaining.

--With d As
--(
--Select Case
--		  When PN Like' _______    '
--		  Then Left(PN,8)
--		  When PN Like'Y%'
--		  Then Left(PN+'  ',12)
--		  Else PN 
--		  End As PN
--       ,Case
--		  When X_PN Like' _______    '
--		  Then Left(X_PN,8)
--		  When X_PN Like'Y%'
--		  Then Left(X_PN+'  ',12)
--		  Else X_PN 
--		  End As X_PN
--  From dbo.ref_PDC_Part_Set_Detail
--)

--,d1 As
--(
--Select d.PN
--      ,d.X_PN
--  From dbo.ref_PDC_Part_Set_Detail d
--  Left Join dbo.ref_PDC_SPN_X_Ref x1
--  On d.PN=x1.PN
--  Left Join dbo.ref_PDC_SPN_X_Ref x2
--  On d.X_PN=x2.PN
--  Where x1.PN Is Null And x2.PN Is Null And d.PN Like ' %[0-9]' and X_PN Like 'Y%[0-9]'
--)

--,c As
--(
--Select PN
--	  ,Count(X_PN) as cnt
--From d1
--Group By PN
--Having Count(X_PN)=1
--)


--,pmf1 As
--(
--Select LTrim(RTrim(d1.PN)) As SPN
--	  ,d1.PN
--	  ,'Final Category 1 - SPN=PN for Remaining Crosses PNs w/o SPNs' As Category
--From d1
--Join c
--On d1.PN=c.PN
--)

--,pmf2 As
--(
--Select LTrim(RTrim(d1.PN)) As SPN
--	  ,d1.X_PN As PN
--	  ,'Final Category 1 - SPN=PN for Remaining Crosses PNs w/o SPNs' As Category
--From d1
--Join c
--On d1.PN=c.PN
--)

--,pmf As
--(
--Select *
--From pmf1 
--Union 
--Select *  
--From pmf2
--)

--Insert Into dbo.ref_PDC_SPN_X_Ref
--Select Distinct pmf.SPN
--	  ,pmf.PN
--	  ,pmf.Category
--From pmf
--Left Join dbo.ref_PDC_SPN_X_Ref x
--On pmf.PN=x.PN
--Where x.PN Is Null And pmf.SPN Is Not Null And pmf.PN Is Not Null
--;

--Set pmf:  Sets SPN of remaining PNs to trimmed PN (no Cross PN and no SPN)

With d1 As
(
Select Case
		  When PN Like' _______    '
		  Then Left(PN,8)
		  When PN Like'Y%'
		  Then Left(PN+'  ',12)
		  Else PN 
		  End As PN
       ,Case
		  When X_PN Like' _______    '
		  Then Left(X_PN,8)
		  When X_PN Like'Y%'
		  Then Left(X_PN+'  ',12)
		  Else X_PN 
		  End As X_PN
	 ,[Desc]
     ,Origin_Dt
  From dbo.ref_PDC_Part_Set_Detail
)

,d As
(
SELECT d1.[PN]
	  ,d1.[Desc]
      ,d1.Origin_Dt
      ,d1.X_PN
      ,[Category]
  FROM d1
  Left Join [dbo].[ref_PDC_SPN_X_Ref] x
  On d1.PN=x.PN
  Where x.PN Is Null
)
,pmf2 As
(
Select Case
		When d.PN Like ' %'
		Then RTrim(LTrim(d.PN))
		When d.PN Like 'Y___________[0-9]'
		Then d.PN
		When d.PN Like 'Y_________  ' 
		Then Right(Left(d.PN,10),9)
		Else 'Undetermined'
		End As SPN
	  ,d.PN
	  ,'Final Category 2 - SPN=PN for No Cross PN' As Category
From d
)

Insert Into dbo.ref_PDC_SPN_X_Ref
Select Distinct pmf2.*
From pmf2
Left Join dbo.ref_PDC_SPN_X_Ref x
On pmf2.PN=x.PN
Where x.PN Is Null And pmf2.SPN Is Not Null And pmf2.PN Is Not Null

;

Truncate Table dbo.ref_PDC_SPN_X_Ref_Tmp;

Insert Into dbo.ref_PDC_SPN_X_Ref_Tmp
Select Distinct x.* 
--Into dbo.ref_PDC_SPN_X_Ref_Tmp
From dbo.ref_PDC_SPN_X_Ref x
Join ref_PDC_Part_Set_Detail d
On x.PN=d.PN And x.SPN Is Not Null And x.PN Is Not Null
;
Truncate Table dbo.ref_PDC_SPN_X_Ref;

Insert Into dbo.ref_PDC_SPN_X_Ref
Select *
From dbo.ref_PDC_SPN_X_Ref_Tmp
Where SPN Is Not Null And PN Is Not Null
;
--Update ref_PDC_Part_Set_Detail 
--Set ref_PDC_Part_Set_Detail.SPN=x.SPN
--From ref_PDC_Part_Set_Detail Left Join ref_PDC_SPN_X_Ref x On ref_PDC_Part_Set_Detail.PN=x.PN

GO
