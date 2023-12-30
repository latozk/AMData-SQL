CREATE TABLE [dbo].[ref_CORE_AM]
(
[Prod_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AM_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc_3] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dwg_Size] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dwg_Ctrl] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AM_Brand] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200722-212439] ON [dbo].[ref_CORE_AM] ([AM_PN]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20200722-184728] ON [dbo].[ref_CORE_AM] ([Prod_PN], [AM_Brand]) ON [PRIMARY]
GO
