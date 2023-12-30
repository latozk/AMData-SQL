CREATE TABLE [dbo].[eng_Unit_Div_ML_GL]
(
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Seq] [float] NOT NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_Add_Date] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_Rem_Date] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Test_Status] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Unit_Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_Add_Dt] [date] NULL,
[ECN_Rem_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_Unit_Div_ML_GL] ADD CONSTRAINT [PK_eng_unit_Div_ML_GL] PRIMARY KEY CLUSTERED ([Unit], [Contract], [Div], [Seq], [PN], [ECN_Add_Date]) ON [PRIMARY]
GO
