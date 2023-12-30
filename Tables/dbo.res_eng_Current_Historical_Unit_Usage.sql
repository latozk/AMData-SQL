CREATE TABLE [dbo].[res_eng_Current_Historical_Unit_Usage]
(
[Init_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Qty] [float] NULL,
[ID] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Level] [int] NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN_Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAN_Dt] [date] NULL,
[PN_PS_ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN_PS_Seq] [float] NULL,
[PN_PS_Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN_PS_ADD__Dt] [date] NULL,
[PN_PS_REM_Dt] [date] NULL,
[Parent] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Parent_PS_ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Parent_PS_Seq] [float] NULL,
[Parent_PS_Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Parent_PS_ADD__Dt] [date] NULL,
[Parent_PS_REM_Dt] [date] NULL,
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20231030-194738] ON [dbo].[res_eng_Current_Historical_Unit_Usage] ([Init_PN]) ON [PRIMARY]
GO
