SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create View [dbo].[zeng_ECN_VIP_Concat_pl] as
select ec.* from eng_ECN_VIP_Concat ec
join inp_Picklist_Co pl
on ec.ecn = pl.ECN

GO
