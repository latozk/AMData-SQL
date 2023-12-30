CREATE TABLE [dbo].[eng_ECN_Tran]
(
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Tran] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Key_1] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Key_2] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Key_3] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Reason] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Proc_Flag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Seq] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Unit_Contract] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CO] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[COR_AGL_Crt] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Audit_Last_Chg_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Audit_Last_Chg_Time] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Audit_Last_Chg_User] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Audit_Last_Chg_Dt] [date] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200722-152749] ON [dbo].[eng_ECN_Tran] ([Key_3], [Unit_Contract]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'ECN Number', 'SCHEMA', N'dbo', 'TABLE', N'eng_ECN_Tran', 'COLUMN', N'ECN'
GO
