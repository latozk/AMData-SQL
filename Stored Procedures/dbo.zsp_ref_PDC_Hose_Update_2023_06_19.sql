SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE Procedure [dbo].[zsp_ref_PDC_Hose_Update_2023_06_19] AS

---- =============================================
----Author: Newell, R ; Sexton, C
----Date: 2022-08-01
----Purpose: Procedure does three things: 
--           1. Creates tables used upload hose BOMs and warehouse date to the as400
--           2. Populates global hose SQL tables
--           3. Creates tables used to make O/Neil files:
----Last modified date:
----Modification notes: 
---- =============================================

---- =============================================
--Part 1 Creates tables used to make QDLS Files:
-----Part 1A Creates table used to make
----------- ASSYBOM.TXT
----------- ASSYCOM.TXT
-----Part 1B Creates table used to make
----------- BULKUPD.txt
-----Part 1C Creates table used to make
----------- SHORDUPD.txt
-----Part 1D Creates tables used to make O/Neil Files:
-------- Creates tables used to make O/Neil Files:
----------- HOSE.txt
----------- CHAIN.txt
----------- BULK.txt
----------- FTG.txt
---- =============================================


-------Part 1A Truncates and Populates the table used to make HOSEUPD.txt

Truncate Table dbo.hose_PDC_HoseUpd;

