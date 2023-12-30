SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Procedure [dbo].[sp_Chk_IMPDWNLD] as 
Update ref_Table_Dictionary
Set dwn_Flag = 'R'
, dwn_Flag_dt = Getdate() 
, Src_Rec_Cnt = r.Rec_Cnt 
From vw_IMPDWNLD_Ready R
Inner Join ref_Table_Dictionary tm
on --r.Src_Lib = tm.Src_Lib and 
r.tbl_Key = tm.tbl_Key
GO
