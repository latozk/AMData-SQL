SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  Procedure [dbo].[zsp_eng_NPO_Part_Dist_CORE_Update_2022_02_21] as

--exec sp_eng_NPO_Part_Dist_CORE_Update

--************************************************************************
--                            AMData
--***********************************************************************
-- =============================================
--Author: Latoz, K
--Date: 2020-05-26
--Purpose:Append records to eng_NPO_Part_Dist_CORE
--
--Last modified date: 
--Modification notes:
-- =============================================
Declare @Loc varchar(3)

Set @Loc = 'NPO';
truncate table wrk_eng_Part_Dist_Core;

With 
--pc as
--(select distinct Unit
--, Contract
--, Div
--, List
--from eng_NPO_Part_Dist_Core)
--,
c as
(select distinct Unit
, Contract
, ep.Div
-- , Key_1
, PN
-- , Dist_Div
-- , No_Usg 
from eng_ECN_Tran_Usage ep--eng_Part_Unit_Contract_Div ep
Left join eng_div ed
on ep.DIV=ed.div 
where --key_1 = '4283148'and 
[tran]='Add'
and unit>''
and (
    (ed.Type = 'M' and not ep.DIV like 'SER%')
    or
    (ep.Div in('SER1', 'SER3', 'SER4', 'SERV', 'SNIJ', 'SCRA', 'SPED')))
)
,
ec as
(
select c.Unit
, c.contract
, c.div
 , d.loc 
--,  c.Key_1
, PN
--, c.Dist_Div
--, c.No_Usg
--, c.Key_1 as PN
, '' as Component_PN
, '' as Structure
, Null as Col
from  c
	Join eng_Unit_Dist d
		on c.unit = d.unit
		and c.contract = d.contract
		and c.div = d.div 
	--Left outer join pc
	--	on c.Unit = pc.Unit
	--	and c.Contract=pc.Contract
	--	and c.Div = pc.div
	--	and key_1=pc.List
Where d.loc='NPO'
and PN IN (SELECT PN FROM dbo.eng_Part_Master WHERE Type='L')
--and pc.Unit is null
)
Insert into wrk_eng_Part_Dist_CORE
select * from ec;

--PN
With
--pc as
--(select distinct Unit
--, Contract
--, Div
--, List
--from eng_NPO_Part_Dist_Core)
--,
c as
(select distinct Unit
, Contract
, ep.Div
 , PN
 --, Dist_Div
 --, No_Usg 
from eng_ECN_Tran_Usage ep--eng_Part_Unit_Contract_Div ep
Left outer join eng_div ed
	on ep.DIV = ed.div 
where [tran]='Add'
and unit>''
and not ed.type = 'F'
)
,
ec as
(
select c.Unit
, c.contract
, c.div
 , d.loc 
--,  c.PN as List
--, c.Dist_Div
--, c.No_Usg
, c.PN as List --PN
, '' as Component_PN
, '' as Structure
, Null as Col
	--Left outer join pc
	--	on c.Unit = pc.Unit
	--	and c.Contract=pc.Contract
	--	and c.Div = pc.div
	--	and PN=pc.List
	from  c
	Join eng_Unit_Dist d
		on c.unit = d.unit
		and c.contract = d.contract
		and c.div = d.div 
Where d.loc='NPO'
and PN IN (SELECT PN FROM dbo.eng_Part_Master WHERE Type='L')
--and pc.Unit is null
)
Insert into wrk_eng_Part_Dist_CORE
select * from ec;


---**Step 2
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

----Step 4
--With t1 as 
--(
--SELECT
--Unit 
--, Contract
--, Div
--, Loc
--, List
--, Dist_Div
--, No_Usg
--, ps.Parent_PN
--, ps.Component_PN
--, ps.ID
--, ps.Col 
--from wrk_Part_Structure ps
--inner join wrk_eng_Part_Dist_CORE cl
--on ps.Init_PN = cl.List 
--)
--2020-07-07 Changed to accomodate new field names and structure
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
--, Dist_Div
--, No_Usg
from wrk_Part_Structure ps
inner join wrk_eng_Part_Dist_CORE cl
on ps.Init_PN = cl.pn 
)

Insert into eng_NPO_Part_Dist_Core
Select t1.*
From t1 Left outer join eng_NPO_Part_Dist_Core s on
t1.Unit = s.Unit
and t1.Contract = s.Contract
and t1.Div = s.Div
and t1.Loc = s.Loc
and t1.List = s.List
and t1.PN = s.PN
Where s.List is null 
--Order by t1.list ;


----Step 5
--With t1 as 
--(
--SELECT
--Unit 
--, Contract
--, Div
--, Loc
--, List
--, Dist_Div
--, No_Usg
--, ps.Parent_PN
--, ps.Component_PN
--, ps.ID
--, ps.Col 
--from wrk_Part_Structure ps
--inner join wrk_eng_Part_Dist_CORE cl
--on ps.Init_PN = cl.List 
--)

--Select t1.*, Getdate() as RunDate
--From t1 Left outer join eng_NPO_Part_Dist_Core s on
--t1.Unit = s.Unit
--and t1.Contract = s.Contract
--and t1.Div = s.Div
--and t1.Loc = s.Loc
--and t1.List = s.List
--and t1.Component_PN = s.Component_PN
--Where s.List is null 
GO
