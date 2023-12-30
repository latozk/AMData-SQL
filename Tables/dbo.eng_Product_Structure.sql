CREATE TABLE [dbo].[eng_Product_Structure]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Seq] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comp] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_Add_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UOM] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Usg_Qty] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Opt] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_Rem_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_Add_DT] [date] NULL,
[ECN_Rem_DT] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_Product_Structure] ADD CONSTRAINT [PK_eng_Product_Structure_1] PRIMARY KEY NONCLUSTERED ([PN], [Seq], [Comp], [ECN_Add_Date]) ON [PRIMARY]
GO
