SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE Procedure [dbo].[sp_eng_Prod_Structure_Tree]
@PN Varchar(30), @AS_DT date
as 
--************************************************************************
--                            AMData
--***********************************************************************


-- =============================================
--Author: Latoz, K
--Date: 2020-03-01
--Purpose: The purpose of this Stored Procedure (SP) is to take a Part Number and find all of
--  it's component parts as well as their component parts in order to create a structure 
--  of everything related to that part
--
--The SP receives a Part Number when it is called.  The Part number is used to query eng_Product_Structure
--  table.  The results are put in res_Part_Structure.  Then the code loops through the part numbers in res_Part_Structure 
--  to find thier components in eng_Product_Structure.  When the before and after record counts of res_Part_Structure are
--  equal the procedure exits the loop.
--Last modified date: 2020-04-08
--Modification notes: 2020-03-20 - changed table and field names to accomodate naming changes in the AMData database
--                                 2020-04-08 - Added functionality to accept a date and show results using the passed date as a "as of" scenario
--                                 2020-04-13 - Added Input PN and Input DT fields to hold dates passed to SP
-- =============================================

DECLARE @Parent_PN as varchar(30)
DECLARE @COL as Int
DECLARE @Rec_Before as Int
DECLARE @Rec_After as Int
DECLARE @ASofDT as date --added 2020-04-07 

Set @Parent_PN = @PN --'S01733230000'
Set @ASofDT = @AS_DT
Set @COL=0
Set @Rec_Before = 1
Set @Rec_After = 2

Truncate table res_eng_Part_Structure 

Insert into res_eng_Part_Structure
SELECT CONCAT(LTrim(RTrim(PN)), '-', LTrim((RTRIM(Comp)))) AS ID
   ,@COL+1 as Col
  , PN As Parent_PN
  , Comp AS Component_PN
  , Usg_Qty As Qty
  , Seq AS Seq
  , Status As Trans
  , ECN_Add_Dt
  , ECN_Rem_Dt --As Eff_Dt 
  , @Parent_PN as Input_PN --Added 2020-04-13
  , @ASofDT as Input_Dt --Added 2020-04-13
FROM eng_Product_Structure
WHERE PN = @Parent_PN  
And not Opt = 'O' 
And ECN_Add_DT <= @ASofDT
And (ECN_Rem_DT is Null or ECN_Rem_DT>@ASofDT)
  -- AND Not Status in ('REM')

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

/*  Changed so that duplicates are not allowed in table instead of being eliminated at end
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
  , @Parent_PN as Input_PN --Added 2020-04-13
 , @ASofDT as Input_Dt --Added 2020-04-13
FROM res_eng_Part_Structure ps 
  Left Join eng_Product_Structure e
    ON ps.Component_PN = e.PN  
WHERE e.Comp IS NOT NULL  
     and Col = @COL -- - 1
	 And (e.ECN_Add_DT <= @ASofDT)  --Added 2020-04-07
	 And (e.ECN_Rem_DT is Null or e.ECN_Rem_DT>@ASofDT)
	 -- and Not Status in ('REM')
	 */

--2020-08-13
;
with r1 as(
SELECT CONCAT(ID, '-', LTrim(RTrim(e.Comp))) as ID
   ,COL+1 as Col
  , ps.Component_PN as Parent_PN
  , e.Comp as Component_PN
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
)

Insert into res_eng_Part_Structure 
select r1.*
from r1 Left outer join res_eng_Part_Structure ps
on r1.Parent_PN = ps.Parent_PN
and r1.Component_PN = ps.Component_PN
and r1.Seq = ps.Seq
Where ps.Parent_PN is null 
;
SET @Rec_After = (Select Count(*) from res_eng_Part_Structure) 
SET @COL = @COL+1
;
End;

--Added 2020-04-08
/* Removed 2020-08-13. Duplicates now being eliminated when table loaded
--With t1 as (
--SELECT Parent_PN
--, Seq, COUNT(*) Dup_Count
--FROM res_eng_Part_Structure 
--GROUP BY Parent_PN, Seq
--HAVING COUNT(*) > 1
--)
--, dup as 
--(Select ps.*
--from 
--res_eng_Part_Structure ps
--inner join t1 
--on ps.parent_PN = t1.parent_PN
--and ps.Seq = t1.Seq 
--)
--, DelRec as
--(
--Select dup.parent_PN
--, dup.Seq
--, Min(ECN_Add_Dt) as MinAddDt from dup 
--group by dup.parent_PN, dup.Seq 
--) 

--Delete tps 
--From  res_eng_Part_Structure tps
--inner join DelRec on
--tps.Parent_PN = DelRec.Parent_PN
--and tps.Seq = DelRec.Seq
--and tps.ECN_Add_DT = DelRec.MinAddDt
--Where tps.Parent_PN = DelRec.Parent_PN
--and tps.Seq = DelRec.Seq
--and tps.ECN_Add_DT = DelRec.MinAddDt
*/

GO
GRANT EXECUTE ON  [dbo].[sp_eng_Prod_Structure_Tree] TO [GLOBAL\AP PDC Users]
GO
GRANT EXECUTE ON  [dbo].[sp_eng_Prod_Structure_Tree] TO [GLOBAL\apcsmith]
GO
GRANT EXECUTE ON  [dbo].[sp_eng_Prod_Structure_Tree] TO [GLOBAL\apdteagu]
GO
