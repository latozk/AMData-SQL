CREATE TABLE [dbo].[ref_Load_Dependencies]
(
[tbl_Key] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Prerequisite] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_Load_Dependencies] ADD CONSTRAINT [PK_ref_Load_Dependencies] PRIMARY KEY CLUSTERED ([tbl_Key], [Prerequisite]) ON [PRIMARY]
GO
