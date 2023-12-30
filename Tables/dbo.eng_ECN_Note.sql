CREATE TABLE [dbo].[eng_ECN_Note]
(
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Seq] [int] NOT NULL,
[Note] [varchar] (220) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[User_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Ent_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Ent_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_ECN_Note] ADD CONSTRAINT [PK_eng_ECN_Note] PRIMARY KEY CLUSTERED ([ECN], [Seq]) ON [PRIMARY]
GO
