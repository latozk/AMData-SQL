CREATE TABLE [dbo].[eng_Agile_Distribution_ADDs]
(
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Final_Assy] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Lst_Chg_Date] [float] NOT NULL,
[Lst_Chg_Dt] [date] NULL,
[Lst_Chg_Time] [float] NOT NULL,
[Lst_Chg_User] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20220314-095354] ON [dbo].[eng_Agile_Distribution_ADDs] ([Unit], [Contract], [Div], [PN]) ON [PRIMARY]
GO
