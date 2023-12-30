SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--The line below is here just to use to execute the procedure during testing; it should never be uncommented out
--when the procedure is saved.
------Exec [dbo].[sp_ref_PDC_SPN_Replacing_PNs] 

CREATE PROCEDURE [dbo].[sp_ref_PDC_SPN_Replacing_PNs]  AS
Truncate Table dbo.ref_PDC_SPN_Replacing_PNs;

--Adds final replacing (Level 1 - top level - last PN in Chain) replacing parts.   Last part in chains are not 8/1 and are not 8/6
--otherwise they would be followed by other parts and not be the last parts in chains.
--These PNs need flipped to SPNs first so other parts in chains can be cancelled to use them
With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
--Adds all final replacing PNs that are not replaced as Level 1 replacements.  
--This includes all final replacing part numbers that are not cancelled and also those that are OC 8, but are not SC 1 and not SC 6.
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Final_Replacement_PN] As PN
	  ,d.OC
	  ,d.SC
	  ,d.Set_SOH
	  ,d.Set_OO
	  ,d.Set_BO
	  ,d.PkgCd As Pkg_Cd
	  ,d.ContactVend As Contact_Vend
	  ,'Final Replacing PN (all non-replaced PNs)' As Category 
	  ,[Level]=1
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join dbo.ref_PDC_Part_Set_Detail d
  On Final_Replacement_PN=d.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On Final_Replacement_PN=x.PN
  Left Join pmr
  On Final_Replacement_PN=pmr.PN 
  Where pmr.PN Is Null
  ;

--Adds Repl 9 replacing parts to replacing parts table
--These PNs need flipped to SPNs first so other parts can be cancelled to use them
With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Repl9] As PN
	  ,pmr.OC
	  ,pmr.SC
	  ,pmr.Set_SOH
	  ,pmr.Set_OO
	  ,pmr.Set_BO
	  ,pmr.Pkg_Cd
	  ,pmr.Contact_Vend
	  ,'Repl 09' As Category
	  ,[Level]=2
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join pmr
  On [Repl9]=pmr.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On pmr.PN=x.PN
  Left Join dbo.ref_PDC_SPN_Replacing_PNs f
  On pmr.PN=f.PN
  Where f.PN Is Null
;

--Adds Repl 8 replacing parts to replacing parts table
--These PNs need flipped to SPNs first so other parts can be cancelled to use them
With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Repl8] As PN
	  ,pmr.OC
	  ,pmr.SC
	  ,pmr.Set_SOH
	  ,pmr.Set_OO
	  ,pmr.Set_BO
	  ,pmr.Pkg_Cd
	  ,pmr.Contact_Vend
	  ,'Repl 08' As Category
	  ,[Level]=3
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join pmr
  On [Repl8]=pmr.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On pmr.PN=x.PN
  Left Join dbo.ref_PDC_SPN_Replacing_PNs f
  On pmr.PN=f.PN
  Where f.PN Is Null
;

--Adds Repl 7 replacing parts to replacing parts table
--These PNs need flipped to SPNs first so other parts can be cancelled to use them
With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Repl7] As PN
	  ,pmr.OC
	  ,pmr.SC
	  ,pmr.Set_SOH
	  ,pmr.Set_OO
	  ,pmr.Set_BO
	  ,pmr.Pkg_Cd
	  ,pmr.Contact_Vend
	  ,'Repl 07' As Category
	  ,[Level]=4
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join pmr
  On [Repl7]=pmr.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On pmr.PN=x.PN
  Left Join dbo.ref_PDC_SPN_Replacing_PNs f
  On pmr.PN=f.PN
  Where f.PN Is Null
;

--Adds Repl 6 replacing parts to replacing parts table
--These PNs need flipped to SPNs first so other parts can be cancelled to use them
With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Repl6] As PN
	  ,pmr.OC
	  ,pmr.SC
	  ,pmr.Set_SOH
	  ,pmr.Set_OO
	  ,pmr.Set_BO
	  ,pmr.Pkg_Cd
	  ,pmr.Contact_Vend
	  ,'Repl 06' As Category
	  ,[Level]=5
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join pmr
  On [Repl6]=pmr.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On pmr.PN=x.PN
  Left Join dbo.ref_PDC_SPN_Replacing_PNs f
  On pmr.PN=f.PN
  Where f.PN Is Null
