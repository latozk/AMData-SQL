CREATE TABLE [dbo].[eng_Div]
(
[Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_Div] ADD CONSTRAINT [PK_eng_Eng_Division] PRIMARY KEY CLUSTERED ([Div]) ON [PRIMARY]
GO
