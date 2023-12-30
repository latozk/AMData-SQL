CREATE TABLE [dbo].[pdc_Parts_Master_Component_Parent]
(
[CP_Parent_Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CP_Comp_Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CP_Comp_Qty] [int] NULL,
[CP_Comp_Comment] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CP_Eff_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CP_Assm_Opt_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
