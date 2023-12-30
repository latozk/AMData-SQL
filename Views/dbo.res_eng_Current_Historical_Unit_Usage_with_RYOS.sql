SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE View [dbo].[res_eng_Current_Historical_Unit_Usage_with_RYOS] As

With q1 As
(
Select u.Init_PN As PN
      ,Qty
	  ,p.[Status] AS PN_Status
	  ,Case
		When p.[Status]='CAN'
		Then e.ADM_Appr_Dt
		Else Null
		End As PN_CAN_Dt
	  ,u.ID AS Part_Parent_Path
      ,u.[Level] As Col
      ,u.PN As Parent
      ,u.PN_Status As Parent_Status
      ,u.CAN_Dt As Parent_Cancel_Dt
      ,u.PN_PS_ECN As Parent_PS_ECN
      ,u.PN_PS_Seq As Parent_PS_Seq
      ,u.PN_PS_Status As Parent_PS_Status
      ,u.PN_PS_ADD__Dt As Parent_PS_ADD_Dt
      ,u.PN_PS_REM_Dt As Parent_PS_REM_Dt
      ,u.Parent AS List
      ,u.Parent_PS_ECN As List_PS_ECN
      ,u.Parent_PS_Seq As List_PS_Seq
      ,u.Parent_PS_Status As List_PS_Status
      ,u.Parent_PS_ADD__Dt  As List_PS_ADD_Dt
      ,u.Parent_PS_REM_Dt  As List_PS_REM_Dt
      ,u.Unit
      ,u.[Contract]
      ,u.Div
	  ,Case
		When p.[Status]='CAN' And ([Class]=2 Or [Class]=3)
		Then DateAdd("yyyy",7,e.ADM_Appr_Dt)
		When p.[Status]='CAN' And [Group]='BT'
		Then DateAdd("yyyy",15,e.ADM_Appr_Dt)
		Else DateAdd("yyyy",10,e.ADM_Appr_Dt)
		End As d1 --SupptThruByCancelation --when PN was canceled
	  ,Case
		When [Class]=2 Or [Class]=3
		Then DateAdd("yyyy",7,u.CAN_Dt)
		When [Group]='BT'
		Then DateAdd("yyyy",15,u.CAN_Dt)
		Else DateAdd("yyyy",10,u.CAN_Dt)
		End As d2 --SupptThruByParentCancelation --when parent was canceled
	  ,Case
		When [Class]=2 Or [Class]=3
		Then DateAdd("yyyy",7,u.PN_PS_REM_Dt)
		When [Group]='BT'
		Then DateAdd("yyyy",15,u.PN_PS_REM_Dt)
		Else DateAdd("yyyy",10,u.PN_PS_REM_Dt)
		End As d3 --SupptThruByPartRemovalFromParent --when part was removed from its parent part
	  ,Case
		When [Class]=2 Or [Class]=3
		Then DateAdd("yyyy",7,u.Parent_PS_REM_Dt)
		When [Group]='BT'
		Then DateAdd("yyyy",15,u.Parent_PS_REM_Dt)
		Else DateAdd("yyyy",10,u.Parent_PS_REM_Dt)
		End As d4 --SupptThruByRemovalFromParentList --when part's parent part was removed from list 
	  ,Case
		When [Class]=2 Or [Class]=3
		Then DateAdd("yyyy",7,s.Last_Build_Dt)
		When [Group]='BT'
		Then DateAdd("yyyy",15,s.Last_Build_Dt)
		Else DateAdd("yyyy",10,s.Last_Build_Dt)
		End As d5  --SupptThruByUnitLastBuildDt
  From [dbo].[res_eng_Current_Historical_Unit_Usage] u
  Left Join ref_Unit s
  On u.Unit=s.Unit
  Left Join dbo.eng_Part_Master p
  On u.Init_PN=p.PN
  Left Join dbo.eng_ECN e
  On p.ECN=e.ECN
)

,q2 As
(
Select PN
      ,Qty
	  ,PN_Status
	  ,PN_CAN_Dt
	  ,Part_Parent_Path
      ,Col
      ,Parent
      ,Parent_Status
      ,Parent_Cancel_Dt
      ,Parent_PS_ECN
      ,Parent_PS_Seq
      ,Parent_PS_Status
      ,Parent_PS_ADD_Dt
      ,Parent_PS_REM_Dt
      ,List
      ,List_PS_ECN
      ,List_PS_Seq
      ,List_PS_Status
      ,List_PS_ADD_Dt
      ,List_PS_REM_Dt
      ,Unit
      ,[Contract]
      ,Div
	  --d1 --SupptThruByCancelation --when PN was canceled
	  --d2 --SupptThruByParentCancelation --when parent was canceled
	  --d3 --SupptThruByPartRemovalFromParent --when part was removed from its parent part
	  --d4 --SupptThruByRemovalFromParentList --when part's parent part was removed from list 
	  --d5 --SupptThruByUnitLastBuildDt --when unit went out of production
	  ,d1 As SupptThruByCancelation
	  ,d2 As SupptThruByParentCancelation
	  ,d3 As SupptThruByPartRemovalFromParent
	  ,d4 As SupptThruByRemovalFromParentList
	  ,d5 As SupptThruByUnitLastBuildDt
	  ,(Select Min(v) 
	  From (Values (d1),(d2),(d3),(d4),(d5)) As Value (v)) As SupportThruDt  
From q1
)

