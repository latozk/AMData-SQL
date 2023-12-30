CREATE TABLE [dbo].[eng_Proj_Master]
(
[Proj] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[User_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Last_EPO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Last_Problem] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Prefix] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Model_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Model_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Model_3] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Model_4] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Open_Date] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Close_Date] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Procur_Coordinator] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CO_Eff_Date] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SI] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Prod_Cat] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GDMS_Track] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BPM_Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Open_Dt] [date] NULL,
[Close_Dt] [date] NULL,
[CO_Eff_Dt] [date] NULL
) ON [PRIMARY]
GO
