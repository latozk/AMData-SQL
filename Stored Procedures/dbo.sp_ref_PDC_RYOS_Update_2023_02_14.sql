SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE Procedure [dbo].[sp_ref_PDC_RYOS_Update_2023_02_14] As

---- =============================================
----Author: Newell, R
----Date: 2020-05-05
----Purpose: Populate a table containing Remaining Years of Service values for PDC PNs.
----Last modified date:
----Modification notes: 
--------------------------------------------------------------
--------------------------------------------------------------
-- Part 1 Builds PN (PDCFmt)-Unit table for units requiring PDC support.
--------------------------------------------------------------
--------------------------------------------------------------

Truncate Table ref_PDC_Part_to_Unit;

With ptud As
(
-- This section gets PDC supported CORE AM PN (PDCFmt)-Unit relationships from eng_PDC_Part_Dist for P type parts
-- Note: eng_PDC_Part_Dist is created from the PDC CORE and Agile Distribution tables but instead
-- of having PN-Mast relationships, mast codes are rolled up to their respective unit codes in eng_PDC_Part_Dist
-- ptud (aka PartsToUnitDistribution where mast codes have been rolled into unit codes)

Select Distinct pdcd.PN As CORE_PN
	  ,x.PNAS400Fmt As PN
      ,pdcd.Unit
  From dbo.eng_PDC_Part_Dist pdcd
  Join dbo.eng_Part_Master epm
  On pdcd.PN=epm.PN
  Join dbo.ref_CORE_PN_XRef x
  On pdcd.PN=x.CORE_PN
  Where (PN_Brand<>'G' Or PN_Brand Is Null) And epm.Type='P'
)
, ptuf As
-- This section gets all PDC supported PartsToUnit_Formatted PN (PDCFmt)-Unit relationships from PartsToUnit_Formatted
-- ptuf (aka PartsToUnitFormatted)
(
Select Distinct x.CORE_PN
	  ,puf.PN
	  ,UnitCode As Unit
  From ref_PDC_PartsToUnit_Formatted puf
  Join dbo.ref_CORE_PN_XRef x
  On puf.PN=x.PNAS400Fmt
  Left Join ptud
  On puf.PN=ptud.PN And UnitCode=ptud.Unit
  Where ptud.PN Is Null
)
, ptu As
(
-- This section combines the PDC supported CORE/Agile PN (PDCFmt)-Unit relationships with those in the PartsToUnit_Formatted table:
------ PartsToUnitDistribution
------ PartsToUnitFormatted
Select CORE_PN
	  ,PN
	  ,Unit
  From ptud
Union
Select CORE_PN
	  ,PN
	  ,Unit
  From ptuf
)
-- This section creates temporary table called ref_PDC_Part_to_Unit and inserts all PNs (PDC format) to Unit relationships currently 
-- showing PDC distribution in either Agile, CORE or PartsToUnit_Formatted.
Insert Into ref_PDC_Part_to_Unit
Select Distinct CORE_PN
	  ,PN
	  ,Unit
--Into ref_PDC_Part_to_Unit_test
  From ptu
;

--------------------------------------------------------------
--------------------------------------------------------------
-- Part 2 Builds ryos_tmp table
-- Determines preliminary RYOS values using support through dates for PNs (PDC format) and cross PNs for respective supported unit codes
-- by getting PNs-Unit Support Through Dates and XPNs-Unit Support Through Dates and subtracting Today's date from the greates Support Through Date 
--------------------------------------------------------------
--------------------------------------------------------------

Truncate Table dbo.wrk_RYOS_PDC_RYOS;

