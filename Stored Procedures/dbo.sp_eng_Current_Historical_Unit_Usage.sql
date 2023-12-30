SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE Procedure [dbo].[sp_eng_Current_Historical_Unit_Usage] as

--************************************************************************
--                            AMData
--***********************************************************************
-- =============================================
--Author: Newell, R
--Date: 2021-12-01
--Purpose: Get current usgage for picklist dbo.inp_Picklist_Current_Historical_Unit_Usage.  Results to be added to dbo.res_Current_Unit_Usage_pl.
--Modification notes: 
--
--
-- =============================================



-----------------------------------------
---Step 1
-----------------------------------------

Truncate table wrk_PN_Reverse_Structure_Row;

with t1 as 
(Select distinct ref.PN from dbo.inp_Picklist_Current_Historical_Unit_Usage ref
join eng_Product_Structure eps
on ref.pn = eps.Comp )

insert into wrk_PN_Reverse_Structure_Row 
select
ROW_NUMBER() OVER ( ORDER BY t1.PN) AS RowNum
, t1.PN
From t1;

-----------------------------------------
---Step 2
-----------------------------------------

exec sp_wrk_Reverse_Product_Structure_Current_Historical;

-----------------------------------------
---Step 3
-----------------------------------------

Truncate Table res_eng_Current_Historical_Unit_Usage;

With ld As
(
Select PN
	  ,Max(Rel_Dt) AS Last_ECN_Dt
From eng_Part_ECN_History eh
Group by PN
)

, t1 as
(
Select rps.Init_PN
	  ,rps.Qty
	  ,rps.ID
	  ,rps.Level
	  ,rps.PN
	  ,pm.[Status] PN_Status
	  ,Case
		When pm.[Status]='CAN'
		Then ld.Last_ECN_Dt 
		Else Null
		End As CAN_Dt
	  ,eps.[ECN] PN_ECN
      ,eps.[Seq] PN_PS_Seq
      ,eps.[Status] PN_PS_Status
      ,eps.[ECN_Add_Dt] PN_PS_ADD_Dt
      ,eps.[ECN_Rem_Dt] PN_PS_REM_Dt
	  ,rps.Parent
      ,udl.[ECN] Paremt_PS_ECN
      ,udl.[Seq] Parent_PS_Seq
      ,udl.[Status] Parent_PS_Status
      ,udl.[ECN_Add_Dt] Parent_PS_ADD_Dt
      ,udl.[ECN_Rem_Dt] Parent_PS_REM_Dt
	  ,udl.[Unit]
	  ,udl.[Contract]
      ,udl.[Div]
  From [dbo].[eng_Unit_Div_ML_GL] udl
  Join dbo.wrk_Part_Reverse_Structure rps
  On udl.PN=rps.Parent
  Join eng_Product_Structure eps
  On rps.PN = eps.Comp And udl.PN =  eps.PN 
  Join eng_Part_Master pm
  On rps.PN = pm.PN
  Left Join ld
  On rps.PN = ld.PN
  Where udl.[Test_Status]='' 
 )

Insert into res_eng_Current_Historical_Unit_Usage
Select t1.*
--Into res_eng_Current_Historical_Unit_Usage
From t1


GO
