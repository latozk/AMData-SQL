SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE  Procedure [dbo].[sp_eng_NPO_Part_Dist_CORE_Update] as

--exec [sp_eng_Part_Dist_CORE_Update]

--************************************************************************
--                            AMData
--***********************************************************************
-- =============================================
--Author: Latoz, K
--Date: 2020-05-26
--Purpose:Append records to eng_NPO_Part_Dist_CORE
--
--Last modified date: 2022*03*14
--Modification notes: added Key_3 from eng_ecn_Tran 
-- =============================================
Declare @Loc varchar(3)

Set @Loc = 'NPO';
truncate table wrk_eng_Part_Dist_Core;


--_______________________

---**Step 1

With a As
--Gets Agile attributed Unit-Contract-Divisions (Units with distribution controlled by Agile)
(
Select Unit
,Contract
,Div
From eng_Agile_Distribution_ADDs
Union
Select Unit
,Contract
,Div
From eng_Agile_Distribution_REMs
)
, au As
(
Select Distinct Unit
,Contract
,Div
From a
)
,cu As
--Gets Unit-Contract_Divisions with Division distribution (Units with distribution controlled by CORE)
(
Select d.Unit
,d.Contract
,d.Div
,d.Loc
From eng_Unit_Dist d
Where 
d.Loc='NPO'
And d.Unit>''
And d.Contract<>'MILT'
--Excludes Agile attributed Unit-Contract-Divisions
And Not Exists
(Select * From au
Where d.Unit=au.Unit And d.Contract=au.Contract And d.Div=au.Div)
)
, c As
--Picks up group lists PNs for each Unit-Contract-Division with CORE distribution
(
Select Distinct cu.Unit
,cu.Contract
,cu.Div
,cu.Loc
,ep.PN
,Status
From cu
Join eng_Unit_Div_ML_GL ep
On cu.Unit=ep.Unit And cu.Contract=ep.Contract And cu.Div=ep.Div
--Where ep.[Status]='ADD'
)
, ec as
(
select c.Unit
,c.contract
,c.div
,c.loc 
,c.PN
, '' as Component_PN
, '' as Structure
, Null as Col
From  c
)
Insert Into wrk_eng_Part_Dist_CORE
Select * 
From ec
;

--R.Newell Removed the section below on 2022-03-14 as Per Jay Hoskeri, a better way to find which unit-contract-divisions 
--have distribution controlled by CORE is to use 2 new tables added to AMData which contain the unit-contract-divisions which
--have distribution controlled by Agile attributes.  If unit-contract-divisions are not in the Agile tables, then they have
--distribution controlled by CORE.  The new code appears just below this removed section of code.
--With 
--c as
--(select distinct Unit
--, Contract
--, ep.Div
---- , Key_1
--, PN
---- , Dist_Div
---- , No_Usg 
--, Status
----from eng_Part_Unit_Contract_Div ep
----Left join eng_div ed
----	on ep.DIV = ed.Div
----where --key_1 = '4283148'and 
----[tran]='Add'
----and unit>''
----and not ed.Type = 'F'
--from eng_Unit_Div_ML_GL ep
--       Left join eng_div ed
--              on ep.DIV = ed.Div
--where 
--[Status]='ADD'
--and unit>''
--and contract<>'MILT'
--and (
--    (ed.Type = 'M' and not ep.DIV like 'SER%')
--    or
--    (ep.Div in('SER1', 'SER3', 'SER4', 'SERV', 'SNIJ', 'SCRA', 'SPED')))
    
--)
--,
--ec as
--(
--select c.Unit
--, c.contract
--, c.div
-- , d.loc 
----,  c.Key_1
--, PN
----, c.Dist_Div
----, c.No_Usg
----, c.Key_1 as PN
--, '' as Component_PN
--, '' as Structure
--, Null as Col
--from  c
--	Join eng_Unit_Dist d
--		on c.unit = d.unit
--		and c.contract = d.contract
--		and c.div = d.div 
--Where d.loc='NPO'
----and Key_1 IN (SELECT PN FROM dbo.eng_Part_Master WHERE Type='L')
--and PN IN (SELECT PN FROM dbo.eng_Part_Master WHERE Type='L')
--)
--Insert into wrk_eng_Part_Dist_CORE
--select * from ec;


