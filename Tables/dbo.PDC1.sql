CREATE TABLE [dbo].[PDC1]
(
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[List] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Col] [int] NULL,
[Structure_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Structure] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dist_Div] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
