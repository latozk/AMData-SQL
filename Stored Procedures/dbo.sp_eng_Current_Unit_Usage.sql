SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE Procedure [dbo].[sp_eng_Current_Unit_Usage] as

--************************************************************************
--                            AMData
--***********************************************************************
-- =============================================
--Author: Newell, R
--Date: 2021-12-01
--Purpose: Get current usgage for picklist dbo.inp_Picklist_Current_Unit_Usage.  Results to be added to dbo.res_Current_Unit_Usage_pl.
--Modification notes: 
--
--
-- =============================================



-----------------------------------------
---Step 1
-----------------------------------------

Truncate table wrk_PN_Reverse_Structure_Row;

with t1 as 
(Select distinct ref.PN from inp_Picklist_Current_Unit_Usage ref
join eng_Product_Structure eps
on ref.pn = eps.Comp )

insert into wrk_PN_Reverse_Structure_Row 
select
ROW_NUMBER() OVER ( ORDER BY t1.PN) AS RowNum
, t1.PN
From t1;

-----------------------------------------
---Step 2
-----------------------------------------

exec sp_wrk_Reverse_Product_Structure_Current;


-----------------------------------------
---Step 3
-----------------------------------------

Truncate Table res_eng_Current_Unit_Usage;

With t1 as
(
Select Init_PN
	  ,Qty
	  ,Level
	  ,rps.PN
	  ,udl.[PN] As Parent
	  ,ID
      ,[Unit]
	  ,[Contract]
      ,[Div]
      ,[Seq]
      ,[ECN]
      ,[Status]
      ,[Test_Status]
      ,[Unit_Div]
      ,[ECN_Add_Dt]
      ,[ECN_Rem_Dt]
  From [dbo].[eng_Unit_Div_ML_GL] udl
  Join dbo.wrk_Part_Reverse_Structure rps
  On udl.PN=rps.Parent
  Where Status='ADD'
)

Insert into res_eng_Current_Unit_Usage
Select t1.*
--Into res_Current_Unit_Usage
From t1


GO