--Add Key_3 from eng_ecn_Tran 

With a As
--Gets Agile attributed Unit-Contract-Divisions (Units with distribution controlled by Agile)
(
Select Unit
,Contract
,Div
From eng_Agile_Distribution_ADDs
Union
Select Unit
,Contract
,Div
From eng_Agile_Distribution_REMs
)
, au As
(
Select Distinct Unit
,Contract
,Div
From a
)
,c As
--Gets Unit-Contract_Divisions with Division distribution (Units with distribution controlled by CORE while excluding any with Agile attributes)
--This section gets cancelled list structure as the Product Structure procedure will not get the structure
--of cancelled lists.
(select REVERSE(PARSENAME(REPLACE(REVERSE(Key_1), '-', '.'), 1)) AS Unit
, REVERSE(PARSENAME(REPLACE(REVERSE(Key_1), '-', '.'), 3)) AS Contract
, REVERSE(PARSENAME(REPLACE(REVERSE(Key_1), '-', '.'), 2)) AS Div
 , Key_3
 --, '' as Dist_Div
 --, '' as No_Usg 
from eng_ecn_tran
Where Key_3>''
and not key_3 = 'None'
and Unit_Contract >''
)
,
ec as
(
--03/19/2022 R. Newell added the Left function to Unit, Contract, Div and Key_3 as data was too long to fit into destination table.
select Left(c.Unit,4) as Unit
, Left(c.contract,6) as contract
, Left(c.div,4) as div
, d.loc 
--, c.Dist_Div
--, c.No_Usg
, Left(c.Key_3,15) as PN
, '' as Component_PN
, '' as Structure
, Null as Col
from  c
Join eng_Unit_Dist d
		on c.unit = d.unit
		and c.contract = d.contract
		and c.div = d.div 
		Left Join au
		on au.unit = d.unit
		and au.contract = d.contract
		and au.div = d.div 
Where d.loc='NPO'
And d.Unit>''
And d.Contract<>'MILT'
--Excludes Agile attributed Unit-Contract-Divisions
And au.unit IS NULL
--And Key_3 IN (SELECT PN FROM dbo.eng_Part_Master WHERE Type='L')
)
Insert into wrk_eng_Part_Dist_CORE
select * from ec;


--Gets Unit-Contract-Divsion information that may inadvertently be included in the Agile Distribution ADDs and/or the Agile Distribution REMs table.
--If service, SPED or mast information is present in the Agile tables it will not appear in the first dataset prepared by Step 1 and must be picked up
--separately here to ensure it is captured.
With 
c as
(
Select Distinct Unit
, Contract
, ep.Div
, PN
, Status
From eng_Unit_Div_ML_GL ep
       Join eng_div ed
              On ep.Div = ed.Div
Where 
--[Status]='ADD' And 
Unit>'' And Contract<>'MILT'
And ((ed.Type = 'M' and not ep.Div like 'SER%')
    Or
    (ep.Div in('SER1', 'SER3', 'SER4', 'SERV', 'SNIJ', 'SCRA', 'SPED')))
)
, ec as
(
select c.Unit
, c.contract
, c.div
, d.loc 
, PN
, '' as Component_PN
, '' as Structure
, Null as Col
from  c
	Join eng_Unit_Dist d
		on c.unit = d.unit
		and c.contract = d.contract
		and c.div = d.div 
Where d.loc='NPO'
and PN IN (SELECT PN FROM dbo.eng_Part_Master WHERE Type='L')
)
Insert into wrk_eng_Part_Dist_CORE
select * from ec
;


--_______________________

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

exec sp_wrk_Product_Structure_All;

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
on ps.Init_PN = cl.PN 
)

Insert into eng_NPO_Part_Dist_CORE
Select t1.*
From t1 Left outer join eng_NPO_Part_Dist_CORE s on
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
