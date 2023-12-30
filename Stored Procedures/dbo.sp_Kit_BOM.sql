SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[sp_Kit_BOM] 
--@Parent_PN varchar(16)
--,@Brand varchar(1)
as 

--exec sp_Kit_BOM

--Cleanup & Create Temp Tables
IF OBJECT_ID(N'tempdb..#Temp_Structure') IS NOT NULL
BEGIN
DROP TABLE #Temp_Structure
END;

IF OBJECT_ID(N'tempdb..#Temp_Core') IS NOT NULL
BEGIN
DROP TABLE #Temp_Core
END;

IF CURSOR_STATUS('global','Cursor_Kit_Brand')>=-1
BEGIN
 DEALLOCATE Cursor_Kit_Brand
END;

IF CURSOR_STATUS('global','Cursor_Comp')>=-1
BEGIN
 DEALLOCATE Cursor_Comp
END;


Create table #Temp_Structure 
(Kit_Core_PN varchar(16)
,Top_PN varchar(16)
, Top_PN_Brand varchar(16)
, Comp varchar(16)
, PS_Usg_Qty decimal(18, 0)
, XRef_PN varchar(16)
, Xref_Brand varchar(1)
);

Create table #Temp_Core
(Kit_PN varchar(16)
, Kit_Core_PN varchar(16)
, PN varchar(16)
, PN_Brand varchar(1)
);


--Get Core_PN for PN in Kit Picklist
With cp as
(Select distinct ltrim(rtrim(k.PN)) as Kit_PN ,
Core_PN as Kit_Core_PN
from ref_CORE_PN_XRef x
Join inp_Picklist_Kit k
on x.PN = ltrim(rtrim(k.PN))
)


--with cp as (
--select distinct '4293107' as Kit_PN
--,Core_PN as kit_core_PN
--from ref_Core_PN_Xref
--where pn = '4293107'
--)

Insert into #Temp_Core 
Select distinct cp.Kit_PN
, cp.Kit_Core_PN
, xr.PN
, xr.PN_Brand
from cp
Join ref_CORE_PN_XRef xr
on cp.Kit_Core_PN = xr.CORE_PN 
where not PN is null

--select * from #temp_Core

Insert into wrk_Kit_BOM_Exceptions 
Select Kit_PN, GETDATE(), 'Kit Picklist PN Not found in eng_Product_Structure'
from #Temp_Core 
where not Kit_Core_PN in (select PN from eng_Product_Structure)
 
--for each pn in above table - get structure for core_PN then cross everything back to brand pn
Insert into #Temp_Structure 
select distinct tc.Kit_Core_PN
,tc.PN as Top_PN
, tc.PN_Brand as Top_PN_Brand
, ps.Comp
, ltrim(rtrim(ps.Usg_Qty)) as Usg_qty
, xr.PN as Xref_PN
, xr.PN_Brand as Xref_PN_Brand
From #Temp_Core tc
join eng_Product_Structure ps
on tc.Kit_Core_PN = ps.PN 
Join ref_CORE_PN_XRef xr
on ps.Comp = xr.CORE_PN
and tc.PN_Brand = xr.PN_Brand
;

--select * from #Temp_Structure 

--Load into Exceptions table where there is a discrepancy in brand counts 
with t1 as (
select 
Kit_Core_PN
, Xref_Brand
, COUNT(top_PN) as Brand_Cnt
from #Temp_Structure
Where PS_Usg_Qty > 0 --and Kit_Core_PN = '4010923'
group by Kit_Core_PN, Xref_Brand 
--order by Kit_Core_PN 
)
, t2 as (
 Select kit_core_PN
 , XRef_Brand --2021-01-13 kll : Added because was incorrectly showing Brand discrepancy when there was none
 , COUNT(Kit_Core_PN) as Kit_Cnt
 From t1--
 Group by Kit_Core_PN, Xref_Brand 
 having COUNT(Kit_Core_PN)>1
 )

 --Insert into wrk_Kit_BOM_Exceptions(Input_PN, Run_Date, Exception_Reason)
 (select distinct t1.Kit_Core_PN, GETDATE(), 'Brand Count Discrepancy' as Reason 
 from t1 join t2 
 on t2.Kit_Core_PN = t1.Kit_Core_PN)


--select * from #Temp_Structure