With e As --Records to exclude
(
Select [Prod #]
  From [dbo].[hose_Detail]
  Where ([Prod #] Like '%TEST%'
  Or [Prod #]='NONE'
  Or Right([Prod #],1) Like '%A'
  Or Right([Prod #],1) Like '%L'
  Or Right([Prod #],1) Like '%M'
  Or Right([Prod #],1) Like '%P'
  Or Right([Prod #],1) Like '%Z'
  Or [Type]='UK'
  Or [Type]='CM'
  Or [Type]='PS')
)

------Gets Hyster Hose BOM
, h AS
(
SELECT 'Hyster' AS [Brand]
       ,' ' AS [Alt_Build]
       --[Origin Date]
	  ,replace(Convert(Varchar(10),[Maint Date],126),'-','') AS [Rev_Date]
      --,[Initials]
      --,[Type]
      --,[Vendor]
      --,[Prod #]
      ,[Hys #] AS PN
      --,[Yal #] AS PN
      ,[Asm L-# IN] AS Assy_Length_Inches
      --,[Asm L-# MM Not Rounded]
      --,[Rounded Asm L-# MM]
      --,[Tot Length]
      --,[Bulk #]
      --,[Comp1]
      --,[Bulk HPN]
      ,[Comp1 HYS] AS Comp1
      --,[Bulk YPN]
      --,[Comp1 YAL] AS Comp1
      --,[Bulk Cut To-# IN]
      --,[Rounded Bulk Cut To-# IN]
      --,[Bulk L-# IN]
      ,[Comp1 CUT TO] AS Comp1_CutTo
      --,[Bulk Cut To-# MM Not Rounded]
      --,[Rounded Bulk Cut To-# MM]
      --,[Bulk-# FT]
      ,[Comp1 Qty] AS Comp1_Qty
      --,[Bulk Comm]
      ,[Comp1 Comm] AS Comp1_Comm
      --,[Die Color]
      --,[Comm1]
      ,[Comm1 Hys] As Comm1
      --,[Comm1 Yal] AS Comm1
      --,[Ring Color]
      --,[Comm2]
      ,[Comm2 Hys] AS Comm2
      --,[Comm2 Yal] AS Comm2
      --,[Lt Ftg]
      --,[Qty-Lt Ftg]
      --,[Ftg1]
      --,[Comp2]
      --,[Ftg1 Hys #]
      ,[Comp2 Hys] AS Comp2
      --,[Ftg1 Yal #]
      --,[Comp2 Yal] AS Comp2
      --,[Ftg1 Qty]
      ,[Comp2 Qty] AS Comp2_Qty
      --,[Grd Placemt-# IN]
      --,[Grd Cut Comments]
      --,[Ftg1 Comm]
      --,[Comp2 Comm] AS Comp2_Comm
      --,[Ftg1 Hys Comm]
      ,[Comp2 Hys Comm] AS Comp2_Comm
      --,[Ftg1 Yal Comm]
      --,[Comp2 Yal Comm] AS Comp2_Comm
      --,[Rt Ftg]
      --,[Qty-Rt Ftg]
      --,[Ftg2]
      --,[Comp3]
      --,[Ftg2 Hys #]
      ,[Comp3 Hys] AS Comp3
      --,[Ftg2 Yal #]
      --,[Comp3 Yal] AS Comp3
      --,[Ftg2 Qty]
      ,[Comp3 Qty] AS Comp3_Qty
      --,[Ftg2 Comm]
      --,[Comp3 Comm] AS Comp3_Comm
      --,[Ftg2 Hys Comm]
      ,[Comp3 Hys Comm] AS Comp3_Comm
      --,[Ftg2 Yal Comm]
      --,[Comp3 Yal Comm] AS Comp3_Comm
      --,[Guard #]
      --,[Comp4]
      ,[Comp4 Hys] AS Comp4
      --,[Comp4 Yal] AS Comp4
      --,[Grd_Qty]
      ,[Comp4 Qty] AS Comp4_Qty
      --,[Tot Grd Cut To-# IN]
      --,[Tot Grd Cut To-# FT]
      ,[Comp4 Cut To] AS Comp4_CutTo
      --,[Guard_Cut_Comments]
      ,[Comm7]
      --,[Guard Comm]
      ,[Comp4 Comm] AS Comp4_Comm
      --,[Print Or Chart]
      --,[Print Or Chart Req]
      ,[Comm3]
      --,[Split Info]
      ,[Comm4]
      --,[Other Req]
      ,[Comm5]
      --,[Restrictions]
      ,[Comm6]
      --,[Cap Or Plug]
      ,[Comm8]
      --,[Eng Notes]
      --,[Ferrule1]
      --,[Comp5]
      --,[Ferrule1 Hys #]
      ,[Comp5 HYS] AS Comp5
      --,[Ferrule1 Yal #]
      --,[Comp5 YAL] AS Comp5
      --,[Ferrule1 Qty]
      ,[Comp5 Qty] AS Comp5_Qty
	  ,null AS Comp5_Comm
      --,[Ferrule2]
      --,[Comp6]
      --,[Ferrule2 Hys #]
      ,[Comp6 Hys] As Comp6
      --,[Ferrule2 Yal #]
      --,[Comp6 Yal] AS Comp6
      --,[Ferrule2 Qty]
      ,[Comp6 Qty] AS Comp6_Qty
	  ,null AS Comp6_Comm
	  ,null AS Comp7
	  ,Null AS Comp7_Comm
	  ,Null AS Comp7_Qty
	  ,Null AS Comp8
	  ,Null AS Comp8_Comm
	  ,Null AS Comp8_Qty
  FROM [dbo].[hose_Detail] dh
  Left Join e
  On dh.[Prod #]=e.[Prod #]
  Where e.[Prod #] Is Null
  And [Hys #] > ' ' 
  And [Hys #] <> 'NONE'
  --And [Hys #] ='%0057964%'
  )
,h2 as 
(
Select h.Brand
, h.Alt_Build
, h.Rev_Date
, h.PN
, h.Assy_Length_Inches
, h.Comm1
, h.Comm2
, h.Comm3
, h.Comm4
, h.Comm5
, h.Comm6
, h.Comm7
, h.Comm8
, h.Comp1
, h.Comp1_Comm
, h.Comp1_Qty
, h.Comp1_CutTo
, h.Comp2
, h.Comp2_Comm
, h.Comp2_Qty
, h.Comp3
, h.Comp3_Comm
, h.Comp3_Qty
, h.Comp4
, h.Comp4_Comm
, h.Comp4_Qty
, h.Comp4_CutTo
, h.Comp5
, h.Comp5_Comm
, h.Comp5_Qty
, h.Comp6
, h.Comp6_Comm
, h.Comp6_Qty
, h.Comp7
, h.Comp7_Comm
, h.Comp7_Qty
, h.Comp8
, h.Comp8_Comm
, h.Comp8_Qty
From h
)

--Gets Yale Hose BOM
, y AS  
(
SELECT 'Yale' AS [Brand]
       ,' ' AS [Alt_Build]
       --[Origin Date]
	  ,replace(Convert(Varchar(10),[Maint Date],126),'-','') AS [Rev_Date]
      --,[Initials]
      --,[Type]
      --,[Vendor]
      --,[Prod #]
      --,[Hys #] AS PN
      ,[Yal #] AS PN
      ,[Asm L-# IN] AS Assy_Length_Inches
      --,[Asm L-# MM Not Rounded]
      --,[Rounded Asm L-# MM]
      --,[Tot Length]
      --,[Bulk #]
      --,[Comp1]
      --,[Bulk HPN]
      --,[Comp1 HYS] AS Comp1
      --,[Bulk YPN]
      ,[Comp1 YAL] AS Comp1
      --,[Bulk Cut To-# IN]
      --,[Rounded Bulk Cut To-# IN]
      --,[Bulk L-# IN]
      ,[Comp1 CUT TO] AS Comp1_CutTo
      --,[Bulk Cut To-# MM Not Rounded]
      --,[Rounded Bulk Cut To-# MM]
      --,[Bulk-# FT]
      ,[Comp1 Qty] AS Comp1_Qty
      --,[Bulk Comm]
      ,[Comp1 Comm] AS Comp1_Comm
      --,[Die Color]
      --,[Comm1]
      --,[Comm1 Hys] As Comm1
      ,[Comm1 Yal] AS Comm1
      --,[Ring Color]
      --,[Comm2]
      --,[Comm2 Hys] AS Comm2
      ,[Comm2 Yal] AS Comm2
      --,[Lt Ftg]
      --,[Qty-Lt Ftg]
      --,[Ftg1]
      --,[Comp2]
      --,[Ftg1 Hys #]
      --,[Comp2 Hys] AS Comp2
      --,[Ftg1 Yal #]
      ,[Comp2 Yal] AS Comp2
      --,[Ftg1 Qty]
      ,[Comp2 Qty] AS Comp2_Qty
      --,[Grd Placemt-# IN]
      --,[Grd Cut Comments]
      --,[Ftg1 Comm]
      --,[Comp2 Comm] AS Comp2_Comm
      --,[Ftg1 Hys Comm]
      --,[Comp2 Hys Comm] AS Comp2_Comm
      --,[Ftg1 Yal Comm]
      ,[Comp2 Yal Comm] AS Comp2_Comm
      --,[Rt Ftg]
      --,[Qty-Rt Ftg]
      --,[Ftg2]
      --,[Comp3]
      --,[Ftg2 Hys #]
      --,[Comp3 Hys] AS Comp3
      --,[Ftg2 Yal #]
      ,[Comp3 Yal] AS Comp3
      --,[Ftg2 Qty]
      ,[Comp3 Qty] AS Comp3_Qty
      --,[Ftg2 Comm]
      --,[Comp3 Comm] AS Comp3_Comm
      --,[Ftg2 Hys Comm]
      --,[Comp3 Hys Comm] AS Comp3_Comm
      --,[Ftg2 Yal Comm]
      ,[Comp3 Yal Comm] AS Comp3_Comm
      --,[Guard #]
      --,[Comp4]
      --,[Comp4 Hys] AS Comp4
      ,[Comp4 Yal] AS Comp4
      --,[Grd_Qty]
      ,[Comp4 Qty] AS Comp4_Qty
      --,[Tot Grd Cut To-# IN]
      --,[Tot Grd Cut To-# FT]
      ,[Comp4 Cut To] AS Comp4_CutTo
      --,[Guard_Cut_Comments]
      ,[Comm7]
      --,[Guard Comm]
      ,[Comp4 Comm] AS Comp4_Comm
      --,[Print Or Chart]
      --,[Print Or Chart Req]
      ,[Comm3]
      --,[Split Info]
      ,[Comm4]
      --,[Other Req]
      ,[Comm5]
      --,[Restrictions]
      ,[Comm6]
      --,[Cap Or Plug]
      ,[Comm8]
      --,[Eng Notes]
      --,[Ferrule1]
      --,[Comp5]
      --,[Ferrule1 Hys #]
      --,[Comp5 HYS] AS Comp5
      --,[Ferrule1 Yal #]
      ,[Comp5 YAL] AS Comp5
      --,[Ferrule1 Qty]
      ,[Comp5 Qty] AS Comp5_Qty
	  ,null AS Comp5_Comm
      --,[Ferrule2]
      --,[Comp6]
      --,[Ferrule2 Hys #]
      --,[Comp6 Hys] As Comp6
      --,[Ferrule2 Yal #]
      ,[Comp6 Yal] AS Comp6
      --,[Ferrule2 Qty]
      ,[Comp6 Qty] AS Comp6_Qty
	  ,null AS Comp6_Comm
	  ,null AS Comp7
	  ,Null AS Comp7_Comm
	  ,Null AS Comp7_Qty
	  ,Null AS Comp8
	  ,Null AS Comp8_Comm
	  ,Null AS Comp8_Qty
  FROM [dbo].[hose_Detail] dy
  Left Join e
  On dy.[Prod #]=e.[Prod #]
  Where e.[Prod #] Is Null
  And [Yal #] > ' ' 
  And [Yal #] <> 'NONE'
 )
 ,y2 AS
(
Select y.Brand
, y.Alt_Build
, y.Rev_Date
, y.PN
, y.Assy_Length_Inches
, y.Comm1
, y.Comm2
, y.Comm3
, y.Comm4
, y.Comm5
, y.Comm6
, y.Comm7
, y.Comm8
, y.Comp1
, y.Comp1_Comm
, y.Comp1_Qty
, y.Comp1_CutTo
, y.Comp2
, y.Comp2_Comm
, y.Comp2_Qty
, y.Comp3
, y.Comp3_Comm
, y.Comp3_Qty
, y.Comp4
, y.Comp4_Comm
, y.Comp4_Qty
, y.Comp4_CutTo
, y.Comp5
, y.Comp5_Comm
, y.Comp5_Qty
, y.Comp6
, y.Comp6_Comm
, y.Comp6_Qty
, y.Comp7
, y.Comp7_Comm
, y.Comp7_Qty
, y.Comp8
, y.Comp8_Comm
, y.Comp8_Qty
From y
Left Join h2
On y.PN=h2.PN
Where h2.PN Is Null
)

 --Gets SPN Hose BOM
 -- This will be commented out until Part Master is ready to received PN BOMs
		--Uncomment following section one time for SPN code
--, s AS
--(
--SELECT 'HYG' AS [Brand]
--       ,' ' AS [Alt_Build]
--       --[Origin Date]
--	  ,replace(Convert(Varchar(10),[Maint Date],126),'-','') AS [Rev_Date]
--      --,[Initials]
--      --,[Type]
--      --,[Vendor]
--      ,[Prod #] AS PN
--      --,[Hys #] AS PN
--      --,[Yal #] AS PN
--      ,[Asm L-# IN] AS Assy_Length_Inches
--      --,[Asm L-# MM Not Rounded]
--      --,[Rounded Asm L-# MM]
--      --,[Tot Length]
--      --,[Bulk #]
--      ,[Comp1]
--      --,[Bulk HPN]
--      --,[Comp1 HYS] AS Comp1
--      --,[Bulk YPN]
--      --,[Comp1 YAL] AS Comp1
--      --,[Bulk Cut To-# IN]
--      --,[Rounded Bulk Cut To-# IN]
--      --,[Bulk L-# IN]
--      ,[Comp1 CUT TO] AS Comp1_CutTo
--      --,[Bulk Cut To-# MM Not Rounded]
--      --,[Rounded Bulk Cut To-# MM]
--      --,[Bulk-# FT]
--      ,[Comp1 Qty] AS Comp1_Qty
--      --,[Bulk Comm]
--      ,[Comp1 Comm] AS Comp1_Comm
--      --,[Die Color]
--      ,[Comm1]
--      --,[Comm1 Hys] AS Comm1
--      --,[Comm1 Yal] AS Comm1
--      --,[Ring Color]
--      ,[Comm2]
--      --,[Comm2 Hys] AS Comm2
--      --,[Comm2 Yal] AS Comm2
--      --,[Lt Ftg]
--      --,[Qty-Lt Ftg]
--      --,[Ftg1]
--      ,[Comp2]
--      --,[Ftg1 Hys #]
--      --,[Comp2 Hys] AS Comp2
--      --,[Ftg1 Yal #]
--      --,[Comp2 Yal] AS Comp2
--      --,[Ftg1 Qty]
--      ,[Comp2 Qty] AS Comp2_Qty
--      --,[Grd Placemt-# IN]
--      --,[Grd Cut Comments]
--      --,[Ftg1 Comm]
--      ,[Comp2 Comm] AS Comp2_Comm
--      --,[Ftg1 Hys Comm]
--      --,[Comp2 Hys Comm]
--      --,[Ftg1 Yal Comm]
--      --,[Comp2 Yal Comm]
--      --,[Rt Ftg]
--      --,[Qty-Rt Ftg]
--      --,[Ftg2]
--      ,[Comp3]
--      --,[Ftg2 Hys #]
--      --,[Comp3 Hys] AS Comp3
--      --,[Ftg2 Yal #]
--      --,[Comp3 Yal] AS Comp3
--      --,[Ftg2 Qty]
--      ,[Comp3 Qty] AS Comp3_Qty
--      --,[Ftg2 Comm]
--      ,[Comp3 Comm] AS Comp3_Comm
--      --,[Ftg2 Hys Comm]
--      --,[Comp3 Hys Comm]
--      --,[Ftg2 Yal Comm]
--      --,[Comp3 Yal Comm]
--      --,[Guard #]
--      ,[Comp4]
--      --,[Comp4 Hys] AS Comp4
--      --,[Comp4 Yal] AS Comp4
--      --,[Grd_Qty]
--      ,[Comp4 Qty] AS Comp4_Qty
--      --,[Tot Grd Cut To-# IN]
--      --,[Tot Grd Cut To-# FT]
--      ,[Comp4 Cut To] AS Comp4_CutTo
--      --,[Guard_Cut_Comments]
--      ,[Comm7]
--      --,[Guard Comm]
--      ,[Comp4 Comm] AS Comp4_Comm
--      --,[Print Or Chart]
--      --,[Print Or Chart Req]
--      ,[Comm3]
--      --,[Split Info]
--      ,[Comm4]
--      --,[Other Req]
--      ,[Comm5]
--      --,[Restrictions]
--      ,[Comm6]
--      --,[Cap Or Plug]
--      ,[Comm8]
--      --,[Eng Notes]
--      --,[Ferrule1]
--      ,[Comp5]
--      --,[Ferrule1 Hys #]
--      --,[Comp5 HYS] AS Comp5
--      --,[Ferrule1 Yal #]
--      --,[Comp5 YAL] AS Comp5
--      --,[Ferrule1 Qty]
--      ,[Comp5 Qty] AS Comp5_Qty
--	    ,null AS Comp5_Comm
--      --,[Ferrule2]
--      ,[Comp6]
--      --,[Ferrule2 Hys #]
--      --,[Comp6 Hys] AS Comp6
--      --,[Ferrule2 Yal #]
--      --,[Comp6 Yal] AS Comp6
--      --,[Ferrule2 Qty]
--      ,[Comp6 Qty] AS Comp6_Qty
	  --,Null AS Comp6_Comm
	  --,Null AS Comp7
	  --,Null AS Comp7_Comm
	  --,Null AS Comp7_Qty
	  --,Null AS Comp8
	  --,Null AS Comp8_Comm
	  --,Null AS Comp8_Qty
  --FROM [dbo].[hose_Detail] ds
  --Left Join e
  --On ds.[Prod #]=e.[Prod #]
  --Where e.[Prod #] Is Null
  --And [Prod #] > ' ' 
  --And [Prod #] <> 'NONE'
--)

--,s2 AS
--(
--Select s.Brand
--, s.Alt_Build
--, s.Rev_Date
--, s.PN
--, s.Assy_Length_Inches
--, s.Comm1
--, s.Comm2
--, s.Comm3
--, s.Comm4
--, s.Comm5
--, s.Comm6
--, s.Comm7
--, s.Comm8
--, s.Comp1
--, s.Comp1_Comm
--, s.Comp1_Qty
--, s.Comp1_CutTo
--, s.Comp2
--, s.Comp2_Comm
--, s.Comp2_Qty
--, s.Comp3
--, s.Comp3_Comm
--, s.Comp3_Qty
--, s.Comp4
--, s.Comp4_Comm
--, s.Comp4_Qty
--, s.Comp4_CutTo
--, s.Comp5
--, s.Comp5_Comm
--, s.Comp5_Qty
--, s.Comp6
--, s.Comp6_Comm
--, s.Comp6_Qty
--, s.Comp7
--, s.Comp7_Comm
--, s.Comp7_Qty
--, s.Comp8
--, s.Comp8_Comm
--, s.Comp8_Qty
--From s
--Left Join h2
--On s.PN=h2.PN
--Left Join y2
--On s.PN=y.PN
--Where h2.PN Is Null and y2.PN Is Null
--)
,u AS 
(
Select * 
From h2
Union
Select *
From y2
--Uncomment when SPN implemented
--Union
--Select *
--From s2
)
,f AS
(
Select *
From u
)

----Adds Hose BOMs to HoseUpd table

Insert Into dbo.hose_PDC_HoseUPD
Select Distinct *
From f
;

----Adds Chain BOMs to HoseUpd table

With e As --Records to exclude
(
Select PN
From dbo.chain_Detail
Where PN Like '3______'
Or PN Like '%[A-Z]'
Or PN ='NONE'
Or PN Like '%TEST%'
Or Assy_Length_Inches Is Null
Or Comp1 Is Null 
Or Comp1_Qty Like '%BULK%' 
Or Comp1_Qty Like '%AR%' 
Or Comp1_Qty Like '%NLA%' 
Or Comp1_Qty Is Null
Or [Man_Add_AS400]='YES' 
Or [Print/Chart_Req]='YES'
)

--Gets Hyster Chain BOMs

,h As
(
Select Distinct 'Hyster' As Brand
, c.Alt_Build
, replace(Convert(Varchar(10),c.Rev_Date,126),'-','') AS [Rev_Date]
, c.HPN As PN
, c.Assy_Length_Inches
, c.Comm1
, c.Comm2
, c.Comm3
, c.Comm4
, c.Comm5
, c.Comm6
, c.Comm7
, c.Comm8
, c.Comp1_HPN As Comp1
, c.Comp1_Comm
, c.Comp1_Qty
, c.Comp1_CutTo
, c.Comp2_HPN As Comp2
, c.Comp2_Comm
, c.Comp2_Qty
, c.Comp3_HPN As Comp3
, c.Comp3_Comm
, c.Comp3_Qty
, c.Comp4_HPN As Comp4
, c.Comp4_Comm
, c.Comp4_Qty
, c.Comp4_CutTo
, c.Comp5_HPN As Comp5
, c.Comp5_Comm
, c.Comp5_Qty
, c.Comp6_HPN As Comp6
, c.Comp6_Comm
, c.Comp6_Qty
, c.Comp7_HPN As Comp7
, c.Comp7_Comm
, c.Comp7_Qty
, c.Comp8_HPN As Comp8
, c.Comp8_Comm
, c.Comp8_Qty
From dbo.chain_Detail c
Left Join dbo.hose_PDC_HoseUPD u
On c.HPN=u.PN
Left Join e
On c.PN=e.PN
Where e.PN Is Null
And u.PN Is Null
And c.HPN>'' And c.HPN<>'NONE'
)

--Gets Yale Chain BOMs

,y As
(
Select Distinct 'Yale' As Brand
, c.Alt_Build
, replace(Convert(Varchar(10),c.Rev_Date,126),'-','') AS [Rev_Date]
, c.YPN As PN
, c.Assy_Length_Inches
, c.Comm1
, c.Comm2
, c.Comm3
, c.Comm4
, c.Comm5
, c.Comm6
, c.Comm7
, c.Comm8
, c.Comp1_YPN As Comp1
, c.Comp1_Comm
, c.Comp1_Qty
, c.Comp1_CutTo
, c.Comp2_YPN As Comp2
, c.Comp2_Comm
, c.Comp2_Qty
, c.Comp3_YPN As Comp3
, c.Comp3_Comm
, c.Comp3_Qty
, c.Comp4_YPN As Comp4
, c.Comp4_Comm
, c.Comp4_Qty
, c.Comp4_CutTo
, c.Comp5_YPN As Comp5
, c.Comp5_Comm
, c.Comp5_Qty
, c.Comp6_YPN As Comp6
, c.Comp6_Comm
, c.Comp6_Qty
, c.Comp7_YPN As Comp7
, c.Comp7_Comm
, c.Comp7_Qty
, c.Comp8_YPN As Comp8
, c.Comp8_Comm
, c.Comp8_Qty
From dbo.chain_Detail c
Left Join dbo.hose_PDC_HoseUPD u
On c.YPN=u.PN
Left Join e
On c.PN=e.PN
Where e.PN Is Null
And u.PN Is Null
And c.YPN>'' And c.YPN<>'NONE'
)

----Uncomment when SPN implemented
----Gets SPN Chain BOMs
--,s As
--(
--Select Distinct 'HYG' As Brand
--, c.Alt_Build
--, replace(Convert(Varchar(10),c.Rev_Date,126),'-','') AS [Rev_Date]
--, c.PN
--, c.Assy_Length_Inches
--, c.Comm1
--, c.Comm2
--, c.Comm3
--, c.Comm4
--, c.Comm5
--, c.Comm6
--, c.Comm7
--, c.Comm8
--, c.Comp1
--, c.Comp1_Comm
--, c.Comp1_Qty
--, c.Comp1_CutTo
--, c.Comp2
--, c.Comp2_Comm
--, c.Comp2_Qty
--, c.Comp3
--, c.Comp3_Comm
--, c.Comp3_Qty
--, c.Comp4
--, c.Comp4_Comm
--, c.Comp4_Qty
--, c.Comp4_CutTo
--, c.Comp5
--, c.Comp5_Comm
--, c.Comp5_Qty
--, c.Comp6
--, c.Comp6_Comm
--, c.Comp6_Qty
--, c.Comp7
--, c.Comp7_Comm
--, c.Comp7_Qty
--, c.Comp8
--, c.Comp8_Comm
--, c.Comp8_Qty
--From dbo.chain_Detail c
--Left Join dbo.hose_PDC_HoseUPD u
--On c.PN=u.PN
--Left Join e
--On c.PN=e.PN
--Where e.PN Is Null
--And u.PN Is Null
--And c.PN>'' And c.PN<>'NONE'
--)

,f As
(
Select * From h
Union
Select * From y
----Uncomment when SPN implemented
--Union
--Select * From s
)

Insert Into dbo.hose_PDC_HoseUPD
Select Distinct f.Brand
      ,f.Alt_Build
      ,f.Rev_Date
      ,f.PN
      ,f.Assy_Length_Inches
      ,f.Comm1
      ,f.Comm2
      ,f.Comm3
      ,f.Comm4
      ,f.Comm5
      ,f.Comm6
      ,f.Comm7
      ,f.Comm8
      ,f.Comp1
      ,f.Comp1_Comm
      ,f.Comp1_Qty
      ,f.Comp1_CutTo
      ,f.Comp2
      ,f.Comp2_Comm
      ,f.Comp2_Qty
      ,f.Comp3
      ,f.Comp3_Comm
      ,f.Comp3_Qty
      ,f.Comp4
      ,f.Comp4_Comm
      ,f.Comp4_Qty
      ,f.Comp4_CutTo
      ,f.Comp5
      ,f.Comp5_Comm
      ,f.Comp5_Qty
      ,f.Comp6
      ,f.Comp6_Comm
      ,f.Comp6_Qty
      ,f.Comp7
      ,f.Comp7_Comm
      ,f.Comp7_Qty
      ,f.Comp8
      ,f.Comp8_Comm
      ,f.Comp8_Qty
From f
Left Join dbo.hose_PDC_HoseUPD u
On f.PN=u.PN
Where u.PN Is Null
;

----Truncates and populates dbo.hose_PDC_HoseUPD_Temp (exported as HOSEUPD.txt for upload from QDLS).
----The temp table is used in place of dbo.hose_PDC_HoseUPD which also includes the two bulk cut to length fields: Comp1_CutTo and Comp4_CutTo). 
----PDC IT will be ready for the CutTo values when M30913 is implemented; hence the temp table. 

--Truncate Table dbo.hose_PDC_HoseUPD_Temp;

--Insert Into dbo.hose_PDC_HoseUPD_Temp
--Select Brand
--,Alt_Build
--,Rev_Date
--,PN
--,Assy_Length_Inches
--,Comm1
--,Comm2
--,Comm3
--,Comm4
--,Comm5
--,Comm6
--,Comm7
--,Comm8
--,Comp1
--,Comp1_Comm
--,Comp1_Qty
--,Comp2
--,Comp2_Comm
--,Comp2_Qty
--,Comp3
--,Comp3_Comm
--,Comp3_Qty
--,Comp4
--,Comp4_Comm
--,Comp4_Qty
--,Comp5
--,Comp5_Comm
--,Comp5_Qty
--,Comp6
--,Comp6_Comm
--,Comp6_Qty
--,Comp7
--,Comp7_Comm
--,Comp7_Qty
--,Comp8
--,Comp8_Comm
--,Comp8_Qty
--From dbo.hose_PDC_HoseUPD
--;

--Truncates and Populates dbo.ref_PDC_Assy_BOM and dbo.ref_PDC_Assy_COM tables using the dbo.hose_PDC_HoseUPD table.
--Once SSR 90473 is implemented the ASSYBOM.TXT and ASSYCOM.TXT files will be sent to \\ap4pdc\qdls\M30913. 
--It will no longer be necessary to send the HOSEUPD.TXT upload file to \\ap40dc\qdls.
--Kits may also be added to the dbo.assy_BOM_PDC and dbo.assy_COM_PDC tables via a separate process and uploaded with the M30913 menu  option.
--A process is still needed to export the tables to \\ap4pdc\qdls\M30913 on a nightly basis.
--The export format is as follows:
	--ASSYBOM.TXT  
	--	W3ABRD         3A         TEXT('BRAND')               
	--	W3AOPC         1A         TEXT('ASSY OPT CD')         
	--	W3APRT        12A         TEXT('PARENT PART#')        
	--	W3ATYP         4A         TEXT('ASSEMBLY TYPE')       
	--	W3ALTH        16A         TEXT('PARENT PART LENGTH')  
	--	W3AVND         5A         TEXT('VENDOR')              
	--	W3ACMP        12A         TEXT('COMPONENT PART#')     
	--	W3AQTY        16A         TEXT('COMPONENT QTY')       
	--	W3ACUT        16A         TEXT('CUT VALUE IN INCHES') 
	--	W3ACMT        30A         TEXT('COMPONENT COMMENT')   
	--	W3ARDT         8A         TEXT('REVISION DATE CYMD')  
	--	W3AFL1         8A         TEXT('FILLER')              
	--ASSYCOM.TXT
	--	W3BPRT        12A         TEXT('ASSEMBLY PART')  
	--	W3BFL1         2A         TEXT('FILLER')         
	--	W3BCMT        30A         TEXT('COMMENT')        
	--	W3BFL2        15A         TEXT('FILLER')  



--Adds all hose and chain assembly comments from dbo.hose_PDC_HoseUPD into dbo.assy_BOM_PDC

Truncate Table dbo.ref_PDC_Assy_BOM;

--Adds all hose and chain assembly component details from dbo.hose_PDC_HoseUPD into dob.assy_BOM_PDC

With c1 As
(
Select Upper(Left(Brand,3)) As BRAND
,Alt_Build As ALT_BUILD
,Left(PN,12) As PARENT_PN
,'HOSE' As PART_TYPE
,Assy_Length_Inches As ASSY_LENGTH
,'04160' As VENDOR
,Comp1 As COMP
,Comp1_Qty As COMP_QTY
,Comp1_CutTo As COMP_CUT_TO
,Comp1_Comm As COMP_COMM
,Rev_Date As REV_DT 
From dbo.hose_PDC_HoseUPD
Where Comp1 Is Not Null
)

,c2 As
(
Select Upper(Left(Brand,3)) As BRAND
,Alt_Build As ALT_BUILD
,Left(PN,12) As PARENT_PN
,'HOSE' As PART_TYPE
,Assy_Length_Inches As ASSY_LENGTH
,'04160' As VENDOR
,Comp2 As COMP
,Comp2_Qty As COMP_QTY
,Null As COMP_CUT_TO
,Comp2_Comm As COMP_COMM
,Rev_Date As REV_DT 
From dbo.hose_PDC_HoseUPD
Where Comp2 Is Not Null
)

,c3 As
(
Select Upper(Left(Brand,3)) As BRAND
,Alt_Build As ALT_BUILD
,Left(PN,12) As PARENT_PN
,'HOSE' As PART_TYPE
,Assy_Length_Inches As ASSY_LENGTH
,'04160' As VENDOR
,Comp3 As COMP
,Comp3_Qty As COMP_QTY
,Null As COMP_CUT_TO
,Comp3_Comm As COMP_COMM
,Rev_Date As REV_DT 
From dbo.hose_PDC_HoseUPD
Where Comp3 Is Not Null
)

,c4 As
(
Select Upper(Left(Brand,3)) As BRAND
,Alt_Build As ALT_BUILD
,Left(PN,12) As PARENT_PN
,'HOSE' As PART_TYPE
,Assy_Length_Inches As ASSY_LENGTH
,'04160' As VENDOR
,Comp4 As COMP
,Comp4_Qty As COMP_QTY
,Comp4_CutTo As COMP_CUT_TO
,Comp4_Comm As COMP_COMM
,Rev_Date As REV_DT 
From dbo.hose_PDC_HoseUPD
Where Comp4 Is Not Null
)

,c5 As
(
Select Upper(Left(Brand,3)) As BRAND
,Alt_Build As ALT_BUILD
,Left(PN,12) As PARENT_PN
,'HOSE' As PART_TYPE
,Assy_Length_Inches As ASSY_LENGTH
,'04160' As VENDOR
,Comp5 As COMP
,Comp5_Qty As COMP_QTY
,Null As COMP_CUT_TO
,Comp5_Comm As COMP_COMM
,Rev_Date As REV_DT 
From dbo.hose_PDC_HoseUPD
Where Comp5 Is Not Null
)

,c6 As
(
Select Upper(Left(Brand,3)) As BRAND
,Alt_Build As ALT_BUILD
,Left(PN,12) As PARENT_PN
,'HOSE' As PART_TYPE
,Assy_Length_Inches As ASSY_LENGTH
,'04160' As VENDOR
,Comp6 As COMP
,Comp6_Qty As COMP_QTY
,Null As COMP_CUT_TO
,Comp6_Comm As COMP_COMM
,Rev_Date As REV_DT 
From dbo.hose_PDC_HoseUPD
Where Comp6 Is Not Null
)

,c7 As
(
Select Upper(Left(Brand,3)) As BRAND
,Alt_Build As ALT_BUILD
,Left(PN,12) As PARENT_PN
,'HOSE' As PART_TYPE
,Assy_Length_Inches As ASSY_LENGTH
,'04160' As VENDOR
,Comp7 As COMP
,Comp7_Qty As COMP_QTY
,Null As COMP_CUT_TO
,Comp7_Comm As COMP_COMM
,Rev_Date As REV_DT 
From dbo.hose_PDC_HoseUPD
Where Comp7 Is Not Null
)

,c8 As
(
Select Upper(Left(Brand,3)) As BRAND
,Alt_Build As ALT_BUILD
,Left(PN,12) As PARENT_PN
,'HOSE' As PART_TYPE
,Assy_Length_Inches As ASSY_LENGTH
,'04160' As VENDOR
,Comp8 As COMP
,Comp8_Qty As COMP_QTY
,Null As COMP_CUT_TO
,Comp8_Comm As COMP_COMM
,Rev_Date As REV_DT 
From dbo.hose_PDC_HoseUPD
Where Comp8 Is Not Null
)

,a As
(
Select *
From c1
Union
Select *
From c2
Union
Select *
From c3
Union
Select *
From c4
Union
Select *
From c5
Union
Select *
From c6
Union
Select *
From c7
Union
Select *
From c8
)

Insert Into dbo.ref_PDC_Assy_BOM
Select BRAND
,ALT_BUILD
,PARENT_PN
,PART_TYPE
,ASSY_LENGTH
,VENDOR
,COMP
,COMP_QTY
,COMP_CUT_TO
,COMP_COMM
,REV_DT 
--Into dbo.ref_PDC_Assy_BOM
From a
Order By PARENT_PN
;

--Add assembly comments

Truncate Table dbo.ref_PDC_Assy_Com;

With t1 As
(
Select Left(PN,12) As PARENT_PN
	  ,'01' As SEQ
	  ,Comm1 As COMM
From dbo.hose_PDC_HoseUPD
Where Comm1 Is Not Null
)
,t2 As
(
Select Left(PN,12) As PARENT_PN
	  ,'02' As SEQ
	  ,Comm2 As COMM
From dbo.hose_PDC_HoseUPD
Where Comm2 Is Not Null
)
,t3 As
(
Select Left(PN,12) As PARENT_PN
	  ,'03' As SEQ
	  ,Comm3 As COMM
From dbo.hose_PDC_HoseUPD
Where Comm3 Is Not Null
)
,t4 As
(
Select Left(PN,12) As PARENT_PN
	  ,'04' As SEQ
	  ,Comm4 As COMM
From dbo.hose_PDC_HoseUPD
Where Comm4 Is Not Null
)
,t5 As
(
Select Left(PN,12) As PARENT_PN
	  ,'05' As SEQ
	  ,Comm5 As COMM
From dbo.hose_PDC_HoseUPD
Where Comm5 Is Not Null
)
,t6 As
(
Select Left(PN,12) As PARENT_PN
	  ,'06' As SEQ
	  ,Comm6 As COMM
From dbo.hose_PDC_HoseUPD
Where Comm6 Is Not Null
)
,t7 As
(
Select Left(PN,12) As PARENT_PN
	  ,'07' As SEQ
	  ,Comm7 As COMM
From dbo.hose_PDC_HoseUPD
Where Comm7 Is Not Null
)
,t8 As
(
Select Left(PN,12) As PARENT_PN
	  ,'08' As SEQ
	  ,Comm8 As COMM
From dbo.hose_PDC_HoseUPD
Where Comm8 Is Not Null
)

,t As
(
Select *
From t1
Union
Select *
From t2
Union
Select *
From t3
Union
Select *
From t4
Union
Select *
From t5
Union
Select *
From t6
Union
Select *
From t7
Union
Select *
From t8
)

Insert Into dbo.ref_PDC_Assy_Com
Select PARENT_PN
	  ,SEQ
	  ,COMM
--Into dbo.ref_PDC_Assy_Com
From t
Order By PARENT_PN
;


-----Part 1B Creates table used to make BULKUPD.txt

Truncate Table dbo.hose_PDC_BulkUpd;

--Gets Hyster Bulk PNs
With m AS
(
Select [Bulk HPN] AS PN
	  ,Min([Bulk Cut To-# IN]) AS [Min_Cut_Lngth]
FROM dbo.hose_Detail
Group By [Bulk HPN]
Having [Bulk HPN]>''
)

Insert Into  dbo.hose_PDC_BulkUpd
Select Distinct m.PN
	  ,CAST(m.Min_Cut_Lngth AS Numeric (10,2)) AS Min_Cut_Lngth
From m
Left Join dbo.hose_PDC_BulkUpd u
On m.PN=u.PN
Where u.PN Is Null
;

--Gets Yale Bulk PNs
With m AS
(
Select [Bulk YPN] AS PN
	  ,Min([Bulk Cut To-# IN]) AS [Min_Cut_Lngth]
FROM dbo.hose_Detail
Group By [Bulk YPN]
Having [Bulk YPN]>''
)

Insert Into  dbo.hose_PDC_BulkUpd
Select Distinct m.PN
	  ,CAST(m.Min_Cut_Lngth AS Numeric (10,2)) AS Min_Cut_Lngth
From m
Left Join dbo.hose_PDC_BulkUpd u
On m.PN=u.PN
Where u.PN Is Null
;

----Uncomment this section with SPN implementation
----Gets SPN Bulk PNs
--With m AS
--(
--Select Distinct [Bulk #] AS PN
--	  ,Min([Bulk Cut To-# IN]) AS [Min_Cut_Lngth]
--FROM dbo.hose_Detail
--Group By [Bulk #]
--Having [Bulk #]>''
--)

--Insert Into  dbo.hose_PDC_BulkUpd
--Select m.PN
--	  ,CAST(m.Min_Cut_Lngth AS Numeric (10,2)) AS Min_Cut_Lngth
--From m
--Left Join dbo.hose_PDC_BulkUpd u
--On m.PN=u.PN
--Where u.PN Is Null
--;

-----Part 1C Creates table used to make SHORDUPD.txt

Truncate Table dbo.hose_PDC_ShOrdUpd;

-----Adds bulk chain and type to ShOrdUpd

--Gets Hyster Bulk PNs
With bh AS
(
SELECT DISTINCT 
	Case
		When Len(b.HPN)=4
		Then '000'+b.HPN 
		When Len(b.HPN)=5
		Then '00'+b.HPN
		When Len(b.HPN)=6
		Then '0'+b.HPN
		End AS PN
  ,'C' AS [TYPE]
  --,Null AS FILLER
FROM dbo.chain_BOM bom
Join dbo.chain_Bulk b
On Bulk_PN=b.PN
WHERE b.HPN>'' And b.HPN <>'NONE'
)

--Gets Yale Bulk PNs
,[by] AS
(
SELECT DISTINCT 
	Case
		When Len(b.YPN)=9
		Then 'Y'+b.YPN
		Else b.YPN
		End AS PN
  ,'C' AS [TYPE]
  --,Null AS FILLER
FROM dbo.chain_BOM bom
Join dbo.chain_Bulk b
On Bulk_PN=b.PN
WHERE b.YPN>'' And b.YPN <>'NONE'
)

----Uncomment with SPN implementation
----Gets SPN Bulk PNs
--,bspn AS
--(
--SELECT DISTINCT [Bulk_PN] AS PN
--  ,'C' AS [TYPE]
--  --,Null AS FILLER
--FROM dbo.chain_BOM
--WHERE Bulk_PN>'' And Bulk_PN <>'NONE'
--)

,b As
(
--Gets Hyster Bulk PNs
Select * From bh
Union 
--Gets Yale Bulk PNs
Select * From [by]
----Uncommment the following with the Single PN implementation
--Union
--Gets SPN Bulk PNs
--Select * From bspn
)

INSERT INTO dbo.hose_PDC_ShOrdUpd (PN, [Type])
Select Distinct b.PN
 , b.[Type]
 --, b.FILLER
From b
Where b.PN>''
;

-----Adds Hyster bulk hose and type to ShOrdUpd
With h AS
(
SELECT DISTINCT 
	Case
		When Len(HPN)=4
		Then '000'+ HPN 
		When Len(HPN)=5
		Then '00'+ HPN 
		When Len(HPN)=6
		Then '0'+ HPN 
		Else HPN
		End AS PN
  ,'B' AS [TYPE]
  --,Null AS FILLER
FROM dbo.hose_Bulk
WHERE HPN>'' 
And HPN<>'NONE'
And HPN<>'CANCELLED'
And HPN Is Not Null
)
INSERT INTO dbo.hose_PDC_ShOrdUpd (PN, [Type])
Select h.PN
 , h.[Type]
 --, h.FILLER
From h
Left Join dbo.hose_PDC_ShOrdUpd s
On h.PN=s.PN
Where s.PN Is Null
;

-----Adds Yale bulk hose and type to ShOrdUpd
With y AS
(
SELECT DISTINCT 
	Case
		When Len(YPN)=7
		Then 'Y00'+ YPN
		When Len(YPN)=8
		Then 'Y0'+ YPN
		When Len(YPN)=9
		Then 'Y'+ YPN
		Else YPN
		End AS PN
  ,'B' AS [TYPE]
  --,Null AS FILLER
FROM dbo.hose_Bulk
WHERE YPN>'' 
And YPN<>'NONE'
And YPN<>'CANCELLED'
And YPN Is Not Null
)

INSERT INTO dbo.hose_PDC_ShOrdUpd (PN, [Type])
Select y.PN
 , y.[Type]
 --, y.FILLER
From y
Left Join dbo.hose_PDC_ShOrdUpd s
On y.PN=s.PN
Where s.PN Is Null
;

----Uncomment with SPN implementation
-------Adds SPN bulk hose and type to ShOrdUpd
--With spn AS
--(
--SELECT DISTINCT PN
--  ,'B' AS [TYPE]
--  --,Null AS FILLER
--FROM dbo.hose_Bulk
--WHERE PN<>'' 
--And PN<>'NONE'
--And PN<>'CANCELLED'
--And PN Is Not Null
--)
--INSERT INTO dbo.hose_PDC_ShOrdUpd (PN, [Type])
--Select spn.PN
--  ,spn.[Type]
-- --, spn.FILLER
--From spn
--Left Join dbo.hose_PDC_ShOrdUpd s
--On spn.PN=s.PN
--Where s.PN Is Null
--;

-----Adds Parts Master bulk items (CHNS) and type to ShOrdUpd not in DB
With p AS 
(
SELECT DISTINCT 
   Case
		When Part_No Like ' %'
		Then Right(Part_NO,7)
		Else Part_No
		End AS PN
  ,Case
		When Part_Desc Like '%CHAIN%'
		Then 'C'
		Else 'B'
		End AS [Type]
  --,Null AS FILLER
FROM dbo.pdc_Part_Master
WHERE Part_Type Like '%CHNS%' 
)
INSERT INTO dbo.hose_PDC_ShOrdUpd (PN, [Type])
Select p.PN
 , p.[Type]
 --, p.FILLER
From p
Left Join dbo.hose_PDC_ShOrdUpd s
On p.PN=s.PN
Where s.PN Is Null
;

-----Adds HoseUpd bulk and type to ShOrdUpd while excluding alternate build records with alpha suffixes on assembly PNs

With e As --Records to exclude
(
Select [Prod #]
  From [dbo].[hose_Detail]
  Where [Prod #] Like '%TEST%'
  Or Right([Prod #],1) Like '%A'
  Or Right([Prod #],1) Like '%L'
  Or Right([Prod #],1) Like '%M'
  Or Right([Prod #],1) Like '%P'
  Or Right([Prod #],1) Like '%Z'
)

,hu AS
(
SELECT DISTINCT u.[Brand]
      ,[Alt_Build]
      ,[Rev_Date]
      --,u.[PN]
	  ,b1.[HPN]
	  ,b1.[Type] AS HPN_TYPE
	  ,b2.[YPN]
	  ,b2.[Type] AS YPN_TYPE 
	,Case
		When u.Brand='HYSTER' And Len(u.PN)=4
		Then '000'+u.PN
		When u.Brand='HYSTER' And Len(u.PN)=5
		Then '00'+ u.PN
		When u.Brand='HYSTER' And Len(u.PN)=6
		Then '0'+ u.PN
		When u.Brand='YALE' And Left(u.PN,1)<>'Y' And Left(u.PN,1)<>'S' And (Len(u.PN)=9 Or Len(u.PN)=10 Or Len(u.PN)=11)
		Then 'Y'+ u.PN
		Else u.PN
		End AS PN
		--From Access...Part_Num: IIf([HOSEUPD]![TRUCK BRAND]="HYSTER" And Len([HOSEUPD]![PART #])=5,"00"+[HOSEUPD]![PART #],IIf([HOSEUPD]![TRUCK BRAND]="HYSTER" And Len([HOSEUPD]![PART #])=6,"0"+[HOSEUPD]![PART #],IIf([HOSEUPD]![TRUCK BRAND]="YALE" And Left([HOSEUPD]![PART #],1)<>"Y" And Left([HOSEUPD]![PART #],1)<>"S" And (Len([HOSEUPD]![PART #])=9 Or Len([HOSEUPD]![PART #])=10 Or Len([HOSEUPD]![PART #])=11),"Y"+[HOSEUPD]![PART #],[HOSEUPD]![PART #])))
		,b1.PN AS b1PN
		,b2.PN AS b2PN
	,Case 
		When b1.[TYPE] Is Null And b2.[TYPE] Is Null
		Then 'C'
		When u.Brand='HYSTER' And b1.[TYPE] Is Not Null
		Then Case
			When b1.[Left_Ftg_Qty]=2
			Then 'T'
			When b1.[TYPE]='HO' Or b1.[TYPE]='NA'
			Then 'B'
			When b1.[TYPE]='PC' Or b1.[TYPE]='PL' Or b1.[TYPE]='PR'
			Then 'R'
			When b1.[TYPE]='PP'
			Then 'P'
			When b1.[TYPE]='FS'
			Then 'S'
			End
		When u.Brand='YALE' And b2.[TYPE] Is Not Null
		Then Case
			When b2.[Left_Ftg_Qty]=2
			Then 'T'
			When b2.[TYPE]='HO' Or b2.[TYPE]='NA'
			Then 'B'
			When b2.[TYPE]='PC' Or b2.[TYPE]='PL' Or b2.[TYPE]='PR'
			Then 'R'
			When b2.[TYPE]='PP'
			Then 'P'
			When b2.[TYPE]='FS'
			Then 'S'
			End
		End AS [as400TYPE]
		--From Access...TYPE_AS400: IIf([HOSE]![TYPE] Is Null And [HOSE_1]![TYPE] Is Null,"C",IIf([HOSEUPD]![TRUCK BRAND]="HYSTER" And [HOSE]![TYPE] Is Not Null,IIf([HOSE]![QTY-LT FTG]=2,"T",IIf([HOSE]![TYPE]="HO" Or [HOSE]![TYPE]="NA","B",IIf([HOSE]![TYPE]="PC" Or [HOSE]![TYPE]="PL" Or [HOSE]![TYPE]="PR","R",IIf([HOSE]![TYPE]="PP","P",IIf([HOSE]![TYPE]="FS","S"))))),IIf([HOSEUPD]![TRUCK BRAND]="YALE" And [HOSE_1]![TYPE] Is Not Null,IIf([HOSE_1]![QTY-LT FTG]=2,"T",IIf([HOSE_1]![TYPE]="HO" Or [HOSE_1]![TYPE]="NA","B",IIf([HOSE_1]![TYPE]="PC" Or [HOSE_1]![TYPE]="PL" Or [HOSE_1]![TYPE]="PR","R",IIf([HOSE_1]![TYPE]="PP","P",IIf([HOSE_1]![TYPE]="FS","S"))))))))
	,Case 
		When b1.[TYPE] Is Null And b2.[TYPE] Is Null
		Then 'CHAIN'
		When u.Brand='HYSTER' And b1.[TYPE] Is Not Null
		Then b1.[TYPE]
		When u.Brand='YALE' And b2.[TYPE] Is Not Null
		Then b2.[TYPE]
		End AS DB_Type
		--From Access...IIf([HOSE]![TYPE] Is Null And [HOSE_1]![TYPE] Is Null,"CHAIN",IIf([HOSEUPD]![TRUCK BRAND]="HYSTER" And [HOSE]![TYPE] Is Not Null,[HOSE]![TYPE],IIf([HOSEUPD]![TRUCK BRAND]="YALE" And [HOSE_1]![TYPE] Is Not Null,[HOSE_1]![TYPE])))
	,Right(b1.PN,1) AS Suffix_HYS
	--Right([HOSE]![PROD #],1)
	,Right(b2.PN,1) AS Suffix_YAL
	--Right([HOSE_1]![PROD #],1)
	------,Null AS FILLER
  FROM [dbo].[hose_PDC_HoseUpd] u
  LEFT JOIN [dbo].[hose_BOM] b1
  ON u.PN=b1.[HPN]
  Left Join e e1
  On b1.PN=e1.[Prod #]
  LEFT JOIN [dbo].[hose_BOM] b2
  ON u.PN=b2.[YPN]
  Left Join e e2
  On b2.PN=e2.[Prod #]
   --Filter out alternate build BOMS from records to exclude
  Where e1.[Prod #] Is Null And e2.[Prod #] Is Null
 )

 , f As
 (
 Select Distinct PN
	  ,as400TYPE AS [TYPE]
	  --,[FILLER]
 From hu
 Where as400TYPE Is Not Null 
 And as400TYPE>''
 And (DB_TYPE<>'CM' Or DB_TYPE Is NuLL)
)
INSERT INTO dbo.hose_PDC_ShOrdUpd (PN, [Type])
Select Distinct f.PN
 , f.[TYPE]
 --, f.FILLER
From f
Left Join dbo.hose_PDC_ShOrdUpd s
On f.PN=s.PN
Where s.PN Is Null
;

----Adds SPN HoseUpd bulk and type to ShOrdUpd while excluding alternate build records with alpha suffixes on assembly PNs

With e As --Records to exclude
(
Select [Prod #]
  From [dbo].[hose_Detail]
  Where [Prod #] Like '%TEST%'
  Or Right([Prod #],1) Like '%A'
  Or Right([Prod #],1) Like '%L'
  Or Right([Prod #],1) Like '%M'
  Or Right([Prod #],1) Like '%P'
  Or Right([Prod #],1) Like '%Z'
)

,hu AS
(
SELECT DISTINCT 'HYG' As [Brand]
      ,[Alt_Build]
      ,[Rev_Date]
	  ,u.PN
	  ,b.[Type] AS PN_TYPE
		--From Access...Part_Num: IIf([HOSEUPD]![TRUCK BRAND]="HYSTER" And Len([HOSEUPD]![PART #])=5,"00"+[HOSEUPD]![PART #],IIf([HOSEUPD]![TRUCK BRAND]="HYSTER" And Len([HOSEUPD]![PART #])=6,"0"+[HOSEUPD]![PART #],IIf([HOSEUPD]![TRUCK BRAND]="YALE" And Left([HOSEUPD]![PART #],1)<>"Y" And Left([HOSEUPD]![PART #],1)<>"S" And (Len([HOSEUPD]![PART #])=9 Or Len([HOSEUPD]![PART #])=10 Or Len([HOSEUPD]![PART #])=11),"Y"+[HOSEUPD]![PART #],[HOSEUPD]![PART #])))
	,Case 
		When b.[TYPE] Is Null
		Then 'C'
		When b.[TYPE] Is Not Null And b.[Left_Ftg_Qty]=2
		Then 'T'
		When b.[TYPE] Is Not Null And b.[Left_Ftg_Qty]<>2 And (b.[TYPE]='HO' Or b.[TYPE]='NA')
		Then 'B'
		When b.[TYPE] Is Not Null And b.[Left_Ftg_Qty]<>2 And b.[TYPE]<>'HO'And b.[TYPE]<>'NA' And (b.[TYPE]='PC' Or b.[TYPE]='PL' Or b.[TYPE]='PR')
		Then 'R'
		When b.[TYPE] Is Not Null And b.[Left_Ftg_Qty]<>2 And b.[TYPE]<>'HO'And b.[TYPE]<>'NA' And b.[TYPE]<>'PC' And b.[TYPE]<>'PL' And b.[TYPE]<>'PR' And b.[TYPE]='PP'
		Then 'P'
		When b.[TYPE] Is Not Null And b.[Left_Ftg_Qty]<>2 And b.[TYPE]<>'HO'And b.[TYPE]<>'NA' And b.[TYPE]<>'PC' And b.[TYPE]<>'PL' And b.[TYPE]<>'PR' And b.[TYPE]<>'PP'And b.[TYPE]='FS'
		Then 'S'
		Else ''
		End AS as400TYPE
		--From Access...TYPE_AS400: IIf([HOSE]![TYPE] Is Null And [HOSE_1]![TYPE] Is Null,"C",IIf([HOSEUPD]![TRUCK BRAND]="HYSTER" And [HOSE]![TYPE] Is Not Null,IIf([HOSE]![QTY-LT FTG]=2,"T",IIf([HOSE]![TYPE]="HO" Or [HOSE]![TYPE]="NA","B",IIf([HOSE]![TYPE]="PC" Or [HOSE]![TYPE]="PL" Or [HOSE]![TYPE]="PR","R",IIf([HOSE]![TYPE]="PP","P",IIf([HOSE]![TYPE]="FS","S"))))),IIf([HOSEUPD]![TRUCK BRAND]="YALE" And [HOSE_1]![TYPE] Is Not Null,IIf([HOSE_1]![QTY-LT FTG]=2,"T",IIf([HOSE_1]![TYPE]="HO" Or [HOSE_1]![TYPE]="NA","B",IIf([HOSE_1]![TYPE]="PC" Or [HOSE_1]![TYPE]="PL" Or [HOSE_1]![TYPE]="PR","R",IIf([HOSE_1]![TYPE]="PP","P",IIf([HOSE_1]![TYPE]="FS","S"))))))))
	,Case 
		When b.[TYPE] Is Null
		Then 'CHAIN'
		When u.Brand='HYG' And b.[TYPE] Is Not Null
		Then b.[TYPE]
		End AS DB_Type
		--From Access...IIf([HOSE]![TYPE] Is Null And [HOSE_1]![TYPE] Is Null,"CHAIN",IIf([HOSEUPD]![TRUCK BRAND]="HYSTER" And [HOSE]![TYPE] Is Not Null,[HOSE]![TYPE],IIf([HOSEUPD]![TRUCK BRAND]="YALE" And [HOSE_1]![TYPE] Is Not Null,[HOSE_1]![TYPE])))
	,Right(RTrim(b.PN),1) AS Suffix
	--Right([HOSE]![PROD #],1)
	------,Null AS FILLER
  FROM [dbo].[hose_PDC_HoseUpd] u
  LEFT JOIN [dbo].[hose_BOM] b
  ON u.PN=b.[PN]
  Left Join e
  On b.PN=e.[Prod #]
     --Filter out alternate build BOMS from records to exclude
  Where e.[Prod #] Is Null
 )

 , f As
 (
 Select Distinct PN
	  ,as400TYPE AS [TYPE]
	  --,[FILLER]
 From hu
 Where as400TYPE Is Not Null 
 And as400TYPE>''
 And (DB_TYPE<>'CM' Or DB_TYPE Is NuLL)
)
INSERT INTO dbo.hose_PDC_ShOrdUpd (PN, [Type])
Select Distinct f.PN
 , f.[TYPE]
 --, f.FILLER
From f
Left Join dbo.hose_PDC_ShOrdUpd s
On f.PN=s.PN
Where s.PN Is Null
;

-----Part 1D Creates tables used to make O/Neil Files:
----------------HOSE.txt
----------------BULK.txG
----------------FTG.txt
----------------CHAIN.txt

-----------Gets Hyster PNs to O'Neil Hose

Truncate Table dbo.hose_BOM_ONeil;

With eh As --Records to exclude
(
Select [Prod #]
  From [dbo].[hose_Detail]
  Where [HYS #] Like '%TEST%'
  Or [HYS #] Like '%NONE%'
  Or [HYS #] Is Null
  Or [Comp1 HYS]='UNKNOWN'
  Or [Comp1 HYS]='CANCELLED'
  Or [ASM L-# IN] Is Null
  Or [LT FTG]='UNKNOWN' 
  Or [LT FTG]='CANCELLED' 
  Or [RT FTG]='UNKNOWN' 
  Or [RT FTG]='CANCELLED' 
  Or [PRINT OR CHART REQ]='YES'
  Or [Type]='CM'
  Or [Type]='NA'
  Or [Type]='UK'
  Or [Type]='MH'
  Or [Type]='PS'
  Or [Type]=''
  Or [Type]Is Null
)

, h As
(
Select Distinct 'HYSTER' As [TRUCK BRAND]
, VENDOR
, Case
	When dh.[PROD #] Like '%[A-Z]%'
	Then [HYS #] + Right(dh.[PROD #],1)
	Else [HYS #]
	End As [PART #]
, [TOT LENGTH]
, [COMM1 HYS] As COMM1
, [COMM2 HYS] As COMM2
, COMM3
, COMM4
, COMM5
, COMM6
, COMM7
, [Comp1 HYS] As [BULK #]
, [COMP1 COMM]
, [COMP2 HYS] As [COMP2]
, [COMP2 HYS COMM] As [COMP2 COMM]
, [COMP2 QTY]
, [COMP3 HYS] As [COMP3]
, [COMP3 HYS COMM] As [COMP3 COMM]
, [COMP3 QTY]
, [COMP4 HYS] As [COMP4]
, [COMP4 COMM]
, [COMP4 QTY]
From [dbo].[hose_Detail] dh
Left Join eh
On dh.[Prod #]=eh.[Prod #]
Where eh.[Prod #] Is Null
)
-----------Gets Yale PNs to O'Neil Hose
, ey As --Records to exclude
(
Select [Prod #]
  From [dbo].[hose_Detail]
  Where [YAL #] Like '%TEST%'
  Or [YAL #] Like '%NONE%'
  Or [YAL #] Is Null
  Or [Comp1 HYS]='UNKNOWN'
  Or [Comp1 HYS]='CANCELLED'
  Or [ASM L-# IN] Is Null
  Or [LT FTG]='UNKNOWN' 
  Or [LT FTG]='CANCELLED' 
  Or [RT FTG]='UNKNOWN' 
  Or [RT FTG]='CANCELLED' 
  Or [PRINT OR CHART REQ]='YES'
  Or [Type]='CM'
  Or [Type]='NA'
  Or [Type]='UK'
  Or [Type]='MH'
  Or [Type]='PS'
  Or [Type]=''
  Or [Type]Is Null
)

, y As
(
Select Distinct 'YALE' As [TRUCK BRAND]
, VENDOR
, Case
	When dy.[PROD #] Like '%[A-Z]%'
	Then [YAL #] + Right(dy.[PROD #],1)
	Else [YAL #]
	End As [PART #]
, [TOT LENGTH]
, [COMM1 YAL] As [COMM1]
, [COMM2 YAL] As [COMM2]
, COMM3
, COMM4
, COMM5
, COMM6
, COMM7
, [Comp1 YAL] AS [BULK #]
, [COMP1 COMM]
, [COMP2 YAL] As [COMP2]
, [COMP2 YAL COMM] As [COMP2 COMM]
, [COMP2 QTY]
, [COMP3 YAL] As [COMP3]
, [COMP3 YAL COMM] As [COMP3 COMM]
, [COMP3 QTY]
, [COMP4 YAL] As [COMP4]
, [COMP4 COMM]
, [COMP4 QTY]
From [dbo].[hose_Detail] dy
Left Join ey
On dy.[Prod #]=ey.[Prod #]
Where ey.[Prod #] Is Null
)
-----------Combines Hyster and Yale records
, u As
(
Select *
From h
Union
Select *
From y
)
-----------Adds Hyster and Yale Hose records to the O'Neil hose table to be exported 

Insert Into dbo.hose_BOM_ONeil
( 
  [TRUCK BRAND]
, [HOSE BRAND]
, [PART #]
, [TOT LENGTH]
, COMM1
, COMM2
, COMM3
, COMM4
, COMM5
, COMM6
, COMM7
, [BULK #]
, [BULK COMM]
, FTG1
, [FTG1 COMM]
, [FTG1 QTY]
, FTG2
, [FTG2 COMM]
, [FTG2 QTY]
, [GUARD #]
, [GUARD COMM]
, [GUARD QTY] 
)
Select Distinct 
[TRUCK BRAND]
, VENDOR
, [PART #]
, [TOT LENGTH]
, COMM1
, COMM2
, COMM3
, COMM4
, COMM5
, COMM6
, COMM7
, [BULK #]
, [COMP1 COMM]
, COMP2
, [COMP2 COMM]
, [COMP2 QTY]
, COMP3
, [COMP3 COMM]
, [COMP3 QTY]
, COMP4
, [COMP4 COMM]
, [COMP4 QTY]
From u
;

-----------BULK.txt
-----------Adds Hyster and Yale Bulk records to the O'Neil bulk table to be exported 

Truncate Table dbo.hose_Bulk_ONeil;

Insert Into dbo.hose_Bulk_ONeil
Select [PN] As [PROD #]
      ,[HPN] As [HYS #]
      ,[YPN] As [YAL #]
      ,[Desc] As [DESCRIPTION]
      ,[HCE]
      ,[Spec_No] As [SPEC NO]
      ,[ID]
      ,[Vendor]
      ,[VPN]
      ,[Series]
      ,[Crimp_FTG_Series] As [CRIMP FTG SERIES]
      ,[Reuse_FTG_Series] As [REUSE FTG SERIES]
      ,[Die_Req] As [DIE REQ]
      ,[VPN_Die] As [VPN DIE]
      ,[Ring_Req] As [RING REQ]
      ,[VPN_Ring] As [VPN RING]
      ,[Initials] 
      ,Replace(Convert(Varchar(10),[DATE],101),'-','/')+' '+FORMAT([DATE],'hh:mm:ss') As Date
      ,[Stocked]
      ,[Comments]
      ,[Opt_Vendor] As [OPT VENDOR #]
From dbo.hose_Bulk
Where Vendor Like '%park%' Or Vendor Like '%syn%'
;

-----------FTG.txt
-----------Adds Hyster and Yale Fitting records to the O'Neil fitting table to be exported 

Truncate Table dbo.hose_Fitting_ONeil;

Insert Into dbo.hose_Fitting_ONeil
Select
PN As [PROD #]
, HPN AS [HYS #]
, YPN As [YAL #]
, SERIES
, VENDOR
, VPN
, VPN_Pusher As [VPN PUSHER]
, [Desc] As [DESCRIPTION]
, [THREAD/FLANGE]
, Hose_ID As [HOSE ID]
, Hose_Type As [HOSE TYPE]
, COA
, Base_PN As [BASE PN]
, [PERM/REUSE]
, REF
, INITIALS
, Replace(Convert(Varchar(10),[DATE/TIME_STAMP],101),'-','/')+' '+FORMAT([DATE/TIME_STAMP],'hh:mm:ss') As DATE
, Replace(Convert(Varchar(10),[DATE/TIME_STAMP],101),'-','/')+' '+FORMAT([DATE/TIME_STAMP],'hh:mm:ss') As [DATE&TIME STAMP]
, [Opt_Vendor_PN] As [OPT VENDOR #] 
From dbo.hose_Fitting
--Order By [PROD #]
;

-----------CHAIN.txt
-----------Adds Hyster and Yale Chain records to the O'Neil chain table to be exported 
Truncate Table dbo.Chain_BOM_ONeil;

--Gets Hyster chain BOMs

With e As --Records to exclude
(
Select PN
From dbo.Chain_Detail
Where PN Like '3%'
Or PN Like '%[A-Z]'
Or PN Like '%TEST%'
Or Assy_Length_Inches Is Null
Or Bulk_PN Is Null 
Or [Man_Add_AS400]='YES' 
Or [Print/Chart_Req]='YES'
Or CutTo_Inches Is Null
Or [Qty_Feet] Like '%BULK%' 
Or [Qty_Feet] Like '%ARK%' 
Or [Qty_Feet] Like '%NLA%' 
Or [Qty_Feet] Is Null 
Or PN='NONE'
)

, c As
(
Select 'HYS' AS [OEM]
, d.[HPN] As [PART #]
, d.Bulk_HPN As [BULK #]
, d.CutTo_Inches As [CUT TO - # IN]
, d.Qty_Links As [# OF LINKS]
, d.[STANDARD]
, d.Assy_Comments As [ASSEMBLY COMMENTS]
, d.Chain_Type As [CHAIN TYPE]
, d.Pin_Link_HPN As [PIN LINK #]
, d.Pin_Link_Qty As [QTY - PIN LINK]
, d.Outer_Link_HPN As [OUTER LINK #]
, d.Outer_Link_Qty As [OTY - OUTER LINK]
, d.Anchor_A_HPN As [ANCHOR A #]
, d.Anchor_A_Qty As [QTY - ANCHOR A]
, d.Anchor_B_HPN As [ANCHOR B #]
, d.Anchor_B_Qty As [QTY - ANCHOR B]
From dbo.Chain_Detail d
Left Join e
On d.PN=e.PN
Left Join dbo.Chain_BOM_ONeil o
On HPN=o.[Part #]
Where e.PN Is Null And o.[Part #] Is Null And d.HPN>'' And d.HPN<>'NONE'
)

Insert Into dbo.Chain_BOM_ONeil
Select Distinct * From c

;

--Gets Yale chain BOMs

With e As --Records to exclude
(
Select PN
From dbo.Chain_Detail
Where PN Like '3%'
Or PN Like '%[A-Z]'
Or PN Like '%TEST%'
Or Assy_Length_Inches Is Null
Or Bulk_PN Is Null 
Or [Man_Add_AS400]='YES' 
Or [Print/Chart_Req]='YES'
Or CutTo_Inches Is Null
Or [Qty_Feet] Like '%BULK%' 
Or [Qty_Feet] Like '%ARK%' 
Or [Qty_Feet] Like '%NLA%' 
Or [Qty_Feet] Is Null 
)
, c As
(
Select 'YAL' AS [OEM]
, d.[YPN] As [PART #]
, d.Bulk_YPN As [BULK #]
, d.CutTo_Inches As [CUT TO - # IN]
, d.Qty_Links As [# OF LINKS]
, d.[STANDARD]
, d.Assy_Comments As [ASSEMBLY COMMENTS]
, d.Chain_Type As [CHAIN TYPE]
, d.Pin_Link_YPN As [PIN LINK #]
, d.Pin_Link_Qty As [QTY - PIN LINK]
, d.Outer_Link_YPN As [OUTER LINK #]
, d.Outer_Link_Qty As [OTY - OUTER LINK]
, d.Anchor_A_YPN As [ANCHOR A #]
, d.Anchor_A_Qty As [QTY - ANCHOR A]
, d.Anchor_B_YPN As [ANCHOR B #]
, d.Anchor_B_Qty As [QTY - ANCHOR B]
From dbo.Chain_Detail d
Left Join e
On d.PN=e.PN
Left Join dbo.Chain_BOM_ONeil o
On YPN=o.[Part #]
Where e.PN Is Null And o.[Part #] Is Null And d.YPN>'' And d.YPN<>'NONE'
)

Insert Into dbo.Chain_BOM_ONeil
Select Distinct * From c

;

----Uncomment this section with SPN implementation
----Gets SPN chain BOMs

--With e As --Records to exclude
--(
--Select PN
--From dbo.Chain_Detail
--Where PN Like '3%'
--Or PN Like '%[A-Z]'
--Or PN Like '%TEST%'
--Or Assy_Length_Inches Is Null
--Or Bulk_PN Is Null 
--Or [Man_Add_AS400]='YES' 
--Or [Print/Chart_Req]='YES'
--Or CutTo_Inches Is Null
--Or [Qty_Feet] Like '%BULK%' 
--Or [Qty_Feet] Like '%ARK%' 
--Or [Qty_Feet] Like '%NLA%' 
--Or [Qty_Feet] Is Null 
--)

--,c As
--(
--Select 'HYG' AS [OEM]
--, [PN] As [PART #]
--, Bulk_PN As [BULK #]
--, CutTo_Inches As [CUT TO - # IN]
--, Qty_Links As [# OF LINKS]
--, d.[STANDARD]
--, Assy_Comments As [ASSEMBLY COMMENTS]
--, Chain_Type As [CHAIN TYPE]
--, Pin_Link_PN As [PIN LINK #]
--, Pin_Link_Qty As [QTY - PIN LINK]
--, Outer_Link_PN As [OUTER LINK #]
--, Outer_Link_Qty As [OTY - OUTER LINK]
--, Anchor_A_PN As [ANCHOR A #]
--, Anchor_A_Qty As [QTY - ANCHOR A]
--, Anchor_B_PN As [ANCHOR B #]
--, Anchor_B_Qty As [QTY - ANCHOR B]
--From dbo.Chain_Detail d
--Left Join e
--On d.PN=e.PN
--Left Join dbo.Chain_BOM_ONeil o
--On HPN=o.[Part #]
--Where e.PN Is Null And o.[Part #] Is Null And d.PN>'' And d.PN<>'NONE'
--)

--Insert Into dbo.Chain_BOM_ONeil
--Select * From c


---- =============================================
--Part 2 Populates the Global Hose SQL tables (Shared Bulk Material, Shared Fittings and Shared Hose)
---- =============================================


--Truncates and poppulates the global Shared Bulk Material table

Truncate Table [Hose_Global].[dbo].[Shared BULK MATERIAL];

Insert Into [Hose_Global].[dbo].[Shared BULK MATERIAL]
SELECT RIGHT(RTRIM(LTRIM([PN])),12) AS [PROD #]
	  ,[HPN] AS [[HYS #]
      ,LEFT([YPN],12) AS [YAL #]
      ,[Desc] AS [DESCRIPTION]
      ,[ID]
      ,[Vendor]
      ,[VPN]
      ,[HCE]
	  ,[Spec_No] AS [SPEC NO]
	  ,[Series]
      ,[Crimp_FTG_Series] AS [CRIMP FTG SERIES]
      ,[Reuse_FTG_Series] AS [REUSE FTG SERIES]
      ,[Die_Req] AS [DIE REQ]
      ,[VPN_Die] AS [VPN DIE]
      ,[Ring_Req] AS [RING REQ]
	  ,[VPN_Ring] AS [VPN RING]
	  ,[Opt_Vendor] AS [OPT VENDOR #]
      ,[Date] AS[APPEND DATE]
    FROM [AMData].[dbo].[hose_Bulk] b
    WHERE ID Is Not Null And (b.Vendor='PARKER' Or b.Vendor='SYNFLEX' Or b.Vendor='ZEC' Or b.Vendor='GATES') 
	AND (b.[Desc] Like 'BULK HOSE%') 
	--AND PN='003041500'
	AND LEN(RTRIM(LTRIM(PN)))<13
ORDER BY b.[PN]
;

--Truncates and poppulates the global Shared Fittings table

Truncate Table [Hose_Global].[dbo].[Shared Fittings];

INSERT INTO [Hose_Global].[dbo].[Shared FITTINGS]
SELECT RIGHT(RTRIM(LTRIM([PN])),12) AS [PROD #]
	  ,HPN AS[HYS #]
	  ,YPN AS [YAL #]
	  ,[Desc] AS [DESCRIPTION]
	  ,VENDOR
	  ,VPN
	  ,Hose_ID AS [HOSE ID]
	  ,Ferrule_PN AS [FERRULE PROD #]
	  ,Ferrule_HPN AS [FERRULE HYS #]
	  ,Ferrule_YPN AS [FERRULE YAL #]
	  ,[THREAD/FLANGE]
	  ,SERIES
	  ,VPN_Pusher AS [VPN PUSHER]
	  ,Hose_Type AS [HOSE TYPE]
	  ,COA
	  ,[Base_PN] AS [BASE PN]
	  ,[PERM/REUSE]
	  ,[Opt_Vendor_PN] AS [OPT VENDOR #]
	  ,[Date] AS [APPEND DATE]
    FROM [AMData].[dbo].[hose_Fitting] f
	WHERE LEN(RTRIM(LTRIM(PN)))<13
ORDER BY f.[PN]
;

--Truncates and poppulates the global Shared Hose table

Truncate Table [Hose_Global].[dbo].[Shared Hose];

Insert Into [Hose_Global].[dbo].[Shared Hose]
Select RIGHT(RTRIM(LTRIM([PROD #])),12) AS [PROD #]
                  ,[HYS #]
                  ,LEFT([YAL #],12) AS [YAL #]
                  ,[Vendor]
                  ,[Type]
                  ,[Asm L-# IN]
                  ,[Bulk #]
                  ,[Bulk L-# IN]
                  ,[Split Info]
                  ,[Die PN]  AS Die
                  ,[Ring PN] AS Ring
                  ,[Print or Chart Req] AS [Print Req]
                  ,[Print or Chart]
                  ,Null AS Requirements
                  ,[Restrictions]
                  ,[FTG1]
                  ,[FTG1 Qty]
                  ,[FTG1 Comm]
                  ,[FTG2]
                  ,[FTG2 Qty]
                  ,[FTG2 Comm]
                  ,[Ferrule1]
                  ,[Ferrule1 Qty]
                  ,[Ferrule2]
                  ,[Ferrule2 Qty]
                  ,[Guard #]
                  ,[Tot Grd Cut To-# IN] AS [Cut To-Grd # IN]
                  ,[Guard Comm]
                  ,[Grd Placemt-# IN] AS [Guard Placement]
                  ,[Origin Date] AS [APPEND DATE]
From [AMDATA].[dbo].[hose_Detail] hd
ORDER BY hd.[PROD #]
;


GO
