CREATE TABLE [dbo].[res_eng_Current_Unit_Usage]
(
[Init_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Qty] [float] NULL,
[Level] [int] NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Parent] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ID] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Seq] [float] NOT NULL,
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Test_Status] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Unit_Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_Add_Dt] [date] NULL,
[ECN_Rem_Dt] [date] NULL
) ON [PRIMARY]
GO
