CREATE TABLE [dbo].[wrk_eng_Part_Dist_CORE_Archive]
(
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[List] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dist_Div] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[No_Usg] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Component_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Structure] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Col] [int] NULL,
[Rundate] [date] NULL
) ON [PRIMARY]
GO
