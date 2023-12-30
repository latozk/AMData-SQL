CREATE TABLE [dbo].[eng_Comm_Master]
(
[Comm] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Std_Desc] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comm_Grp] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Strat_Comp] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UOM] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Std_Desc_Ass] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comm_ID] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Maj_Comp] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