--Drop Table dbo.wrk_RYOS_PDC_RYOS;
-- Gets PN (PDC format), unit and years of service needed for each unit
-- Uses best PN-Unit source table which comes from O'Neil files and PDC Distribution parts
With uyos As
(
Select PN
	  ,ref_PDC_Part_to_Unit.Unit
	  ,Class
	  ,Support
	  ,Status
	  ,Special_Support
	  ,Last_Build_Dt
	  ,Case 
			When Class=2 Or Class=3
			Then 7
			When [Group]='BT'
			Then 15
			Else 10
			End As YOS
	  ,Case
			When Last_Build_Dt IS NULL 
			Then Cast(GetDate() As Date)
			Else Last_Build_Dt
			End As LBDt
	  ,Capacity_US_Min As MinCap
From ref_PDC_Part_to_Unit
Join dbo.ref_unit u
On ref_PDC_Part_to_Unit.Unit=u.Unit
Where (Support <>'Not Supported' Or Special_Support='Y') 
--And PN='S00112300002'
--And (PN=' 0263844' Or PN='Y900005298' Or PN='66304567')
--And (u.unit='F006' or u.unit='G006' or u.unit='H177') And PN=' 0000159'
)
-- Gets PN (PDC format), unit and support through date for each unit
, pusupdt As
(
Select PN
	  ,Unit
	  ,Class
	  ,YOS
	  ,LBDt
	  ,MinCap
	  ,SupptThru=DateAdd("yyyy", YOS, LBDt)
From uyos
--Where 
--PN='S00112300002'
)

-- Gets PN (PDC format) and max support through date (max support through date for all units for PN)
,psd As
(
Select PN
	  ,Max(SupptThru) SupptThru
From pusupdt
Group by PN
-- Order by PN
)
-- Gets max support through date for each AM cross (PDC format) PN in CORE (max support through date for all XPN units)
-- Used ref_PDC_Part_Set_Details to get cross PNs so 'S' and 'I' parts would have the same RYOS values.
,xsd As
(
Select ref_PDC_Part_to_Unit.PN	
	  ,max(psd.SupptThru) As X_SupptThru
From ref_PDC_Part_to_Unit
Join ref_PDC_Part_Set_Detail d
On ref_PDC_Part_to_Unit.PN=d.PN
Join psd
On d.X_PN=psd.PN
--Where 
--d.PN=' 0000159' Or d.PN='Y449001014' Or d.PN='S00112300002'
Group by ref_PDC_Part_to_Unit.PN
)
,msd As
(
Select psd.PN
	  ,SupptThru
	  ,X_SupptThru
	  ,Case
			When SupptThru>=X_SupptThru
			Then SupptThru
			When SupptThru Is Not Null AND X_SupptThru Is Null
			Then SupptThru
			Else X_SupptThru
			End As SupptDt
From psd
Left Join xsd
On psd.PN=xsd.PN
--Where PN='S00112300002' or psd.PN=''
)
-- Gets RYOS for for PNs (PDC format) which can be tied to a supported unit using max support through dates and populates the 
Insert Into wrk_RYOS_PDC_RYOS
Select PN
	  ,Cast(DateDiff("MM", Cast(GetDate() As Date), SupptDt)/12 As Numeric (4,1)) As RYOS
      --,Cast(Cast((DateDiff("MM", Cast(GetDate() As Date), SupptDt)) As Numeric (4,1))/12 As Numeric (4,1)) AS RYOS
--Into wrk_RYOS_PDC_RYOS_test
From msd
;

--------------------------------------------------------------
--------------------------------------------------------------
-- Part 3 Builds PDCSuppReq Yes/No table
-- Gets PNs (PDC format) used (now or in the past) on supported units.
-- Gets XPNs (PDC format) used (now or in the past) on supported units.
-- Gets PDCSuppReq Yes/No for above PNs.
--------------------------------------------------------------
--------------------------------------------------------------

Truncate Table wrk_RYOS_PDC_PN_Suppt_Req;