,q3 As
(
Select PN
      ,Qty
	  ,PN_Status
	  ,PN_CAN_Dt
	  ,Part_Parent_Path
      ,Col
      ,Parent
      ,Parent_Status
      ,Parent_Cancel_Dt
      ,Parent_PS_ECN
      ,Parent_PS_Seq
      ,Parent_PS_Status
      ,Parent_PS_ADD_Dt
      ,Parent_PS_REM_Dt
      ,List
      ,List_PS_ECN
      ,List_PS_Seq
      ,List_PS_Status
      ,List_PS_ADD_Dt
      ,List_PS_REM_Dt
      ,Unit
      ,[Contract]
      ,Div
	  ,SupptThruByCancelation
	  ,SupptThruByParentCancelation
	  ,SupptThruByPartRemovalFromParent
	  ,SupptThruByRemovalFromParentList
	  ,SupptThruByUnitLastBuildDt
	  ,SupportThruDt  
	  ,Case
		When SupportThruDt<GetDate()
		Then Cast((0-DateDiff(Year,SupportThruDt,GetDate())) As Numeric (4,1))
		Else Cast((DateDiff(Year,SupportThruDt,GetDate())) As Numeric (4,1))
		End As Part_Unit_RYOS
From q2
)

,q4 As
(
Select PN
	  ,Max(Part_Unit_RYOS) As RYOS
From q3
Group By PN
)

Select q3.PN
      ,Qty
	  ,PN_Status
	  ,PN_CAN_Dt
	  ,Part_Parent_Path
      ,Col
      ,Parent
      ,Parent_Status
      ,Parent_Cancel_Dt
      ,Parent_PS_ECN
      ,Parent_PS_Seq
      ,Parent_PS_Status
      ,Parent_PS_ADD_Dt
      ,Parent_PS_REM_Dt
      ,List
      ,List_PS_ECN
      ,List_PS_Seq
      ,List_PS_Status
      ,List_PS_ADD_Dt
      ,List_PS_REM_Dt
      ,Unit
      ,[Contract]
      ,Div
	  ,SupptThruByCancelation
	  ,SupptThruByParentCancelation
	  ,SupptThruByPartRemovalFromParent
	  ,SupptThruByRemovalFromParentList
	  ,SupptThruByUnitLastBuildDt
	  ,SupportThruDt  
	  ,Part_Unit_RYOS
	  ,RYOS 
From q3
Join q4
On q3.PN=q4.PN














--PN
--      ,ID
--      ,[Level]
--      ,PN
--      ,PN_Status
--      ,CAN_Dt
--      ,PN_PS_ECN
--      ,PN_PS_Seq
--      ,PN_PS_Status
--      ,PN_PS_ADD__Dt
--      ,PN_PS_REM_Dt
--      ,Parent
--      ,Parent_PS_ECN
--      ,Parent_PS_Seq
--      ,Parent_PS_Status
--      ,Parent_PS_ADD__Dt
--      ,Parent_PS_REM_Dt
--      ,u.Unit
--      ,[Contract]
--      ,Div
--	  ,d1
--	  ,d2
--	  ,d3
--	  ,d4
--From q1
--GO


--A	SupptThruByCancelation: IIf([Class]=2 Or [Class]=3,DateAdd("yyyy",7,[CAN_Dt]),IIf([Group]='BT',DateAdd("yyyy",15,[CAN_Dt]),DateAdd("yyyy",10,[CAN_Dt])))

--B	SupptThruByRemovalFromParent:  IIf([Class]=2 Or [Class]=3,DateAdd("yyyy",7,[PN_PS_REM_Dt]),IIf([Group]='BT',DateAdd("yyyy",15,[PN_PS_REM_Dt]),DateAdd("yyyy",10,[PN_PS_REM_Dt])))

--C	SupptThruByRemovalFromParentList: IIf([Class]=2 Or [Class]=3,DateAdd("yyyy",7,[Parent_PS_REM_Dt]),IIf([Group]='BT',DateAdd("yyyy",15,[Parent_PS_REM_Dt]),DateAdd("yyyy",10,[Parent_PS_REM_Dt])))

--D	SupptThruByUnitLastBuildDt: IIf([Class]=2 Or [Class]=3,DateAdd("yyyy",7,[Last_Build_Dt]),IIf([Group]='BT',DateAdd("yyyy",15,[Last_Build_Dt]),DateAdd("yyyy",10,[Last_Build_Dt])))



GO
