SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE Procedure [dbo].[sp_etl_Upd_ref_Table_Dictionary] @tbl_Key varchar(50), @Upd_Type varchar(10), @Row_Cnt int = 0 as 

Declare @SQL_Str varchar(Max)
Declare @Dwn_Rec_Cnt int 

Print @tbl_Key
Print @row_Cnt
Print @Upd_Type 

If @Upd_Type = 'Active'
Begin 
Update ref_Table_Dictionary set etl_Flag = 'A'
, etl_Start_dt = Getdate()
--,  prev_Dest_Rec_Cnt = Dest_Rec_Cnt  
where tbl_Key = @tbl_Key
End 

If @Upd_Type = 'Post'
Begin  
    Update ref_Table_Dictionary set etl_Flag = 'C' 
        , etl_End_dt = Getdate()
        , etl_Rec_Cnt = @Row_Cnt
    where tbl_Key = @tbl_Key 
End


If @Upd_Type = 'Error'
Begin  
    Update ref_Table_Dictionary set etl_Flag = 'E' 
        , etl_End_Dt = Getdate()
    where tbl_Key = @tbl_Key
End


--exec sp_etl_Upd_Ref_Table_Master 'dwn_IMPDLR', 'Post', 500



GO