-- Gets PNs (PDC format) used (now or in the past) on supported units.
With psr As
(
Select Distinct PN
From ref_PDC_Part_to_Unit pu
Join ref_Unit u
On pu.Unit=u.Unit
Where (u.Support <>'Not Supported' Or u.Special_Support='Y') 
--And PN=' 1360380'
)
-- Gets XPNs (PDC format) used (now or in the past) on supported units.
, xsr As
(
Select Distinct d.X_PN As PN
From psr
Join ref_PDC_Part_Set_Detail d
On psr.PN=d.PN
Where d.X_PN Is Not Null
)
, sr As
(
Select PN
From psr
Union
Select PN
From xsr
)
-- Combines all PNs with PDCSupptReq and builds table
Insert Into wrk_RYOS_PDC_PN_Suppt_Req
Select Distinct PN 
--Into wrk_RYOS_PDC_PN_Suppt_Req_test
From sr
;

--------------------------------------------------------------
--------------------------------------------------------------
-- Part 4 Makes PDC PN list with In CORE Yes/No
-- Use CORE Part Master and AMXRef since CORE Cross Reference file does not include cancelled PNs
--------------------------------------------------------------
--------------------------------------------------------------

Truncate Table wrk_RYOS_PDC_PN_in_CORE;

With c1 As
(
-- Gets Yes/No for in CORE and makes table wrk_RYOS_PDC_PN_in_CORE
Select d.PN
From ref_PDC_Part_Detail d
Join ref_PN_Fmt f
On d.PN=f.PN
Join eng_Part_Master pm
On f.CORE=pm.PN
)
, c2 As
(
Select d.PN
From ref_PDC_Part_Detail d
Join ref_PN_Fmt f
On d.PN=f.PN
Join eng_AMPN_Master a
On f.CORE=a.AMPN
)
, c As
(
Select PN
From c1
Union
Select PN
From c2
)
Insert Into wrk_RYOS_PDC_PN_in_CORE
Select Distinct PN
--Into wrk_RYOS_PDC_PN_in_CORE_test
From c
;

--------------------------------------------------------------
--------------------------------------------------------------
-- Part 5 Gets highest priority support level
--------------------------------------------------------------
--------------------------------------------------------------

Truncate Table wrk_RYOS_PDC_PN_Min_Suppt_Lvl;

With sl As
(
-- Gets support level for PNs (PDC format) from supported parent units
Select Distinct pu.PN
	  ,ID
From ref_PDC_Part_to_Unit pu
Join ref_Unit u
On pu.Unit=u.Unit
Left Join ref_PDC_Unit_Support_Level s
On u.Support=s.[Desc]
Where (u.Support <>'Not Supported' Or u.Special_Support='Y')
--And (ref_PDC_Part_to_Unit.PN=' 66306963' or ref_PDC_Part_to_Unit.PN=' 2083048' or ref_PDC_Part_to_Unit.PN=' 67100839')
)
, ms As
(
-- Gets highest priority support level for PN (PDC format) using unit support levels
Select PN
	  ,Min(ID) As Support_ID
From sl
Group By PN
)
-- Gets min support ID (highest support level) for each AM cross (PDC format) PN in CORE

,xms As
(
Select d.PN	
	  ,min(Support_ID) As X_Support_ID
From ref_PDC_Part_Set_Detail d
Join ms
On d.X_PN=ms.PN
Group by d.PN
)

-- Gets min support ID (highest support level) for PN (PDC format) by comparing PN support level and XPN support levels
Insert Into wrk_RYOS_PDC_PN_Min_Suppt_Lvl
Select ms.PN
	  ,Case
		 When Support_ID<=X_Support_ID
		 Then Support_ID
		 When Support_ID Is Not Null AND X_Support_ID Is Null
		 Then Support_ID
		 Else X_Support_ID
		 End As Support_ID
--Into wrk_RYOS_PDC_PN_Min_Suppt_Lvl_test
From ms
Join xms
On ms.PN=xms.PN
;

--------------------------------------------------------------
--------------------------------------------------------------
-- Part 6
-- Ex.  In-house hose crimp machine tooling parts (pushers, dies and rings) have no unit correlation therefore an RYOS cannot be 
-- determined for these PNs; however, the PDC considers these parts to always be supported, as a result, such parts are assigned an
-- RYOS of 200 years.
-------- Pushers, Dies and Rings are documented in the global Hose database (olso on the ACMSQLPRD2012 server) in the Shared FITTINGS and Shared BULK MATERIAL tables
-------- ince the PNs in these tables are vendor PNs, the pdc_PQ_Part_Vendor table is used to cross the VPNs to PDC PNs.
--------------------------------------------------------------
--------------------------------------------------------------

