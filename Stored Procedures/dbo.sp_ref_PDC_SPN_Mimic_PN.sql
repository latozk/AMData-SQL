SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[sp_ref_PDC_SPN_Mimic_PN]  AS

--2023_11_02 Added code at the end to remplace 8 million mimic PNs with AM PNs when available.

Truncate Table dbo.ref_PDC_SPN_Mimic_PN;

--Gets data from a view and puts it into a temporary table to 
--speed up the queries used to populate the ref_PDC_SPN_Mimic_PN table.
IF OBJECT_ID(N'tempdb..#d') IS NOT NULL
BEGIN
DROP TABLE #d
END;

IF OBJECT_ID(N'tempdb..#xd') IS NOT NULL
BEGIN
DROP TABLE #xd
END;

IF OBJECT_ID(N'tempdb..#scnt') IS NOT NULL
BEGIN
DROP TABLE #scnt
END;

Select PN, Combi, OC, Lst_Rcpt_Dt 
Into dbo.#d 
From dbo.ref_PDC_Part_Detail Where PN Not Like ' % [0-9]%';

--Set 1a:  SPNs with counts = 1, Mimic PN = PN)

With m As
(Select SPN ,Mimic_PN From dbo.ref_PDC_SPN_Mimic_PN)

,x As
(Select x.SPN ,x.PN From ref_PDC_SPN_X_Ref x)

