SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE  Procedure [dbo].[zsp_Old_eng_NPO_Part_Dist_CORE_Records] as

--exec [sp_eng_Part_Dist_CORE_Update]

--************************************************************************
--                            AMData
--***********************************************************************
-- =============================================
--Author: Newell, R
--Date: 2022-02-21
--Purpose:Append Old records to eng_NPO_Part_Dist_CORE
--
--Last modified date: 202*07*23
--Modification notes: added Key_3 from eng_ecn_Tran 
-- =============================================
Declare @Loc varchar(3)

Set @Loc = 'NPO';
truncate table wrk_eng_Part_Dist_Core;
--Drop Table wrk_eng_Part_Dist_Core_RN;

With c As
(
Select Distinct u.Unit
      ,u.Contract
      ,u.Div
	  ,u.Status
      ,v.Name
      ,v.Type
	  ,d.loc
      ,u.Seq
      ,u.PN
      ,u.ECN_Add_Date
      ,u.ECN
      ,u.ECN_Rem_Date
      ,u.Test_Status
      ,u.Unit_Div
      ,u.ECN_Add_Dt
      ,u.ECN_Rem_Dt
  From dbo.eng_Unit_Div_ML_GL u
  Join dbo.eng_Div v
  On u.Div=v.Div
  Join dbo.eng_Unit_Dist d
  On u.Unit=d.Unit And u.Contract=d.Contract And u.Div=d.Div
  Left Join eng_NPO_Part_Dist_Agile a
  On  u.Unit=a.Unit And u.Contract=a.Contract And u.Div=a.Div
  Left Join eng_NPO_Part_Dist_Agile c
  On  u.Unit=c.Unit And u.Contract=c.Contract And u.Div=c.Div
  Where d.Loc='NPO'
  And u.Status='ADD'
  And u.Contract <>'MILT'
  And a.Unit Is Null And a.Contract Is Null And a.Div Is Null
  And c.Unit Is Null And c.Contract Is Null And c.Div Is Null
  And u.PN IN (Select PN FROM dbo.eng_Part_Master Where Type='L')
  --And   u.Unit = 'C114'
)
,
ec As
(
Select Unit
, contract
, div
, loc 
, PN
, '' as Component_PN
, '' as Structure
, Null as Col
From c
)

Insert Into wrk_eng_Part_Dist_CORE
Select Distinct * 
--Into wrk_eng_Part_Dist_CORE_RN
From ec
;


--_______________________
--**Step 2
--Get Product Structure of all Parts in wrk_end_Part_Dist_CORE and roll down parts up to same units as parents.
Truncate table wrk_PN_Structure_Row;

with t1 as 
(Select distinct ref.PN as List from wrk_eng_Part_Dist_CORE ref
join eng_Product_Structure eps
on ref.pn = eps.PN )

insert into wrk_PN_Structure_Row 
select
ROW_NUMBER() OVER ( ORDER BY t1.List) AS RowNum
, t1.List
From t1;
--__________________

--Step 3
--Execute stored procedure to build structure

exec sp_wrk_Product_Structure;

With t1 as
(
SELECT
Unit 
, Contract
, Div
, PN as List --List 
, ps.Component_PN as PN
, Loc
, ps.Col 
, ps.Parent_PN as Structure_PN
, ps.ID as Structure
, '' as Dist_Div
from wrk_Part_Structure ps
inner join wrk_eng_Part_Dist_CORE cl
on ps.Init_PN = cl.PN 
)

--Insert into eng_NPO_Part_Dist_CORE
Select t1.*
INTO Test_NPO
From t1 Left outer join eng_NPO_Part_Dist_Core s on
t1.Unit = s.Unit
and t1.Contract = s.Contract
and t1.Div = s.Div
and t1.Loc = s.Loc
and t1.List = s.List
and t1.PN = s.PN
Where s.List is null 
--Order by t1.list ;


GO
