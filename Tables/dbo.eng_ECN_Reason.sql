CREATE TABLE [dbo].[eng_ECN_Reason]
(
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Seq] [int] NOT NULL,
[Reason] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[User] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Ent_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Ent_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_ECN_Reason] ADD CONSTRAINT [PK_eng_ECN_Reason] PRIMARY KEY CLUSTERED ([ECN], [Seq]) ON [PRIMARY]
GO