Truncate Table wrk_RYOS_PDC_Tooling_Pusher;
Truncate Table wrk_RYOS_PDC_Tooling_Die;
Truncate Table wrk_RYOS_PDC_Tooling_Ring;
Truncate Table wrk_RYOS_PDC_Tooling;

-- Makes temporary tables to hold vendor PNs for pushers, dies and rings
Insert Into wrk_RYOS_PDC_Tooling_Pusher
Select Distinct [VPN PUSHER] As VPN_Pusher
--Into wrk_RYOS_PDC_Tooling_Pusher_test
  From Hose_Global.dbo.[Shared FITTINGS]
  Where [VPN Pusher] Is Not Null
;
Insert Into wrk_RYOS_PDC_Tooling_Die
Select Distinct [VPN Die] As VPN_Die
--Into wrk_RYOS_PDC_Tooling_Die_test
  From Hose_Global.dbo.[Shared BULK MATERIAL]
  Where [VPN Die] Is Not Null
;
Insert Into wrk_RYOS_PDC_Tooling_Ring
Select Distinct [VPN Ring] As VPN_Ring
--Into wrk_RYOS_PDC_Tooling_Ring_test
  From Hose_Global.dbo.[Shared BULK MATERIAL]
  Where [VPN Ring] Is Not Null
;
With p As
(
-- Gets PDC PN for vendor crimping machine tool PNs and adds to wrk_RYOS_PDC_Tooling
Select Distinct Part_No As PN
	  --,VPN_Pusher
From dbo.wrk_RYOS_PDC_Tooling_Pusher p
Join dbo.pdc_PQ_Part_Vendor v
On p.VPN_pusher=v.Vend_Ref_No
Where Plt_Code='014'
)
, d As
(
Select Distinct Part_No As PN
	  --,VPN_Die
From dbo.wrk_RYOS_PDC_Tooling_Die d
Join dbo.pdc_PQ_Part_Vendor v
On d.VPN_Die=v.Vend_Ref_No
Where Plt_Code='014'
)
, r As
(
Select Distinct Part_No As PN
	  --,VPN_Ring
From dbo.wrk_RYOS_PDC_Tooling_Ring r
Join dbo.pdc_PQ_Part_Vendor v
On r.VPN_Ring=v.Vend_Ref_No
Where Plt_Code='014'
)
,t As
(
Select *
From p
Union
Select *
From d
Union
Select *
From r
)
Insert Into wrk_RYOS_PDC_Tooling
Select Distinct PN
--Into wrk_RYOS_PDC_Tooling_test
From t
;

--------------------------------------------------------------
--------------------------------------------------------------
-- Part 7 Gets parents and components of in-house and Progressive kits (used on supported and non-supported units) and adds PNs to wrk_RYOS_PDC_RPO_Progressive_Parent_Comp 
--------------------------------------------------------------
--------------------------------------------------------------

Truncate table wrk_RYOS_PDC_RPO_Progressive_Parent_Comp;

