SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create View [dbo].[eng_ECN_Key_1_Loc_Concat_pl] as
select ec.* from eng_ECN_Key_1_Loc_Concat ec
join inp_Picklist_Co pl
on ec.ecn = pl.ECN

GO
