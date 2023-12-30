CREATE TABLE [dbo].[chain_BOM]
(
[Man_Add_AS400] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initials] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProdPNOld] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProdPN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HPN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YPN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bulk_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Qty_Feet] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CutTo_Inches] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Qty_Links] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Chart] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print/Chart_Req] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Standard] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Origin_Date] [date] NULL,
[Maint_Date] [date] NULL,
[Memo] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PDC_Only_Comments] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assy_Comments] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Chain_Type] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Original_Table] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pin_Link_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pin_Link_Qty] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Outer_Link_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Outer_Link_Qty] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inner_Link_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inner_Link_Qty] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Anchor_A_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Anchor_A_Qty] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Anchor_B_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Anchor_B_Qty] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date/Time_Stamp] [datetime2] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chain_BOM] ADD CONSTRAINT [PK_chain_BOM] PRIMARY KEY CLUSTERED ([ProdPN]) ON [PRIMARY]
GO
