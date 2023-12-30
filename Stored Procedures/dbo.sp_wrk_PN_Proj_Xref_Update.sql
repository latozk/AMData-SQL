SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Procedure [dbo].[sp_wrk_PN_Proj_Xref_Update]
as 

--************************************************************************
--                            sp_wrk_PN_Proj_XRef_Update
--***********************************************************************
-- =============================================
--Author: Latoz, K
--Date: 2020-05-19
--Purpose: This Stored Procedure (SP) is called from sp_PN_Proj_XRef_Update. It is used to put updates in eng_PN_Proj_Xref
-- It is based on sp_eng_Prod_Structure_Tree_Picklist 
--  It is used to take records in wrk_inp_Picklist and process them into structure and then into eng_PN_Proj_Xref
--  This table is a cross reference between PN and Project and includes all of the component parts of a PN on each of the Proj
-- associated with that PN
--
--Last modified date: 
--Modification notes: 
-- =============================================

DECLARE @COL as Int
DECLARE @Rec_Before as Int
DECLARE @Rec_After as Int
DECLARE @ASofDT as date  
Declare @RowStart as int
Declare @RowEnd as int

Set @RowStart = 0
Set @RowEnd = 0

Set @ASofDT = getdate() 
Set @COL=0
Set @Rec_Before = 1
Set @Rec_After = 2

Truncate table wrk_inp_Picklist;

Insert into wrk_inp_Picklist
Select PN from wrk_PN_Structure_Row
--Where Row# >=@RowStart and Row# <=@RowEnd 
--And not Row# in (Select Row# from wrk_PN_Structure_Row_Processed) ;

Truncate Table wrk_Part_Structure;

Insert into wrk_Part_Structure
SELECT p.PN
,	CONCAT(LTrim(RTrim(e.PN)), '-', LTrim((RTRIM(Comp)))) AS ID
   ,@COL+1 as Col
  , e.PN As Parent_PN
  , Comp AS Component_PN
FROM eng_Product_Structure e
Left outer join wrk_inp_picklist p 
  on e.PN = p.pn 
WHERE e.PN = p.pn 
	  and Not Status in ('REM')

Set @COL = @COL + 1;

WHILE(@Rec_After - @Rec_Before > 0)

BEGIN;

SET @Rec_Before = (Select Count(*) from wrk_Part_Structure);

PRINT N'Initial Before'
PRINT @Rec_Before
PRINT N'Initial After'
PRINT @Rec_After
PRINT N'COL Value'
Print @COL;

--Insert into wrk_Part_Structure 
with eps as (
SELECT ps.Init_PN
,	CONCAT(ID, '-', LTrim(RTrim(e.Comp))) Concat_ID
   ,COL+1 as Col
  , ps.Component_PN
  , e.Comp
FROM wrk_Part_Structure ps 
  Left Join eng_Product_Structure e
    ON ps.Component_PN = e.PN  
WHERE e.Comp IS NOT NULL  
     and Col = @COL -- - 1
	  and Not Status in ('REM')
	 )
Insert into wrk_Part_Structure 
 SELECT *
  FROM eps
  WHERE NOT EXISTS 
  (SELECT rps.Parent_PN FROM wrk_Part_Structure rps
  WHERE eps.Comp=rps.Parent_PN) 
;
SET @Rec_After = (Select Count(*) from wrk_Part_Structure) 
SET @COL = @COL+1
End;

--Load all project associated with a PN structure into wrk_PN_Proj_Xref
With t1 as (
Select wps.component_PN as PN
, Proj
, wps.Init_PN
, wps.ID
From wrk_Part_Structure wps
Join eng_PN_Proj_Xref rpx
on wps.Init_PN=rpx.PN
--where wps.Init_PN = '0250713'
)

Insert into wrk_PN_Proj_Xref
select t1.* 
from  t1
left outer join eng_PN_Proj_Xref rx
on t1.Init_PN=rx.Init_PN
and t1.Proj=rx.Proj
and t1.PN = rx.PN
where rx.PN is null
--and t1.init_PN = '0250713'
;

Insert into wrk_PN_Structure_Row_Processed
Select * from wrk_PN_Structure_Row
Where Row# >=@RowStart and Row# <=@RowEnd
And not Row# in (Select Row# from wrk_PN_Structure_Row_Processed) ;

GO