With c1 As
(
Select Distinct CP_Parent_Part_No As Parent
	  ,CP_Comp_Part_No AS Comp
From pdc_Parts_Master_Component_Parent p
Join ref_PDC_Part_Detail d1
On p.CP_Comp_Part_No=d1.PN
Join ref_PDC_Part_Detail d2
On p.CP_Parent_Part_No=d2.PN
--Join ref_PDC_Part_to_Unit pu On CP_Parent_Part_No=d2.PN --to limit to components of parents of supported units
Where (d2.status Is Null) And (d2.Vend='04159' Or d2.Vend='04160' Or d2.Vend='04162') 
--And (d.Alpha='1' Or d.Alpha='2' Or d.Alpha='7') --for components of supported kits only
--And CP_Comp_Part_No='  0079507' 
--And CP_Parent_Part_No=' 0106641' 
)
, c2 As
(
Select Distinct PG_Parent_Part_No As Parent
	  ,PG_Comp_Part_No As Comp
From pdc_Progressive_Component_Parent p
Join ref_PDC_Part_Detail d1
On p.PG_Comp_Part_No=d1.PN
Join ref_PDC_Part_Detail d2
On p.PG_Parent_Part_No=d2.PN
--Join ref_PDC_Part_to_Unit pu On CP_Parent_Part_No=d2.PN --to limit to components of parents of supported units
Where (d2.status Is Null) And (d2.Vend='73580')
--And (d.Alpha='1' Or d.Alpha='2' Or d.Alpha='7') --for components of supported kits only
)
, u As
(
Select Parent
	  ,Comp
From c1
Union 
Select Parent
	  ,Comp
From c2
)
Insert Into wrk_RYOS_PDC_RPO_Progressive_Parent_Comp
Select Distinct Parent
	  ,Comp
--Into wrk_RYOS_PDC_RPO_Progressive_Parent_Comp_test
From u
			--Select *
			--From wrk_RYOS_PDC_RPO_Progressive_Parent_Comp
			--Where Comp=' 0079507' or parent=' 0106641' 
;

--------------------------------------------------------------
-- Part 8 Replaces RYOS values of components and replacing parts with more appropriate values when 
-- component part RYOS values and replacing part RYOS values are less than their respectived parents and replaced parts RYOS values.
-- Examples:
-------- Replacing parts:
--------------- If replacing part RYOS is less than max RYOS of all replaced parts, its RYOS needs increased to match the max RYOS of all replaced parts,
--------------- else no change.
-------- Components of VC 04159, 04160 and 04162 parts:
--------------- If comp part RYOS less is than max RYOS of all its parents, its RYOS needs increased to match the max RYOS of all parents,
--------------- else no change.
--------------------------------------------------------------

-- Combines Replacing-Replaced and Component-Parent into a singel dataset
---- Replacing part and Replaced part -- replqacing part RYOS (P1) needs replaced by max replaced part RYOS (P2)
---- Unioned
---- Comp part and Parent part -- component part RYOS (P1) needs replaced by max parent part RYOS (Ps) 
-- Once combined all P1 RYOS values less than their corresponding P2 max RYOS values need replaced by their P2 max RYOS values.

With cp As
(
Select Distinct Comp As P1
	  ,Parent As P2
From wrk_RYOS_PDC_RPO_Progressive_Parent_Comp
--Where Comp=' 0106641' Or Parent=' 0106641'
)

,rr As
(
Select Distinct Final_Replacement_PN As P1
	  ,Cancelled_PN As P2
From ref_PDC_Part_Final_Replacement
--Where Final_Replacement_PN=' 141523' Or Cancelled_PN=' 0079512'
)

,u As
(
Select *
From cp
Union
Select *
From rr
)

,d As
(
Select Distinct P1
	  ,P2
From u
)

,mx As
(
--Gets max parent RYOS
Select P1 As PN
	  ,Max(RYOS) As MaxP2RYOS
From d
Join wrk_RYOS_PDC_RYOS r
On P2=r.PN
Group by P1
)

,newryos As
(
Select Distinct r.PN
	  ,RYOS
	  ,MaxP2RYOS
	  ,Case 
			When MaxP2RYOS Is Not Null And MaxP2RYOS>RYOS
			Then MaxP2RYOS
			Else RYOS
			End As RevisedRYOS
From wrk_RYOS_PDC_RYOS r
Left Join mx
On r.PN=mx.PN
)

--Updates revised RYOS values
Update r
Set r.RYOS=RevisedRYOS
From wrk_RYOS_PDC_RYOS r
Join newryos n
On r.PN=n.PN
;

--------------------------------------------------------------
--------------------------------------------------------------
-- This section is very similar to the previous section, but deals with Minimum Support IDs.  The Lower the unit Support ID number, the higher the Part support priority.
-- Part 9 Replaces Min Support IDs of components and replacing parts with more appropriate values when 
-- component part Support IDs and replacing part Support IDs are greater than their respectived parents and replaced parts Support IDs.

