CREATE TABLE [dbo].[eng_NPO_Part_Dist_CORE]
(
[Unit] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Div] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[List] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Col] [int] NULL,
[Structure_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Structure] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Dist_Div] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20221024-143851] ON [dbo].[eng_NPO_Part_Dist_CORE] ([Unit], [Contract], [Div], [List], [PN]) ON [PRIMARY]
GO
