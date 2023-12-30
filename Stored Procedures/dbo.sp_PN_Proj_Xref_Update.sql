SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Procedure [dbo].[sp_PN_Proj_Xref_Update] as

--exec sp_PN_Proj_Xref_Update

--************************************************************************
--                            sp_PN_Proj_XRef_Update
--***********************************************************************
-- =============================================
--Author: Latoz, K
--Date: 2020-05-19
--Purpose: This SP is used to append updates to the eng_PN_Proj_Xref table

--Last modified date: 
--Modification notes: 
-- =============================================

--Process to load Part Number Project Table
--Table Names:
--	eng_PN_Proj_Xref --Final Results Table that will hold PN with every project associated with it.
--  wrk_PN_Structure_Row - holds distinct PN with structure with a Row number so can operate against batches.  
-- wrk_Inp_Picklist - This holds PNs that the SP will process against.

--Stored Procedures
--	sp_eng_Proj_Structure - Used to build structure and populate the eng_PN_Proj_Xref
--     exec sp_eng_Proj_Structure


--*Step 1
--This query will build a table that has PN -> associated with that Project.  It does not have the components for the PN thus the need for this process.

Truncate Table wrk_PN_Proj_Xref;

With t1 as (
SELECT DISTINCT 
 h.PN
,e.PROJ
, e.ECN
, h.Eff_Dt
FROM eng_Part_ECN_History h JOIN eng_ECN e ON h.ECN=e.ECN
Left outer join eng_PN_Proj_Xref x on
e.Proj = x.proj 
and h.PN = x.Init_PN 
Where x.proj is null 
and e.Proj >'0'
)

--This part of this step puts the results into the final table.  This initial load insures all of the top structure pn have records.  
Insert into wrk_PN_Proj_XRef  
Select t1.PN as PN
, t1.Proj as proj
, T1.PN as Init_PN
, 'Top' as Structure
from t1;

--_______________________
---**Step 2
--This step pulls distinct PN from the eng_PN_Proj_Xref that have structure.  

Truncate table wrk_PN_Structure_Row;

with t1 as 
(Select distinct ref.PN from wrk_PN_Proj_XRef ref
join eng_Product_Structure eps
on ref.PN = eps.PN )

insert into wrk_PN_Structure_Row 
select
ROW_NUMBER() OVER ( ORDER BY t1.pn) AS RowNum
, t1.PN
From t1;
--__________________

--Step 3
--Execute stored procedure to build structure

truncate table wrk_PN_Structure_Row_Processed;

exec sp_wrk_PN_Proj_Xref_Update

--Step 4
--Insert into live table
Insert into eng_PN_Proj_Xref 
select w.* from  wrk_PN_Proj_Xref w
left outer join eng_PN_Proj_Xref x
on w.pn = x.pn
and w.proj=x.proj
and w.init_pn=x.init_pn  
where x.pn is null;

--Step 5
--Insert into Archive Table
Insert into wrk_PN_Proj_Xref_Archive 
select w.*, Getdate() from  wrk_PN_Proj_Xref w
left outer join eng_PN_Proj_Xref x
on w.pn = x.pn
and w.proj=x.proj
and w.init_pn=x.init_pn  
where x.pn is null;


GO
