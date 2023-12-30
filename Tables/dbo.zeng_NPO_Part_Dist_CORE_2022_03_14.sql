CREATE TABLE [dbo].[zeng_NPO_Part_Dist_CORE_2022_03_14]
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