-- Examples:
-------- Replacing parts:
--------------- If replacing part Support ID is greater than min Support ID of all its replaced parts, its Support ID needs decreased to match the min Support ID of all replaced parts,
--------------- else no change.
-------- Components of VC 04159, 04160 and 04162 parts:
--------------- If comp part Support ID is greater than min Support ID of all its parents, its Support ID needs decreased to match the min Support ID of all parent Kits,
--------------- else no change
--------------------------------------------------------------

-- Combines Replacing-Replaced and Component-Parent into a singel dataset
---- Replacing part and Replaced part -- replqacing part Support ID (P1) needs replaced by replaced part min Support IDs (P2)
---- Unioned
---- Comp part and Parent part -- component part Support ID (P1) needs replaced by parent part min Support ID (P2) 
-- Once combined all P1 Support IDs greater than their corresponding P2 min Support IDs need replaced by their P2 min Support IDs.

With cp As
(
Select Distinct Comp As P1
	  ,Parent As P2
From wrk_RYOS_PDC_RPO_Progressive_Parent_Comp
--Where Comp=' 0106641' Or Parent=' 0106641'
)

,rr As
(
Select Distinct Final_Replacement_PN As P1
	  ,Cancelled_PN As P2
From ref_PDC_Part_Final_Replacement
--Where Final_Replacement_PN=' 141523' Or Cancelled_PN=' 0079512'
)

,u As
(
Select *
From cp
Union
Select *
From rr
)

,d As
(
Select Distinct P1
	  ,P2
From u
)

,mn As
(
--Gets min support level ID
Select P1 As PN
	  ,Min(Support_ID) As MinP2Suppt_ID
From d
Join wrk_RYOS_PDC_PN_Min_Suppt_Lvl s
On P2=s.PN
Group by P1
)

,newsupptid As
(
Select Distinct s.PN
	  ,Support_ID
	  ,MinP2Suppt_ID
	  ,Case 
			When MinP2Suppt_ID Is Not Null And MinP2Suppt_ID<Support_ID
			Then MinP2Suppt_ID
			Else Support_ID
			End As RevisedSupptID
From wrk_RYOS_PDC_PN_Min_Suppt_Lvl s
Left Join mn
On s.PN=mn.PN
)

--Updates revised Support ID
Update s
Set s.Support_ID=RevisedSupptID
From wrk_RYOS_PDC_PN_Min_Suppt_Lvl s
Join newsupptid n
On s.PN=n.PN
;

--------------------------------------------------------------
--------------------------------------------------------------
-- Part 10 
-- For ref_PDC_Part_Details PNs:
--		Gets RYOS
--		Gets PN (PDC format) and origin date
--		Gets PDC Cancel status
--		PDCSupptReq
--		Gets PDC support levelb based on parent units' support level
--		Gets In CORE
--		Gets 200 RYOS for hose center tooling parts
--------------------------------------------------------------
--------------------------------------------------------------

Truncate Table ref_PDC_RYOS;

Insert Into ref_PDC_RYOS
Select Distinct d.PN
	  ,Null As RYOS
	  ,d.Origin_Dt
	  ,Case
	     When d.Status='CAN'
		 Then 'Yes'
		 Else 'No'
		 End As Cancelled_YN
	  ,Null As SupptReq_YN
	  ,Null As Support
	  ,Null As InCORE_YN
	  ,Null As Comp_YN
--Into ref_PDC_RYOS_test
From ref_PDC_Part_Set_Detail d
;

--Populates RYOS
Update r
Set r.RYOS=t.RYOS
From ref_PDC_RYOS r
Join wrk_RYOS_PDC_RYOS t
On r.PN=t.PN
;

