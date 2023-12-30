CREATE TABLE [dbo].[eng_PN_Proj_Xref]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Proj] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Init_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Structure] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20200508-101833] ON [dbo].[eng_PN_Proj_Xref] ([PN], [Proj], [Init_PN], [Structure]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_ref_PN_Proj_Xref_Proj_PN] ON [dbo].[eng_PN_Proj_Xref] ([Proj], [PN]) ON [PRIMARY]
GO