;

--Adds Repl 5 replacing parts to replacing parts table
--These PNs need flipped to SPNs first so other parts can be cancelled to use them
With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Repl5] As PN
	  ,pmr.OC
	  ,pmr.SC
	  ,pmr.Set_SOH
	  ,pmr.Set_OO
	  ,pmr.Set_BO
	  ,pmr.Pkg_Cd
	  ,pmr.Contact_Vend
	  ,'Repl 05' As Category
	  ,[Level]=6
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join pmr
  On [Repl5]=pmr.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On pmr.PN=x.PN
  Left Join dbo.ref_PDC_SPN_Replacing_PNs f
  On pmr.PN=f.PN
  Where f.PN Is Null
;

--Adds Repl 4 replacing parts to replacing parts table
--These PNs need flipped to SPNs first so other parts can be cancelled to use them
With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Repl4] As PN
	  ,pmr.OC
	  ,pmr.SC
	  ,pmr.Set_SOH
	  ,pmr.Set_OO
	  ,pmr.Set_BO
	  ,pmr.Pkg_Cd
	  ,pmr.Contact_Vend
	  ,'Repl 04' As Category
	  ,[Level]=7
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join pmr
  On [Repl4]=pmr.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On pmr.PN=x.PN
  Left Join dbo.ref_PDC_SPN_Replacing_PNs f
  On pmr.PN=f.PN
  Where f.PN Is Null
;

--Adds Repl 3 replacing parts to replacing parts table
--These PNs need flipped to SPNs first so other parts can be cancelled to use them

With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Repl3] As PN
	  ,pmr.OC
	  ,pmr.SC
	  ,pmr.Set_SOH
	  ,pmr.Set_OO
	  ,pmr.Set_BO
	  ,pmr.Pkg_Cd
	  ,pmr.Contact_Vend
	  ,'Repl 03' As Category
	  ,[Level]=8
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join pmr
  On [Repl3]=pmr.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On pmr.PN=x.PN
  Left Join dbo.ref_PDC_SPN_Replacing_PNs f
  On pmr.PN=f.PN
  Where f.PN Is Null
;

--Adds Repl 2 replacing parts to replacing parts table
--These PNs need flipped to SPNs first so other parts can be cancelled to use them
With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Repl2] As PN
	  ,pmr.OC
	  ,pmr.SC
	  ,pmr.Set_SOH
	  ,pmr.Set_OO
	  ,pmr.Set_BO
	  ,pmr.Pkg_Cd
	  ,pmr.Contact_Vend
	  ,'Repl 02' As Category
	  ,[Level]=9
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join pmr
  On [Repl2]=pmr.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On pmr.PN=x.PN
  Left Join dbo.ref_PDC_SPN_Replacing_PNs f
  On pmr.PN=f.PN
  Where f.PN Is Null
;

--Adds Repl 1 replacing parts to replacing parts table
--These PNs need flipped to SPNs first so other parts can be cancelled to use them
With pmr As
--Gets all PNs that are replaced (OC=8) AND (SC=1 Or SC=6)
(
Select PN
,OC
,SC
,Set_SOH
,Set_OO
,Set_BO
,PkgCd As Pkg_Cd
,ContactVend As Contact_Vend
From dbo.ref_PDC_Part_Detail
Where OC='8' And (SC='1' Or SC='6')
)
Insert Into dbo.ref_PDC_SPN_Replacing_PNs
SELECT Distinct x.SPN
	  ,[Repl1] As PN
	  ,pmr.OC
	  ,pmr.SC
	  ,pmr.Set_SOH
	  ,pmr.Set_OO
	  ,pmr.Set_BO
	  ,pmr.Pkg_Cd
	  ,pmr.Contact_Vend
	  ,'Repl 01' As Category
	  ,[Level]=10
  FROM [dbo].[ref_PDC_Part_Final_Replacement] r
  Join pmr
  On [Repl1]=pmr.PN
  Join dbo.ref_PDC_SPN_X_Ref x
  On pmr.PN=x.PN
  Left Join dbo.ref_PDC_SPN_Replacing_PNs f
  On pmr.PN=f.PN
  Where f.PN Is Null
;
GO
