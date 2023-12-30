CREATE TABLE [dbo].[sys_Master_Table_Load]
(
[Source_System] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Source_Library] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Source_Table] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Destination_System] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Destination_DB] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Destination_Table] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartLoad] [datetime] NULL,
[LastLoadDate] [datetime] NULL,
[SourceRecCount] [int] NULL,
[DestRecCount] [int] NULL,
[PrevSQLRecCount] [int] NULL,
[ReadyToLoad] [bit] NULL CONSTRAINT [DF_Master_Data_Load_ReadyToLoad] DEFAULT ((0)),
[JobGroup] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[sys_Master_Table_Load] ADD CONSTRAINT [PK_Master_Data_Load] PRIMARY KEY CLUSTERED ([Source_System], [Source_Library], [Source_Table]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Ready to Load Data 0=False; 1=True', 'SCHEMA', N'dbo', 'TABLE', N'sys_Master_Table_Load', 'COLUMN', N'ReadyToLoad'
GO
