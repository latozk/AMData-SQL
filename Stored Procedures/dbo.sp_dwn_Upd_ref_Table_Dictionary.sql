SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE Procedure [dbo].[sp_dwn_Upd_ref_Table_Dictionary] @tbl_Key varchar(50), @Upd_Type varchar(10), @Row_Cnt int = 0 as 

--Declare @Src_Tbl nvarchar(20)
Declare @Dwn_Rec_Cnt int 
Declare @SQL_Cmd_Str as nvarchar(255)

Print @tbl_Key
Print @Upd_Type
Print @Row_Cnt

--***
--Exec sp_dwn_Upd_ref_Table_Master 'IMPDLR', 'Post'

--set @Src_Tbl = (Select Src_Tbl from ref_Table_Master where Dwn_Tbl=@Dwn_Tbl)
--Print @Src_Tbl 

If @Upd_Type = 'Active'
Begin 
Update ref_Table_Dictionary set dwn_Flag = 'A'
, dwn_Start_Dt = Getdate()
,  prev_Dwn_Rec_Cnt = Dwn_Rec_Cnt  
where tbl_key = @tbl_Key
End 

Else 
If @Upd_Type = 'Post'
Begin  
--Update IMPDWNLD table on ISeries
--Set @SQL_Cmd_Str = 'UPDATE OPENQUERY(AP4PDC, '  + '''' + 'Select * from pdcdata.impdwnld where src_tbl = '  + ''''''  + @Src_Tbl +''''''  + ''') SET DWN_Flag = '  +  '''' + 'C' + '''' + ', Dwn_DT=GETDATE()'
--Set @SQL_Cmd_Str = 'UPDATE impdwnld SET DWN_Flag = ' + '''' + 'C'  + '''' + ', dwn_Dt = GETDATE() Where src_Tbl = ' + ''''  + @Src_Tbl + '''' 

--execute sp_executesql @sql_cmd_str;

    Update ref_Table_Dictionary 
		set dwn_Flag = 'C' 
		, dwn_Rec_Cnt = @Row_Cnt
		, dwn_End_Dt = Getdate()
     where tbl_Key = @tbl_Key ;
   

	Update ref_Table_Dictionary
		set etl_Flag = 'R'
        , etl_Flag_dt = Getdate()
	where tbl_Key = @tbl_Key 
	and not etl_Flag  in ('E', 'M', 'A');


End

--print @sql_cmd_str


If @Upd_Type = 'Error'
Begin  
    Update ref_Table_Dictionary set dwn_Flag = 'E' 
        , etl_Flag = ''
        , dwn_End_Dt = Getdate()
    where tbl_Key = @tbl_Key  
End


GO
