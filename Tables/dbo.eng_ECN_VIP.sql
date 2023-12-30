CREATE TABLE [dbo].[eng_ECN_VIP]
(
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VIP] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_ECN_VIP] ADD CONSTRAINT [PK_eng_ECN_VIP] PRIMARY KEY CLUSTERED ([ECN], [VIP]) ON [PRIMARY]
GO