,d As
(Select * From #d)

,xd As
(Select Distinct x.SPN, x.PN ,Combi ,OC ,Lst_Rcpt_Dt
From x
Join #d
On x.PN=#d.PN)

,scnt As
(
Select SPN, Count(SPN) spncnt
From xd 
Group By SPN Having Count(SPN)=1)

,f1 As
(Select Distinct xd.SPN, PN ,Combi ,OC ,Lst_Rcpt_Dt
From xd
Join scnt
On xd.SPN=scnt.SPN)

Insert Into dbo.ref_PDC_SPN_Mimic_PN
Select f1.SPN ,f1.PN As Mimic_PN ,'SPN crosses to a Single PDC PN' As Category
From f1
Left Join m
On f1.SPN=m.SPN
Where m.SPN Is Null
;

   
--Set 1b:  SPNs with 'S' Part counts = 1, Mimic PN = PN)

With m As
(Select SPN ,Mimic_PN From dbo.ref_PDC_SPN_Mimic_PN)

,x As
(Select x.SPN ,x.PN From ref_PDC_SPN_X_Ref x)

,d As
(Select * From #d)

,xd As
(Select Distinct x.SPN, x.PN ,Combi ,OC ,Lst_Rcpt_Dt
From x
Join #d
On x.PN=#d.PN
Where Combi='S')

,scnt As
(
Select SPN, Count(SPN) spncnt
From xd 
Group By SPN Having Count(SPN)=1)

,f1 As
(Select Distinct xd.SPN, PN ,Combi ,OC ,Lst_Rcpt_Dt
From xd
Join scnt
On xd.SPN=scnt.SPN)

Insert Into dbo.ref_PDC_SPN_Mimic_PN
Select f1.SPN ,f1.PN As Mimic_PN ,'SPN crosses to a Single PDC PN with "S" Combi' As Category
From f1
Left Join m
On f1.SPN=m.SPN
Where m.SPN Is Null
;


--Set 2 SPNs with PN counts > 1 and at least one part in par set with ‘S’ combi code and Mimic PN needs to be the Best PN
----Max(LstRcptDt) can't be used to join LstRcptDt if LstRcptDt is Null; therefore, 
----Set 2a will deal with populated LstRcptDt values 
----Set 2b will deal with Null LstRcptDt values


--Set 2a:  SPNs with counts > 1, Mimic PN needs to be the Best PN
--This Best PN will need to be chosen based upon a hierarchy.
--Combi Code ='S'
--OC Min
--Max Last Received Is Not Null
--Min PN

With x As
(Select x.SPN ,x.PN From ref_PDC_SPN_X_Ref x)


--PDC Parts where Last Received Date Is Null
,d As
(Select PN ,Combi ,OC ,Lst_Rcpt_Dt From #d Where Lst_Rcpt_Dt Is Not Null)
--,xd As
--Insert Into #xd
Select Distinct x.SPN, x.PN ,Combi ,OC ,Lst_Rcpt_Dt
Into #xd
From x Join d On x.PN=d.PN
;

--,scnt As
--Insert Into #scnt
Select SPN, Count(SPN) spncnt 
Into #scnt
From #xd Group By SPN Having Count(SPN)>0
;

With m As
(Select SPN ,Mimic_PN From dbo.ref_PDC_SPN_Mimic_PN)

--Gets SPNs which contain at least one PN in set with Combi 'S'
,s As 
(Select SPN From #xd Where Combi='S')

,a0 As
(Select Distinct #xd.SPN, PN ,Combi ,Lst_Rcpt_Dt ,OC
From #xd 
Join #scnt On #xd.SPN=#scnt.SPN
Join s On #xd.SPN=s.SPN)

--Gets Minimum OC for for SPN PNs
,a1 As
(Select SPN, Min(OC) As OC
From a0
Group By a0.SPN)

--Gets Maximum LstRcptDt for for SPN PNs
,a2 As
(Select a0.SPN, a1.OC, Max(Lst_Rcpt_Dt) As Lst_Rcpt_Dt
From a0 Join a1 On a0.SPN=a1.SPN And a0.OC=a1.OC 
Group By a0.SPN, a1.OC)

--Gets Minimum PN for for SPN PNs
,a3 As
(Select a0.SPN, a2.OC, a2.Lst_Rcpt_Dt, Min(a0.PN) As PN
From a0 Join a2 On a0.SPN=a2.SPN And a0.OC=a2.OC
Group By a0.SPN, a2.OC, a2.Lst_Rcpt_Dt)

,a4 As
(Select a0.SPN, a3.OC, a3.PN
From a0 Join a3 On a0.SPN=a3.SPN And a0.OC=a3.OC And a0.PN=a3.PN) 

Insert Into dbo.ref_PDC_SPN_Mimic_PN
Select a4.SPN ,a4.PN As Mimic_PN ,'Mimic PN by S Combi, MinOC, MinLstRc, MinPN' As Category
--Into #m1
From a4
Left Join m
On a4.SPN=m.SPN
Where m.SPN Is Null
;


--Set 2b:  SPNs with counts > 1, Mimic PN needs to be the Best PN
--This Best PN will need to be chosen based upon a hierarchy.
--Combi Code ='S'
--OC Min
--Max Last Received Is Null
--Min PN

Truncate Table #xd;

Truncate Table #scnt;

With x As
(Select x.SPN ,x.PN From ref_PDC_SPN_X_Ref x)

--PDC Parts where Last Received Date Is Null	
,d As
(Select PN ,Combi ,OC ,Lst_Rcpt_Dt From #d Where Lst_Rcpt_Dt Is Null)

--,xd As
Insert Into #xd
Select Distinct x.SPN, x.PN ,Combi ,OC ,Lst_Rcpt_Dt
--Into #xd
From x Join d On x.PN=d.PN
;

--,scnt As
Insert Into #scnt
Select SPN, Count(SPN) spncnt 
--Into #scnt
From #xd Group By SPN Having Count(SPN)>0
;

With m As
(Select SPN ,Mimic_PN From dbo.ref_PDC_SPN_Mimic_PN)

--Gets SPNs which contain at least one PN in set with Combi 'S'
,s As 
(Select SPN From #xd Where Combi='S')

,a0 As
(Select Distinct #xd.SPN, PN ,Combi ,Lst_Rcpt_Dt ,OC
From #xd 
Join #scnt On #xd.SPN=#scnt.SPN
Join s On #xd.SPN=s.SPN)

--Gets Minimum OC for for SPN PNs
,a1 As
(Select SPN, Min(OC) As OC
From a0
Group By a0.SPN)

--Gets Minimum PN for for SPN PNs
,a2 As
(Select a0.SPN, a1.OC, Min(a0.PN) As PN
From a0 Join a1 On a0.SPN=a1.SPN And a0.OC=a1.OC
Group By a0.SPN, a1.OC)

,a3 As
(Select a0.SPN, a2.OC, a2.PN
From a0 Join a2 On a0.SPN=a2.SPN And a0.OC=a2.OC And a0.PN=a2.PN) 

Insert Into dbo.ref_PDC_SPN_Mimic_PN
Select a3.SPN ,a3.PN As Mimic_PN ,'Mimic PN by S Combi, MinOC, MinPN' As Category
--Into #m12
From a3
Left Join m
On a3.SPN=m.SPN
Where m.SPN Is Null
;


--Set 3 SPNs with PN counts > 1 where Mimic PN needs to be the Best PN
----Since Max(LstRcptDt) can be Null it can't be used in Joins; therefore, 
----Set 3a will deal with populated values 
----Set 3b will deal with Null values


--Set 3a:  SPNs with counts > 1, Mimic PN needs to be the Best PN
--This Best PN will need to be chosen based upon a hierarchy.
--Combi Code <>'S'
--OC Min
--Max Last Received Is Not Null
--Min PN

Truncate Table #xd;

Truncate Table #scnt;

With x As
(Select SPN ,PN From ref_PDC_SPN_X_Ref)
--Where SPN='0018131' Or SPN='902973101' Or SPN='1334310' or SPN='0292682' or SPN='0000125')

--PDC Parts where Last Received Date Is Not Null
,d As
(Select PN ,Combi ,OC ,Lst_Rcpt_Dt From #d Where Lst_Rcpt_Dt Is Not Null)

--,xd As
Insert Into #xd
Select Distinct x.SPN, x.PN ,Combi ,OC ,Lst_Rcpt_Dt
From x Join d On x.PN=d.PN
;

--,scnt As
Insert Into #scnt
Select SPN, Count(SPN) spncnt From #xd Group By SPN Having Count(SPN)>0
;


--Gets SPNs which contain at least one PN in set with Combi 'S'
With s As 
(Select SPN From #xd Where Combi='S')

--Gets SPNs which contain do not have at least one PN in set with Combi 'S'
--,ns As 
(Select #xd.SPN 
Into #ns
From #xd Left Join s On #xd.SPN=s.SPN Where s.SPN Is Null)
;

With m As
(Select SPN ,Mimic_PN From dbo.ref_PDC_SPN_Mimic_PN)
--Excludes SPNs which have an ‘S’ part

,a0 As
(Select Distinct #xd.SPN, PN ,Combi ,Lst_Rcpt_Dt ,OC
From #xd Join #scnt On #xd.SPN=#scnt.SPN
Join #ns On #xd.SPN=#ns.SPN)

--Gets Minimum OC for for SPN PNs
,a1 As
(Select a0.SPN, Min(OC) As OC
From a0
Group By a0.SPN)

--Gets Maximum LstRcptDt for for SPN PNs
,a2 As
(Select a0.SPN, a1.OC, Max(Lst_Rcpt_Dt) As Lst_Rcpt_Dt
From a0 Join a1 On a0.SPN=a1.SPN And a0.OC=a1.OC 
Group By a0.SPN, a1.OC)

--Gets Minimum PN for for SPN PNs
,a3 As
(Select a0.SPN, a2.OC, a2.Lst_Rcpt_Dt, Min(a0.PN) As PN
From a0 Join a2 On a0.SPN=a2.SPN And a0.OC=a2.OC And a0.Lst_Rcpt_Dt=a2.Lst_Rcpt_Dt
Group By a0.SPN, a2.OC, a2.Lst_Rcpt_Dt)

,a4 As
(Select a0.SPN, a3.OC ,a3.Lst_Rcpt_Dt, a3.PN
From a0 Join a3 On a0.SPN=a3.SPN And a0.OC=a3.OC And a0.Lst_Rcpt_Dt=a3.Lst_Rcpt_Dt And a0.PN=a3.PN) 

Insert Into dbo.ref_PDC_SPN_Mimic_PN
Select a4.SPN ,a4.PN As Mimic_PN ,'Mimic PN Using Non-S Part, MinOC, MaxLstRcpt, MinPN' As Category
From a4
Left Join m
On a4.SPN=m.SPN
Where m.SPN Is Null
;


--Set 3b:  SPNs with counts > 1, Mimic PN needs to be the Best PN
--This Best PN will need to be chosen based upon a hierarchy.
--Combi Code <>'S'
--OC Min
--Max Last Received Is Null
--Min PN

Truncate Table #xd;

Truncate Table #scnt;

Truncate Table #ns;

With x As
(Select SPN ,PN From ref_PDC_SPN_X_Ref)
--Where SPN='0018131' Or SPN='902973101' Or SPN='1334310' or SPN='0292682' or SPN='0000125')

--PDC Parts where Last Received Date Is Null
,d As
(Select PN ,Combi ,OC ,Lst_Rcpt_Dt From #d Where Lst_Rcpt_Dt Is Null)

--,xd As
Insert Into #xd
Select Distinct x.SPN, x.PN, d.Combi, d.OC, d.Lst_Rcpt_Dt
From x Join d On x.PN=d.PN
;

--,scnt As
Insert Into #scnt
Select SPN, Count(SPN) spncnt From #xd Group By SPN Having Count(SPN)>1
;

--Gets SPNs which contain at least one PN in set with Combi 'S'
With s As 
(Select SPN From #xd Where Combi='S')

--Gets SPNs which contain do not have at least one PN in set with Combi 'S'
--,ns As 
Insert Into #ns
Select #xd.SPN 
--Into #ns
From #xd Left Join s On #xd.SPN=s.SPN Where s.SPN Is Null
;

With m As
(Select SPN ,Mimic_PN From dbo.ref_PDC_SPN_Mimic_PN)
--Excludes SPNs which have an ‘S’ part

,a0 As
(Select Distinct #xd.SPN, PN ,Combi ,Lst_Rcpt_Dt ,OC
From #xd Join #scnt On #xd.SPN=#scnt.SPN
Join #ns On #xd.SPN=#ns.SPN)

--Gets Minimum OC for for SPN PNs
,a1 As
(Select a0.SPN, Min(OC) As OC
From a0
Group By a0.SPN)

--Gets Maximum LstRcptDt for for SPN PNs
,a2 As
(Select a0.SPN, a1.OC, Max(Lst_Rcpt_Dt) As Lst_Rcpt_Dt
From a0 Join a1 On a0.SPN=a1.SPN And a0.OC=a1.OC 
Group By a0.SPN, a1.OC)

--Gets Minimum PN for for SPN PNs
,a3 As
(Select a0.SPN, a2.OC, a2.Lst_Rcpt_Dt, Min(a0.PN) As PN
From a0 Join a2 On a0.SPN=a2.SPN And a0.OC=a2.OC
Group By a0.SPN, a2.OC, a2.Lst_Rcpt_Dt)

,a4 As
(Select a0.SPN, a3.OC, a3.PN
From a0 Join a3 On a0.SPN=a3.SPN And a0.OC=a3.OC And a0.PN=a3.PN) 

Insert Into dbo.ref_PDC_SPN_Mimic_PN
Select a4.SPN ,a4.PN As Mimic_PN ,'Mimic PN by Non-S Combi, MinOC, MinPN' As Category
From a4
Left Join m
On a4.SPN=m.SPN
Where m.SPN Is Null
;
  


IF OBJECT_ID(N'tempdb..#d') IS NOT NULL
BEGIN
DROP TABLE #d
END;

IF OBJECT_ID(N'tempdb..#d') IS NOT NULL
BEGIN
DROP TABLE #ns
END;


--Set 4 Adds package code PNs not yet added.
Insert Into dbo.ref_PDC_SPN_Mimic_PN
Select x.SPN
	  , x.PN
	  , 'Remaining Pkg Code PNs' As Category
From ref_PDC_SPN_X_Ref x 
Left Join dbo.ref_PDC_SPN_Mimic_PN m On x.SPN=m.SPN 
Where m.SPN Is Null And x.PN Like ' % [0-9]%'
;

--Removed the following, Per Dana 
--ref email:  91559-11 Module1 Load SPN: Issue with existin 8mllion parts that have SP, dated 11/17/23 11:43 AM

----Mimic PNs with space prefix and product class SP (SPN not avail in AMData so ProdClass SP not available)
----, need replaced with HPN from SPN group
----Since SPNs not in Part_Set_Details, will use SPN Like'8%' and Mimic_PN Like ' 8%', instead.
----Reason:  Using ' '8 million PNs is causing an issue in the Pricing System (pricing isn't 
----available for the ' '8 million PNs so HPN (Utilev or Yale) should be used instead. 

--With d As
--(
--Select m.SPN, m.Mimic_PN, x.PN, d.PrdCls
--From dbo.ref_PDC_SPN_Mimic_PN m
--Left Join dbo.ref_PDC_SPN_X_Ref x 
--On m.SPN=x.SPN
--Left Join ref_PDC_Part_Detail d
--On m.Mimic_PN=d.PN
--Where (m.Mimic_PN Like ' 8%' And m.SPN Like '8______') And x.PN Not Like ' 8%' 
----And m.SPN='8500002'
----And (m.SPN='8500001' or m.SPN='8500002'or m.SPN='8252275' or m.SPN='8810150')
--)
--,u As
--(
--Select SPN, Min(PN) As New_Mimic_PN
--From d
--Where PrdCls='SP'
--Group By SPN
--)

--Update m
--Set Mimic_PN=u.New_Mimic_PN
--From dbo.ref_PDC_SPN_Mimic_PN m
--Join u
--On m.SPN=u.SPN



GO
