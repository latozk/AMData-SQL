CREATE TABLE [dbo].[zwrk_eng_Part_Dist_CORE_2021_11_29]
(
[Unit] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Div] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Component_PN] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Structure] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Col] [int] NULL
) ON [PRIMARY]
GO
