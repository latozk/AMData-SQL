SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




--2022-09-06 added 3 lines of code due to Comm1, Comm1 Hys and Comm1 Yal not showing die information due to Null values in the Die Color field.



CREATE View [dbo].[zhose_Detail_20221128] as

With v as
(
SELECT Origin_Date As [Origin Dt]
,Maint_Date AS [Maint Dt]
,Left(HOSE.Origin_Date,4)+Right(Left(HOSE.Origin_Date,7),2)+Right(HOSE.Origin_Date,2) AS [Origin Date]
,Left(HOSE.Maint_Date,4)+Right(Left(HOSE.Maint_Date,7),2)+Right(HOSE.Maint_Date,2) AS [Maint Date]
,Left(HOSE.Initials,3) AS Initials
,Left(HOSE.[Type],2) AS [Type]
,[BULK].Vendor
,Left(HOSE.PN,16) AS [Prod #]
,Left(HOSE.HPN,12) AS [Hys #]
,Left(HOSE.YPN,12) AS [Yal #]
,HOSE.Assy_Length_IN AS [Asm L-# IN]
,[Assy_Length_IN]*25.4 AS [Asm L-# MM Not Rounded]
,Cast((Round(([Assy_Length_IN]*25.4),0)) AS Int) AS [Rounded Asm L-# MM]
,Cast([Assy_Length_IN] AS Varchar) + ' INCHES' AS [Tot Length]
,Left(HOSE.Bulk_PN,12) AS [Bulk #]
,Left(HOSE.Bulk_PN,12) AS Comp1
,Left([BULK].[HPN],12) AS [Bulk HPN]
,Left([BULK].[HPN],12) AS [Comp1 HYS]
,Left([BULK].[YPN],12) AS [Bulk YPN]
,Left([BULK].[YPN],12) AS [Comp1 YAL]
,[Assy_Length_IN]-(FTG.COA+FTG_1.COA) AS [Bulk Cut To-# IN]
,Cast(Round(([Assy_Length_IN]-(FTG.COA+FTG_1.COA)),2) AS Decimal(10,2)) AS [Rounded Bulk Cut To-# IN]
,Cast(Round(([Assy_Length_IN]-(FTG.COA+FTG_1.COA)),2) AS Decimal(10,2)) AS [Bulk L-# IN]
,Cast(Round(([Assy_Length_IN]-(FTG.COA+FTG_1.COA)),2) AS Decimal(10,2)) AS [Comp1 CUT TO]
,([Assy_Length_IN]-(FTG.COA+FTG_1.COA))*25.4 AS [Bulk Cut To-# MM Not Rounded]
,Cast(Round((([Assy_Length_IN]-(FTG.COA+FTG_1.COA))*25.4),0)AS Decimal(10,2)) AS [Rounded Bulk Cut To-# MM]
,Case
	When (([Assy_Length_IN]-(FTG.COA+FTG_1.COA))/12)-Cast((([Assy_Length_IN]-(FTG.COA+FTG_1.COA))/12) As Int)>0
	Then 1+Cast((([Assy_Length_IN]-(FTG.COA+FTG_1.COA))/12) As Int)
	Else Cast((([Assy_Length_IN]-(FTG.COA+FTG_1.COA))/12) As Int)
	End As [Bulk-# FT]
,Case
	When (([Assy_Length_IN]-(FTG.COA+FTG_1.COA))/12)-Cast((([Assy_Length_IN]-(FTG.COA+FTG_1.COA))/12) As Int)>0
	Then 1+Cast((([Assy_Length_IN]-(FTG.COA+FTG_1.COA))/12) As Int)
	Else Cast((([Assy_Length_IN]-(FTG.COA+FTG_1.COA))/12) As Int)
	End As [Comp1 Qty]
,Case
	When HOSE.[Type]='MH'
	Then'MOLDED_HOSE'
	When Cast(Round(([Assy_Length_IN]-(FTG.COA+FTG_1.COA)),2) AS Decimal(10,2)) Is Null
	Then Null
	Else Left('CUT ' + Cast(Cast(Round(([Assy_Length_IN]-(FTG.COA+FTG_1.COA)),2) AS Decimal(10,2)) As Varchar) + ' IN',30)
	End As [Bulk Comm]
,Case
	When HOSE.[Type]='MH'
	Then'MOLDED_HOSE'
	When Cast(Round(([Assy_Length_IN]-(FTG.COA+FTG_1.COA)),2) AS Decimal(10,2)) Is Null
	Then Null
	Else Left('CUT ' + Cast(Cast(Round(([Assy_Length_IN]-(FTG.COA+FTG_1.COA)),2) AS Decimal(10,2)) As Varchar) + ' IN',30)
	End As [Comp1 Comm]
,Left([Tool - DIE].PN,12) As [Die PN]
,Left([Tool - DIE].HPN,12) As [Die HPN]
,Left([Tool - DIE].YPN,12) As [Die YPN]
,[Tool - DIE].Color As [Die Color]
,Case
	When [BULK].[DIE_REQ]='NO' Or HOSE.[TYPE]='PR' Or HOSE.[TYPE]='PL' Or HOSE.[TYPE]='HO'
	Then 'DIE NOT REQUIRED'
	--2022-09-06 added the following 2 lines
	When [Tool - DIE].Color is Null
	Then Left('DIE' + ' ' + [Tool - DIE].PN,30)
	Else Left('DIE' + ' ' + [Tool - DIE].PN + ' ' + [Tool - DIE].Color,30)
	End As Comm1
,Case
	When [BULK].[DIE_REQ]='NO' Or HOSE.[TYPE]='PR' Or HOSE.[TYPE]='PL' Or HOSE.[TYPE]='HO'
	Then 'DIE NOT REQUIRED'
	When [Tool - DIE].Color is Null
	--2022-09-06 added the following 2 lines
	Then Left('DIE' + ' ' + [Tool - DIE].HPN,30)
	Else Left('DIE' + ' ' + [Tool - DIE].HPN + ' ' + [Tool - DIE].Color,30)
	End As [Comm1 Hys] 
,Case
	When [BULK].[DIE_REQ]='NO' Or HOSE.[TYPE]='PR' Or HOSE.[TYPE]='PL' Or HOSE.[TYPE]='HO'
	Then 'DIE NOT REQUIRED'
	--2022-09-06 added the following 2 lines
	When [Tool - DIE].Color is Null
	Then Left('DIE' + ' ' + [Tool - DIE].YPN,30)
	Else Left('DIE' + ' ' + [Tool - DIE].YPN + ' ' + [Tool - DIE].Color,30)
	End As [Comm1 Yal]
,Left([Tool - RING].PN,30) As [Ring PN] 
,Left([Tool - RING].HPN,30) As [Ring HPN] 
,Left([Tool - RING].YPN,30) As [Ring YPN]  
,[Tool - RING].COLOR As [Ring Color]
,Case
	When [Bulk].[RING_REQ]='NO' Or HOSE.[Type]='PR' Or HOSE.[Type]='PL' Or HOSE.[Type]='HO'
	Then 'RING NOT REQUIRED'
	Else Left('RING' + ' ' + [Tool - RING].[PN] + ' ' + [Tool - RING].Color,30)
	End As Comm2
,Case
	When [Bulk].[RING_REQ]='NO' Or HOSE.[Type]='PR' Or HOSE.[Type]='PL' Or HOSE.[Type]='HO'
	Then 'RING NOT REQUIRED'
	Else Left('RING' + ' ' + [Tool - RING].[HPN] + ' ' + [Tool - RING].Color,30)
	End As [Comm2 Hys]
,Case
	When [Bulk].[RING_REQ]='NO' Or HOSE.[Type]='PR' Or HOSE.[Type]='PL' Or HOSE.[Type]='HO'
	Then 'RING NOT REQUIRED'
	Else Left('RING' + ' ' + [Tool - RING].[YPN] + ' ' + [Tool - RING].Color,30)
	End As [Comm2 Yal]
,Left(HOSE.[Left_Ftg_PN],30) As [Lt Ftg]
--,FTG.HPN 
--,FTG.YPN 
,Left([Tool - PUSHER].PN,30) As [Left Ftg Pusher PN]
,Left([Tool - PUSHER].HPN,30) As [Left Ftg Pusher HPN]
,Left([Tool - PUSHER].YPN,30) As [Left Ftg Pusher YPN]
,HOSE.Left_Ftg_Qty As [Qty-Lt Ftg] 
,Case
	When Left_Ftg_PN='NONE'
	Then Null
	Else Left_Ftg_PN
	End As Ftg1
,Case
	When Left_Ftg_PN='NONE'
	Then Null
	Else Left_Ftg_PN
	End As Comp2
,Case
	When FTG.HPN='NONE'
	Then Null
	Else FTG.HPN
	End As [Ftg1 Hys #]
,Case
	When FTG.HPN='NONE'
	Then Null
	Else FTG.HPN
	End As [Comp2 Hys]
,Case
	When FTG.YPN='NONE'
	Then Null
	Else FTG.YPN
	End As [Ftg1 Yal #]
,Case
	When FTG.YPN='NONE'
	Then Null
	Else FTG.YPN 
	End As [Comp2 Yal]
,Case
	When Right_Ftg_PN=Left_Ftg_PN
	Then Left_Ftg_Qty+Right_Ftg_Qty
	Else Left_Ftg_Qty
	End As [Ftg1 Qty]
,Case
	When Right_Ftg_PN=Left_Ftg_PN
	Then Left_Ftg_Qty+Right_Ftg_Qty
	Else Left_Ftg_Qty
	End As [Comp2 Qty] 
,Left(Guard_Placement_Inches,30) As [Grd Placemt-# IN]
,Left(Guard_Cut_Comments,30) As [Grd Cut Comments]
,Case
	When Left_Ftg_PN='NONE'
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER].PN,30)
	When FTG.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'LH_FTG'
	When FTG.VPN_Pusher Is Null And ((Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%') And Guard_Placement_Inches Not Like '%RT%') And ((Split_Info Is Null Or Split_Info Not Like '%LT%') And Split_Info Not Like '%RT%')
	Then Null
	When FTG.[VPN_Pusher] Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('LH FTG - USE PUSHER ' + [Tool - PUSHER].[PN],30)
	Else LEft('USE PUSHER ' + [Tool - PUSHER].PN,30)
	End As [Ftg1 Comm]
,Case
	When Left_Ftg_PN='NONE'
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER].PN,30)
	When FTG.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'LH_FTG'
	When FTG.VPN_Pusher Is Null And ((Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%') And Guard_Placement_Inches Not Like '%RT%') And ((Split_Info Is Null Or Split_Info Not Like '%LT%') And Split_Info Not Like '%RT%')
	Then Null
	When FTG.[VPN_Pusher] Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('LH FTG - USE PUSHER ' + [Tool - PUSHER].[PN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER].PN,30)
	End As  [Comp2 Comm]
,Case
	When Left_Ftg_PN='NONE'
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER].HPN,30)
	When FTG.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'LH_FTG'
	When FTG.VPN_Pusher Is Null And ((Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%') And Guard_Placement_Inches Not Like '%RT%') And ((Split_Info Is Null Or Split_Info Not Like '%LT%') And Split_Info Not Like '%RT%')
	Then Null
	When FTG.[VPN_Pusher] Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('LH FTG - USE PUSHER ' + [Tool - PUSHER].[HPN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER].HPN,30)
	End As [Ftg1 Hys Comm]
,Case
	When Left_Ftg_PN='NONE'
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER].HPN,30)
	When FTG.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'LH_FTG'
	When FTG.VPN_Pusher Is Null And ((Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%') And Guard_Placement_Inches Not Like '%RT%') And ((Split_Info Is Null Or Split_Info Not Like '%LT%') And Split_Info Not Like '%RT%')
	Then Null
	When FTG.[VPN_Pusher] Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('LH FTG - USE PUSHER ' + [Tool - PUSHER].[HPN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER].HPN,30)
	End As [Comp2 Hys Comm]
,Case
	When Left_Ftg_PN='NONE'
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER].YPN,30)
	When FTG.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'LH_FTG'
	When FTG.VPN_Pusher Is Null And ((Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%') And Guard_Placement_Inches Not Like '%RT%') And ((Split_Info Is Null Or Split_Info Not Like '%LT%') And Split_Info Not Like '%RT%')
	Then Null
	When FTG.[VPN_Pusher] Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('LH FTG - USE PUSHER ' + [Tool - PUSHER].[YPN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER].YPN,30)
	End As [Ftg1 Yal Comm]
,Case
	When Left_Ftg_PN='NONE'
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER].YPN,30)
	When FTG.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'LH_FTG'
	When FTG.VPN_Pusher Is Null And ((Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%') And Guard_Placement_Inches Not Like '%RT%') And ((Split_Info Is Null Or Split_Info Not Like '%LT%') And Split_Info Not Like '%RT%')
	Then Null
	When FTG.[VPN_Pusher] Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('LH FTG - USE PUSHER ' + [Tool - PUSHER].[YPN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER].YPN,30)
	End As [Comp2 Yal Comm]
,Left(HOSE.Right_Ftg_PN,12) As [Rt Ftg] 
,Left([Tool - PUSHER_1].PN,12) As [Right Ftg Pusher PN]
,Left([Tool - PUSHER_1].HPN,12) As [Right Ftg Pusher Hys]
,Left([Tool - PUSHER_1].YPN,12) As [Right Ftg Pusher Yal]
,HOSE.Right_Ftg_Qty As [Qty-Rt Ftg] 
,Case
	When Right_Ftg_PN=Left_Ftg_PN Or Right_Ftg_PN='NONE'
	Then Null
	Else Left(Right_Ftg_PN,12)
	End As Ftg2 
,Case
	When Right_Ftg_PN=Left_Ftg_PN Or Right_Ftg_PN='NONE'
	Then Null
	Else Left(Right_Ftg_PN,12)
	End As Comp3
,Case
	When Right_Ftg_PN=Left_Ftg_PN Or Right_Ftg_PN='NONE'
	Then Null
	Else Left(FTG_1.[HPN],12)
	End As [Ftg2 Hys #]
,Case
	When Right_Ftg_PN=Left_Ftg_PN Or Right_Ftg_PN='NONE'
	Then Null
	Else Left(FTG_1.[HPN],12)
	End As [Comp3 Hys]
,Case
	When Right_Ftg_PN=Left_Ftg_PN Or Right_Ftg_PN='NONE'
	Then Null
	Else Left(FTG_1.[YPN],12)
	End As [Ftg2 Yal #] 
,Case
	When Right_Ftg_PN=Left_Ftg_PN Or Right_Ftg_PN='NONE'
	Then Null
	Else Left(FTG_1.[YPN],12)
	End As [Comp3 Yal] 
,Case
	When Right_Ftg_PN=Left_Ftg_PN
	Then Null
	Else Right_Ftg_Qty
	End As [Ftg2 Qty]
,Case
	When Right_Ftg_PN=Left_Ftg_PN
	Then Null
	Else Right_Ftg_Qty
	End As  [Comp3 Qty]
,Case
	When Left_Ftg_PN=Right_Ftg_PN
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER_1].[PN],30)
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'RH FTG'
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%' And Guard_Placement_Inches Not Like '%RT%') And (Split_Info Is Null Or Split_Info Not Like '%LT%' And Split_Info Not Like '%RT%')
	Then Null
	When FTG_1.VPN_Pusher Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%') Or (Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('RH FTG – USE PUSHER ' + [Tool - PUSHER_1].[PN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER_1].[PN],30)
	End As [Ftg2 Comm]
,Case
	When Left_Ftg_PN=Right_Ftg_PN
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER_1].[PN],30)
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'RH FTG'
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%' And Guard_Placement_Inches Not Like '%RT%') And (Split_Info Is Null Or Split_Info Not Like '%LT%' And Split_Info Not Like '%RT%')
	Then Null
	When FTG_1.VPN_Pusher Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%') Or (Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('RH FTG – USE PUSHER ' + [Tool - PUSHER_1].[PN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER_1].[PN],30)	
	End As [Comp3 Comm]
,Case
	When Left_Ftg_PN=Right_Ftg_PN
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER_1].[HPN],30)
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'RH FTG'
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%' And Guard_Placement_Inches Not Like '%RT%') And (Split_Info Is Null Or Split_Info Not Like '%LT%' And Split_Info Not Like '%RT%')
	Then Null
	When FTG_1.VPN_Pusher Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%') Or (Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('RH FTG – USE PUSHER ' + [Tool - PUSHER_1].[HPN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER_1].[HPN],30)
	End As [Ftg2 Hys Comm]
,Case
	When Left_Ftg_PN=Right_Ftg_PN
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER_1].[HPN],30)
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'RH FTG'
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%' And Guard_Placement_Inches Not Like '%RT%') And (Split_Info Is Null Or Split_Info Not Like '%LT%' And Split_Info Not Like '%RT%')
	Then Null
	When FTG_1.VPN_Pusher Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%') Or (Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('RH FTG – USE PUSHER ' + [Tool - PUSHER_1].[HPN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER_1].[HPN],30)
	End As [Comp3 Hys Comm]
,Case
	When Left_Ftg_PN=Right_Ftg_PN
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER_1].[YPN],30)
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'RH FTG'
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%' And Guard_Placement_Inches Not Like '%RT%') And (Split_Info Is Null Or Split_Info Not Like '%LT%' And Split_Info Not Like '%RT%')
	Then Null
	When FTG_1.VPN_Pusher Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%') Or (Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('RH FTG – USE PUSHER ' + [Tool - PUSHER_1].[YPN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER_1].[YPN],30)
	End As [Ftg2 Yal Comm] 
,Case
	When Left_Ftg_PN=Right_Ftg_PN
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Null
	Then Null
	When Left_Ftg_PN=Right_Ftg_PN And FTG_1.VPN_Pusher Is Not Null
	Then Left('USE PUSHER ' + [Tool - PUSHER_1].[YPN],30)
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%' Or Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then 'RH FTG'
	When FTG_1.VPN_Pusher Is Null And (Guard_Placement_Inches Is Null Or Guard_Placement_Inches Not Like '%LT%' And Guard_Placement_Inches Not Like '%RT%') And (Split_Info Is Null Or Split_Info Not Like '%LT%' And Split_Info Not Like '%RT%')
	Then Null
	When FTG_1.VPN_Pusher Is Not Null And (Guard_Placement_Inches Like '%LT%' Or Guard_Placement_Inches Like '%RT%') Or (Split_Info Like '%LT%' Or Split_Info Like '%RT%')
	Then Left('RH FTG – USE PUSHER ' + [Tool - PUSHER_1].[YPN],30)
	Else Left('USE PUSHER ' + [Tool - PUSHER_1].[YPN],30)
	End As [Comp3 Yal Comm]  
,Left(HOSE.Guard_PN,12) AS [Guard #]
,Left(HOSE.Guard_PN,12) AS Comp4 
--,BULK_1.HPN 
,Left(BULK_1.HPN,12) AS [Comp4 Hys] 
--,BULK_1.YPN 
,Left(BULK_1.YPN,12) AS [Comp4 Yal] 
,HOSE.Guard_Qty AS Grd_Qty 
,HOSE.Guard_Qty AS [Comp4 Qty] 
,HOSE.Tot_Guard_CutTo_Inches AS [Tot Grd Cut To-# IN]
,Round([Tot_Guard_CutTo_Inches]/12,2) AS [Tot Grd Cut To-# FT] 
,Round([Tot_Guard_CutTo_Inches],2) AS [Comp4 Cut To] 
,Left(HOSE.Guard_Cut_Comments,30) AS Guard_Cut_Comments
,Case
	When Guard_Placement_Inches Is Null
	Then Null
	Else Left('GUARD ' + Guard_Placement_Inches,30)
	End As Comm7
,Case
	When Guard_PN Is Null
	Then Null
	When Guard_PN Is Not Null And Guard_Cut_Comments Is Not Null
	Then Left('CUT ' + Cast(Guard_Cut_Comments As Varchar),30)
	Else Left('CUT ' + Cast(Tot_Guard_CutTo_Inches As Varchar) + ' IN',30)
	End As [Guard Comm] 
,Case
	When Guard_PN Is Null
	Then Null
	When Guard_PN Is Not Null And Guard_Cut_Comments Is Not Null
	Then Left('CUT ' + Cast(Guard_Cut_Comments As Varchar),30)
	Else Left('CUT ' + Cast(Tot_Guard_CutTo_Inches As Varchar) + ' IN',30)
	End As [Comp4 Comm] 
,Left(HOSE.[Print/Chart],12) As [Print Or Chart]
,Left(HOSE.[Print/Chart_Req_Yes/No],3) As [Print Or Chart Req]
,Case
	When [Print/Chart_Req_Yes/No]='YES'
	Then Left('MUST SEE PRINT ' + [Print/Chart],30)
	Else Null
	End As Comm3 
,Left(HOSE.Split_Info,30) As [Split Info]
,Case
	When Split_Info Is Null
	Then Null
	When Split_Info Not Like 'N:%' And Split_Info<>'AIR BLOW ONLY'
	Then Left('SPLIT ' + Split_Info,30)
	Else Left(Split_Info,30)
	End As Comm4
,Left(HOSE.Other_Req,30) AS [Other Req]
,Left(HOSE.Other_Req,30) AS Comm5 
,Left(HOSE.Restrictions,30) AS Restrictions
,Left(HOSE.Restrictions,30) AS Comm6 
,Case
	When [TYPE]='HO'
	Then 'HOSE ONLY - CAP OR PLUG ENDS'
	When [TYPE]='NA'
	Then Null
	When [TYPE]='MH'
	Then Null
	Else 'CAP OR PLUG ENDS'
	End As [Cap Or Plug]
,Case
	When [TYPE]='HO'
	Then 'HOSE ONLY - CAP OR PLUG ENDS'
	When [TYPE]='NA'
	Then Null
	When [TYPE]='MH'
	Then Null
	Else 'CAP OR PLUG ENDS'
	End As  Comm8 
,HOSE.Eng_Notes AS [Eng Notes]
,Left(FTG.Ferrule_PN,12) AS Ferrule1 
,Left(FTG.Ferrule_PN,12) AS Comp5 
,Left(FTG.Ferrule_HPN,12) AS [Ferrule1 Hys #] 
,Left(FTG.Ferrule_HPN,12) AS [Comp5 HYS] 
,Left(FTG.Ferrule_YPN,12) AS [Ferrule1 Yal #] 
,Left(FTG.Ferrule_YPN,12) AS [Comp5 YAL] 
,Case
	When [FTG].Ferrule_PN Is Null
	Then Null
	When [FTG].Ferrule_PN Is Not Null And [FTG_1].Ferrule_PN=[FTG].Ferrule_PN
	Then [Left_Ftg_Qty]+[Right_Ftg_Qty]
	Else [Left_Ftg_Qty]
	End As [Ferrule1 Qty] 
,Case
	When [FTG].Ferrule_PN Is Null
	Then Null
	When [FTG].Ferrule_PN Is Not Null And [FTG_1].Ferrule_PN=[FTG].Ferrule_PN
	Then [Left_Ftg_Qty]+[Right_Ftg_Qty]
	Else [Left_Ftg_Qty]
	End As [Comp5 Qty] 
,Case
	When [FTG_1].Ferrule_PN=[FTG].Ferrule_PN Or [FTG_1].Ferrule_PN Is Null
	Then Null
	Else Left([FTG_1].Ferrule_PN,12)
	End As Ferrule2 
,Case
	When [FTG_1].Ferrule_PN=[FTG].Ferrule_PN Or [FTG_1].Ferrule_PN Is Null
	Then Null
	Else Left([FTG_1].Ferrule_PN,12)
	End As Comp6 
,Case
	When [FTG_1].Ferrule_HPN=[FTG].Ferrule_HPN Or [FTG_1].Ferrule_HPN Is Null
	Then Null
	Else Left([FTG_1].Ferrule_HPN,12)
	End As [Ferrule2 Hys #]
,Case
	When [FTG_1].Ferrule_HPN=[FTG].Ferrule_HPN Or [FTG_1].Ferrule_HPN Is Null
	Then Null
	Else Left([FTG_1].Ferrule_HPN,12)
	End As [Comp6 Hys] 
,Case
	When [FTG_1].Ferrule_YPN=[FTG].Ferrule_YPN Or [FTG_1].Ferrule_YPN Is Null
	Then Null
	Else Left([FTG_1].Ferrule_YPN,12)
	End As [Ferrule2 Yal #] 
,Case
	When [FTG_1].Ferrule_YPN=[FTG].Ferrule_YPN Or [FTG_1].Ferrule_YPN Is Null
	Then Null
	Else Left([FTG_1].Ferrule_YPN,12)
	End As  [Comp6 Yal] 
,Case
	When [FTG_1].Ferrule_PN=[FTG].Ferrule_PN Or [FTG_1].Ferrule_PN Is Null
	Then Null
	Else [Right_Ftg_Qty]
	End As [Ferrule2 Qty] 
,Case
	When [FTG_1].Ferrule_PN=[FTG].Ferrule_PN Or [FTG_1].Ferrule_PN Is Null
	Then Null
	Else [Right_Ftg_Qty]
	End As [Comp6 Qty]


FROM hose_BOM AS HOSE
LEFT JOIN hose_Bulk AS BULK_1
ON HOSE.GUARD_PN = BULK_1.[PN]
LEFT JOIN dbo.hose_Bulk AS [BULK]
ON HOSE.Bulk_PN = [BULK].[PN]
LEFT JOIN dbo.hose_Die AS [Tool - DIE]
ON [BULK].VPN_Die = [Tool - DIE].VPN
LEFT JOIN dbo.hose_Ring AS [Tool - RING]
ON [BULK].VPN_Ring = [Tool - RING].VPN
LEFT JOIN dbo.hose_Fitting AS FTG
ON HOSE.Left_Ftg_PN = FTG.[PN]
LEFT JOIN dbo.hose_Pusher AS [Tool - PUSHER]
ON FTG.VPN_Pusher = [Tool - PUSHER].VPN and FTG.Vendor = [Tool - PUSHER].Vendor
LEFT JOIN dbo.hose_Fitting AS FTG_1
ON HOSE.Right_Ftg_PN = FTG_1.[PN]
LEFT JOIN dbo.hose_Pusher AS [Tool - PUSHER_1]
ON FTG_1.VPN_Pusher = [Tool - PUSHER_1].VPN and FTG_1.Vendor = [Tool - PUSHER_1].Vendor
Where (HOSE.[Type] Not like 'CM' and HOSE.[Type] Not like 'MI' and HOSE.[Type] Not like 'PS')
--Removed filter so alternate builds would appear in this view since this view is used as the source for records that are sent to O'Neil (all builds are to be sent to O'Neil)
--The filter below should be used to leave out records for the HoseUpd and ShOrdUpd tables.
--and (HOSE.PN Not Like '%A' and HOSE.PN Not Like '%L' and HOSE.PN Not Like '%M' and HOSE.PN Not Like '%P' and HOSE.PN Not Like '%Z' and HOSE.PN Not Like '%TEST%')
and (HOSE.Bulk_PN not like 'UNKNOWN' and HOSE.Bulk_PN not like 'NONE')
)
Select Distinct *
From v
GO
