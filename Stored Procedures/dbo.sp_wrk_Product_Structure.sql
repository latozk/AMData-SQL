SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  Procedure [dbo].[sp_wrk_Product_Structure]
as 

--************************************************************************
--                            sp_wrk_Product_Structure
--***********************************************************************
-- =============================================
--Author: Latoz, K
--Date: 2020-06-01
--Purpose:Common procedure to build product structure into a work table.  It is called from other procedures.  
--It pulls records other procedures have put into wrk_Prod_Structure_Row and puts them into wrk_inp_Picklist to process.
--	The wrk_Prod_Structure_Row table is used as a table to hold large number of records (10,000+) and process in batches 
--by uncommenting the logic to use rows below
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

--Used if processing large number of records
--Set @RowStart = 1
--Set @RowEnd = 10000

Set @ASofDT = getdate() 
Set @COL=0
Set @Rec_Before = 1
Set @Rec_After = 2

Truncate table wrk_inp_Picklist;

Insert into wrk_inp_Picklist
Select PN from wrk_PN_Structure_Row

--Used if processing large number of records
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
	  And not Opt = 'O' 

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
	  And not Opt = 'O'
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


--Used as part of batch processing by rows.

--Insert into wrk_PN_Structure_Row_Processed
--Select * from wrk_PN_Structure_Row
--Where Row# >=@RowStart and Row# <=@RowEnd
--And not Row# in (Select Row# from wrk_PN_Structure_Row_Processed) ;

GO