--select * from #Temp_Structure where top_PN= '4293036'
Truncate table res_Kit_BOM;

Declare @PN varchar(16)
Declare @Qty varchar(16);
Declare @Column int
Declare @SQLStr nvarchar(Max)
Declare @TotColCnt int
Declare @SQLInsStr nvarchar(max)
Declare @SQLValueStr nvarchar(Max)
Declare @CommentCnt int
Declare @ParentPN varchar(16)
Declare @Brand varchar(1) 
Declare @Curdate varchar(10)
Declare @Top_PN varchar(16)
Declare @Top_PN_Brand varchar(1) 

Declare Cursor_Kit_Brand cursor 
For Select distinct Top_PN, Top_PN_Brand 
From #Temp_Structure Order by Top_PN_Brand  
Open Cursor_Kit_Brand 

Fetch next from Cursor_Kit_Brand 
into @Top_PN, @Top_PN_Brand  
;
Print @Top_PN
Print @Top_PN_Brand

While @@FETCH_STATUS = 0
Begin
	Set @Curdate = CONVERT(DATE, GETDATE())
	Set @Column = 1
	set @TotColCnt = 
	
	--select * from #temp_structure where kit_pn = '1651203'
	
	(Select Count(*) from #Temp_Structure where Top_PN = @Top_PN and Top_PN_Brand = @Top_PN_Brand)
Print @TotColCnt
--	If @TotColCnt > 8
--	Begin
--		Insert into wrk_Kit_BOM_Exceptions 
--		Values(@Top_PN 
--		, GetDate()
--		, 'Exceeds 8 Components')
--	Goto Fetch_Next 
--		--Fetch next from Cursor_Kit_Brand into @Top_PN, @Top_PN_Brand; 
--	End 
	
	
	set @CommentCnt =0
	Set @SQLInsStr = 'Insert into res_Kit_BOM(Brand, Maint_Date, PN, '
	Set @SQLValueStr =  ' Values(' +''''+ @Top_PN_Brand +'''' + ', ' + '''' + @Curdate +'''' +  ',' + '''' + @Top_PN + '''' + ', '

	Declare Cursor_Comp cursor

	For Select distinct
	 Xref_PN 
	, ps_Usg_Qty
	from #Temp_Structure
	Where Top_PN = @Top_PN
	and Top_PN_Brand = @Top_PN_Brand 
	Order by PS_Usg_Qty Desc

	Open Cursor_Comp

	Fetch next From Cursor_Comp INTO
	@PN
	, @Qty
	;
	Print @PN
	Print @Qty 

	While @@FETCH_STATUS = 0
	
	Begin
		If @Qty > 0
			Begin 
				set @SQLInsStr = @SQLInsStr + 'Comp_' + Cast(@Column as varchar) + ', Comp_' +  Cast(@Column as varchar) + '_Qty'
				Set @SQLValueStr =@SQLValueStr + ''''+ @PN +'''' + ', '+cast(@Qty as varchar)
			End
		Else 
			If @Qty = 0
				Begin
					Set @CommentCnt = @CommentCnt + 1
					Set @SQLInsStr = @SQLInsStr + 'Comm' + Cast(@CommentCnt  as varchar) 
					Set @SQLValueStr = @SQLValueStr +'''' +  'INCLUDE DWG ' + @PN +'''' 
				End 
		
		set @Column=@Column+1



		If @Column <= @TotColCnt 
			Begin
				Set @SQLInsStr = @SQLInsStr + ', '
				Set @SQLValueStr = @SqlValueStr + ', '
			End
					
		Print @PN
		Print @Qty 
		
		Print @column
		Print @Totcolcnt 
			Print @sqlinsstr
		print @sqlvaluestr
		
		Fetch next from Cursor_Comp INTO
			@PN
			,@Qty
	End;

	CLOSE Cursor_Comp;
	Deallocate Cursor_Comp;

	Set @SQLInsStr = @SQLInsStr + ')'
	Set @SQLValueStr = @SQLValueStr + ')'
	Set @sqlstr = @SQLInsStr + @SQLValueStr

	Print @sqlstr

	execute sp_executesql @SqlStr 

Fetch_Next: 
	Fetch next from Cursor_Kit_Brand into @Top_PN, @Top_PN_Brand;
End;
Close Cursor_Kit_Brand
Deallocate Cursor_Kit_Brand 
;

SP_End:





GO
