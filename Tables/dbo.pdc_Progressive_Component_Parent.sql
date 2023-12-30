CREATE TABLE [dbo].[pdc_Progressive_Component_Parent]
(
[PG_Parent_Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PG_Comp_Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PG_Comp_Qty] [int] NULL,
[PG_Comp_Comment] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PG_Eff_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PG_Assm_Opt_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