--Populates SupptReq_YN
With s As
(
Select r.PN
	  ,Case
		 When sr.PN Is Not Null
		 Then 'Yes'
		 Else 'No'
		 End As SupptReq_YN
From ref_PDC_RYOS r
Left Join wrk_RYOS_PDC_PN_Suppt_Req sr
On r.PN=sr.PN
)
Update r
Set r.SupptReq_YN=s.SupptReq_YN
From ref_PDC_RYOS r
Join s
On r.PN=s.PN
;

--Populates Support
With s As
(
Select r.PN
	  ,[Desc] As Support
From ref_PDC_RYOS r
Left Join wrk_RYOS_PDC_PN_Min_Suppt_Lvl l
On r.PN=l.PN
Left Join ref_PDC_Unit_Support_Level s
On l.Support_ID=s.ID
)
Update r
Set r.Support=s.Support
From ref_PDC_RYOS r
Join s
On r.PN=s.PN
;

--Populates InCORE_YN
With c As
(
Select r.PN
	  ,Case
		 When i.PN Is Not Null
		 Then 'Yes'
		 Else 'No'
		 End AS InCORE_YN
From ref_PDC_RYOS r
Left Join wrk_RYOS_PDC_PN_in_CORE i
On r.PN=i.PN
)
Update r
Set r.InCORE_YN=c.InCORE_YN
From ref_PDC_RYOS r
Join c
On r.PN=c.PN
;

--Updates RYOS to 200 for Tooling
With t As
(
Select r.PN
	  ,Case
		 When t.PN Is Null
		 Then r.RYOS
		 Else 200
		 End AS RYOS
From ref_PDC_RYOS r
Left Join wrk_RYOS_PDC_Tooling t
On r.PN=t.PN
)
Update r
Set r.RYOS=t.RYOS
From ref_PDC_RYOS r
Join t
On r.PN=t.PN
;

-- Updates Comp_YN
With c As
(
Select Distinct r.PN
	  ,Case
		 When c.Comp Is Not Null
		 Then 'Yes'
		 Else 'No'
		 End AS Comp_YN
From ref_PDC_RYOS r
Left Join wrk_RYOS_PDC_RPO_Progressive_Parent_Comp c
On r.PN=c.Comp
)
Update r
Set r.Comp_YN=c.Comp_YN
From ref_PDC_RYOS r
Join c
On r.PN=c.PN
;




-- It took 6 hours and 6 minutes to run the following query but building the same table with the update queries above ran much faster (in just minutes).


--Truncate Table ref_PDC_RYOS;

--With s As
--(
--Select PN
--	  ,[Desc] As Support
--From wrk_RYOS_PDC_PN_Min_Suppt_Lvl l
--Join ref_PDC_Unit_Support_Level s
--On l.Support_ID=s.ID
--)
--Insert Into ref_PDC_RYOS
--Select Distinct d.PN
--	  ,r.RYOS
--	  ,d.Origin_Dt
--	  ,Case
--	     When d.Status='CAN'
--		 Then 'Yes'
--		 Else 'No'
--		 End As Cancelled_YN
--	  ,Case
--		 When sr.PN Is Not Null
--		 Then 'Yes'
--		 Else 'No'
--		 End As SupptReq_YN
--	  ,s.Support
--	  ,Case
--		 When i.PN Is Not Null
--		 Then 'Yes'
--		 Else 'No'
--		 End AS InCORE_YN
--	  ,Case
--		 When c.PN Is Not Null
--		 Then 'Yes'
--		 Else 'No'
--		 End AS Comp_YN
----Into ref_PDC_RYOS_test
--From ref_PDC_Part_Set_Detail d
--Left Join wrk_RYOS_PDC_RYOS r
--On d.PN=r.PN
--Left Join wrk_RYOS_PDC_PN_Suppt_Req sr
--On d.PN=sr.PN 
--Left Join s
--On d.PN=s.PN
--Left Join wrk_RYOS_PDC_PN_in_CORE i
--On d.PN=i.PN
--Left Join ryos_comp_tmp c
--On d.PN=r.PN
--Left Join wrk_RYOS_PDC_Tooling t
--On d.PN=t.PN



GO
