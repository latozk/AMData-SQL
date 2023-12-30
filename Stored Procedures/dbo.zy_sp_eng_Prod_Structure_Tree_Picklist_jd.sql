SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Procedure [dbo].[zy_sp_eng_Prod_Structure_Tree_Picklist_jd] @AS_DT date
as 

--exec y_sp_eng_Prod_Structure_Tree_Picklist_jd '2020-08-06'
--************************************************************************
--                            AMData
--***********************************************************************
-- =============================================
--Author: Latoz, K
--Date: 2020-03-01
--Purpose: The purpose of this Stored Procedure (SP) is to take the Part Numbers in the Picklist table and find all of
--  thier component parts as well as the component parts or their component parts in order to create a structure 
--  of everything related to parts in the list
--
--The SP queries the eng_Product_Structure table joined to the picklist table.  
--    The results are put in tbl_Part_Structure.  Then the code loops through the part numbers in tbl_Part_Structure 
--  to find thier components in eng_Product_Structure.  When the before and after record counts of tbl_Part_Structure are
--  equal the procedure exits the loop.
--
--Last modified date: 2020-03-20
--Modification notes: 2020-03-20 - changed table and field names to accomodate naming changes in the AMData database
--                                  2020-04-08 - Added functionality to accept a date and show results using the passed date as a "as of" scenario 
--                                  2020-04-14 - Modified to work with Access DB and new As of Date functionality
-- =============================================

--DECLARE @Parent_PN as varchar(30)
DECLARE @COL as Int
DECLARE @Rec_Before as Int
DECLARE @Rec_After as Int
DECLARE @ASofDT as date --added 2020-04-07 

Set @ASofDT = @AS_DT
Set @COL=0
Set @Rec_Before = 1
Set @Rec_After = 2

Truncate Table res_eng_Part_Structure;

Insert into res_eng_Part_Structure
SELECT CONCAT(LTrim(RTrim(e.PN)), '-', LTrim((RTRIM(Comp)))) AS ID
   ,@COL+1 as Col
  , e.PN As Parent_PN
  , Comp AS Component_PN
  , Usg_Qty As Qty
  , Seq AS Seq
  , Status As Trans
  , ECN_Add_Dt
  , ECN_Rem_Dt --As Eff_Dt 
  , e.PN as Input_PN
  , @ASofDT as Input_Dt 
FROM eng_Product_Structure e
Left outer join inp_picklist p 
  on e.PN = p.pn 
WHERE e.PN = p.pn 
And ECN_Add_DT <= @ASofDT
And (ECN_Rem_DT is Null or ECN_Rem_DT>@ASofDT)

Set @COL = @COL + 1

WHILE(@Rec_After - @Rec_Before > 0)

BEGIN;

SET @Rec_Before = (Select Count(*) from res_eng_Part_Structure) 

PRINT N'Initial Before'
PRINT @Rec_Before
PRINT N'Initial After'
PRINT @Rec_After
PRINT N'COL Value'
Print @COL

Insert into res_eng_Part_Structure 
SELECT CONCAT(ID, '-', LTrim(RTrim(e.Comp)))
   ,COL+1
  , ps.Component_PN
  , e.Comp
  , e.Usg_Qty
  , e.Seq
  , Status
  , e.ECN_Add_Dt 
  , e.ECN_Rem_DT
  , e.PN as Input_PN
 , @ASofDT as Input_Dt 
FROM res_eng_Part_Structure ps 
  Left Join eng_Product_Structure e
    ON ps.Component_PN = e.PN  
WHERE e.Comp IS NOT NULL  
     and Col = @COL -- - 1
	 And (e.ECN_Add_DT <= @ASofDT)  --Added 2020-04-07
	 And (e.ECN_Rem_DT is Null or e.ECN_Rem_DT>@ASofDT)
	 -- and Not Status in ('REM')
;
SET @Rec_After = (Select Count(*) from res_eng_Part_Structure) 
SET @COL = @COL+1
;
End;

--Added 2020-04-08
With t1 as (
SELECT Parent_PN
, Seq, COUNT(*) Dup_Count
FROM res_eng_Part_Structure 
GROUP BY Parent_PN, Seq
HAVING COUNT(*) > 1
)
, dup as 
(Select ps.*
from 
res_eng_Part_Structure ps
inner join t1 
on ps.parent_PN = t1.parent_PN
and ps.Seq = t1.Seq 
)
, DelRec as
(
Select dup.parent_PN
, dup.Seq
, Min(ECN_Add_Dt) as MinAddDt from dup 
group by dup.parent_PN, dup.Seq 
) 

Delete tps 
From  res_eng_Part_Structure tps
inner join DelRec on
tps.Parent_PN = DelRec.Parent_PN
and tps.Seq = DelRec.Seq
and tps.ECN_Add_DT = DelRec.MinAddDt
Where tps.Parent_PN = DelRec.Parent_PN
and tps.Seq = DelRec.Seq
and tps.ECN_Add_DT = DelRec.MinAddDt

--exec sp_eng_Prod_Structure_Tree_Picklist '2020-04-14'
GO
