CREATE TABLE [dbo].[eng_Part_ECN_History]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rev] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Eff_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_Dt] [date] NULL,
[Eff_Dt] [date] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_eng_Part_ECN_History_ecn] ON [dbo].[eng_Part_ECN_History] ([ECN]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_eng_Part_ECN_History_PN_ECN] ON [dbo].[eng_Part_ECN_History] ([PN], [ECN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20210616-114627] ON [dbo].[eng_Part_ECN_History] ([PN], [Rel_Dt]) ON [PRIMARY]
GO
