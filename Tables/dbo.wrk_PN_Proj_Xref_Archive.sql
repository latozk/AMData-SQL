CREATE TABLE [dbo].[wrk_PN_Proj_Xref_Archive]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Proj] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Init_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Structure] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RunDate] [date] NULL
) ON [PRIMARY]
GO
