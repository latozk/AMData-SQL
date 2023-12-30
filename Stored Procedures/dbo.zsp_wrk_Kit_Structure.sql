SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE Procedure [dbo].[zsp_wrk_Kit_Structure]
@PN Varchar(30)
as 



--exec x_sp_Eng_Prod_Structure_Tree '4281483', '2020-08-06'

DECLARE @Parent_PN as varchar(30)
DECLARE @COL as Int
DECLARE @Rec_Before as Int
DECLARE @Rec_After as Int
DECLARE @ASofDT as date --added 2020-04-07 

Set @Parent_PN = @PN --'S01733230000'
Set @ASofDT = GetDate() 
Set @COL=0
Set @Rec_Before = 1
Set @Rec_After = 2

Truncate table wrk_Part_Structure_Kit

Insert into wrk_Part_Structure_Kit
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
And ECN_Add_DT <= @ASofDT
And (ECN_Rem_DT is Null or ECN_Rem_DT>@ASofDT)
  -- AND Not Status in ('REM')

Set @COL = @COL + 1

WHILE(@Rec_After - @Rec_Before > 0)

BEGIN;

SET @Rec_Before = (Select Count(*) from wrk_Part_Structure_Kit) 

PRINT N'Initial Before'
PRINT @Rec_Before
PRINT N'Initial After'
PRINT @Rec_After
PRINT N'COL Value'
Print @COL

Insert into wrk_Part_Structure_Kit
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
FROM wrk_Part_Structure_Kit ps 
  Left Join eng_Product_Structure e
    ON ps.Component_PN = e.PN  
WHERE e.Comp IS NOT NULL  
     and Col = @COL -- - 1
	 And (e.ECN_Add_DT <= @ASofDT)  --Added 2020-04-07
	 And (e.ECN_Rem_DT is Null or e.ECN_Rem_DT>@ASofDT)
	 -- and Not Status in ('REM')
;
SET @Rec_After = (Select Count(*) from wrk_Part_Structure_Kit) 
SET @COL = @COL+1
;
End;

--Added 2020-04-08
With t1 as (
SELECT Parent_PN
, Seq, COUNT(*) Dup_Count
FROM wrk_Part_Structure_Kit 
GROUP BY Parent_PN, Seq
HAVING COUNT(*) > 1
)
, dup as 
(Select ps.*
from 
wrk_Part_Structure_Kit ps
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
From  wrk_Part_Structure_Kit tps
inner join DelRec on
tps.Parent_PN = DelRec.Parent_PN
and tps.Seq = DelRec.Seq
and tps.ECN_Add_DT = DelRec.MinAddDt
Where tps.Parent_PN = DelRec.Parent_PN
and tps.Seq = DelRec.Seq
and tps.ECN_Add_DT = DelRec.MinAddDt


GO
