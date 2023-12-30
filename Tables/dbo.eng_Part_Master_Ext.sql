CREATE TABLE [dbo].[eng_Part_Master_Ext]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[JA_Rev] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Similar_Part] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Weight_kg] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MSDS] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comp_Ref] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Key_Char] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Matl_Spec] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Matl_Note] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cat] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UNSPSC] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[JA_Part_Desc_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[JA_Part_Desc_3] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Agile_Mstr] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_Part_Master_Ext] ADD CONSTRAINT [PK_eng_Part_Master_Ext] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_eng_Part_Master_Ext_PN] ON [dbo].[eng_Part_Master_Ext] ([PN]) ON [PRIMARY]
GO
