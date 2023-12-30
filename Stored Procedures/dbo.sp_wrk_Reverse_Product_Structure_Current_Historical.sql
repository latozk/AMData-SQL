SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE Procedure [dbo].[sp_wrk_Reverse_Product_Structure_Current_Historical]
as 

--************************************************************************
--                            sp_wrk_Reverse_Product_Structure_Current_Historical
--***********************************************************************
-- =============================================
--Author: Newell, R  ---  Logic borrowed (and revised) from K Latoz procedure sp_wrk_Product_Structure.
--Date: 2021-12-01
--Purpose:Common procedure to build reverse product structure into a work table.  It is called from other procedures.  
--It pulls records other procedures have put into wrk_PN_Reverse_Structure_Row and puts them into wrk_inp_Picklist to process.
--	The wrk_PN_Reverse_Structure_Row table is used as a table to hold large number of records (10,000+) and process in batches 
--by uncommenting the logic to use rows below
--
--Last modified date: 
--Modification notes: 
-- =============================================


DECLARE @Level as Int
DECLARE @Rec_Before as Int
DECLARE @Rec_After as Int
DECLARE @ASofDT as date  
Declare @RowStart as int
Declare @RowEnd as int

--Used if processing large number of records
--Set @RowStart = 1
--Set @RowEnd = 10000

Set @ASofDT = getdate() 
Set @Level=0
Set @Rec_Before = 1
Set @Rec_After = 2

Truncate table wrk_inp_Picklist;

Insert into wrk_inp_Picklist

Select PN from wrk_PN_Reverse_Structure_Row

--Used if processing large number of records
--Where Row# >=@RowStart and Row# <=@RowEnd 
--And not Row# in (Select Row# from wrk_PN_Reverse_Structure_Row_Processed) ;

Truncate Table wrk_Part_Reverse_Structure;

Insert into wrk_Part_Reverse_Structure
SELECT p.PN As Init_PN
  --2023-10-30 Added Qty
  , Usg_Qty As Qty
  ,	CONCAT(LTrim(RTrim(e.Comp)), '-', LTrim((RTRIM(e.PN)))) AS ID
  , @Level+1 as Level
  , Comp AS PN
  , e.PN As Parent_PN
  From wrk_inp_picklist p 
  Left join eng_Product_Structure e
  on p.pn=e.Comp 
  Left join eng_Part_Master pm
  on e.PN = pm.PN
  WHERE p.pn = e.Comp 
	  And Not Opt = 'O'
	  --2023-10-30 Commented out the next two lines.
	  --And Not e.Status in ('REM')
	  --And Not pm.Status in ('CAN')

Set @Level = @Level + 1;


WHILE(@Rec_After - @Rec_Before > 0)

BEGIN;

SET @Rec_Before = (Select Count(*) from wrk_Part_Reverse_Structure);

PRINT N'Initial Before'
PRINT @Rec_Before
PRINT N'Initial After'
PRINT @Rec_After
PRINT N'Level Value'
Print @Level;

--Insert into wrk_Part_Reverse_Structure 
with reps as (
SELECT rps.Init_PN
  --2023-10-30 Added Qty
  , Qty
  ,	CONCAT(ID, '-', LTrim(RTrim(e.PN))) Concat_ID
  , Level+1 as Level
  , rps.Parent As PN
  , e.PN As Parent
FROM wrk_Part_Reverse_Structure rps 
  Left Join eng_Product_Structure e
  ON rps.Parent = e.Comp  
  Left join eng_Part_Master pm
  on e.PN = pm.PN
  WHERE e.PN IS NOT NULL  
      And Level = @Level -- - 1
	  And Not Opt = 'O'
	  --2023-10-30 Commented out the next two lines.
	  --And Not e.Status in ('REM')
	  --And Not pm.Status in ('CAN')
)
Insert into wrk_Part_Reverse_Structure 
  SELECT *
  FROM reps
  WHERE NOT EXISTS 
  (SELECT rps.PN FROM wrk_Part_Reverse_Structure rps
  WHERE rps.PN=reps.PN) 
;
SET @Rec_After = (Select Count(*) from wrk_Part_Reverse_Structure) 
SET @Level = @Level+1
End;


--Used as part of batch processing by rows.

--Insert into wrk_PN_Reverse_Structure_Row_Processed
--Select * from wrk_PN_Reverse_Structure_Row
--Where Row# >=@RowStart and Row# <=@RowEnd
--And not Row# in (Select Row# from wrk_PN_Reverse_Structure_Row_Processed) ;

GO
