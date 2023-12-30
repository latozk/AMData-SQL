CREATE TABLE [dbo].[wrk_eng_Part_Dist_CORE]
(
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Component_PN] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Structure] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Col] [int] NULL
) ON [PRIMARY]
GO
