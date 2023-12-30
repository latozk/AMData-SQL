CREATE TABLE [dbo].[zeng_Product_Structure]
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
ALTER TABLE [dbo].[zeng_Product_Structure] ADD CONSTRAINT [PK_eng_Product_Structure] PRIMARY KEY NONCLUSTERED ([PN], [Seq], [Comp], [ECN_Add_Date]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [eng_Product_Structure_Comp_Part_No] ON [dbo].[zeng_Product_Structure] ([Comp]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_eng_Product_Structure_PN] ON [dbo].[zeng_Product_Structure] ([PN]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20200506-090259] ON [dbo].[zeng_Product_Structure] ([PN], [Comp]) ON [PRIMARY]
GO
