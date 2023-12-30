CREATE TABLE [dbo].[sysssislog]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[event] [sys].[sysname] NOT NULL,
[computer] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[operator] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[source] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sourceid] [uniqueidentifier] NOT NULL,
[executionid] [uniqueidentifier] NOT NULL,
[starttime] [datetime] NOT NULL,
[endtime] [datetime] NOT NULL,
[datacode] [int] NOT NULL,
[databytes] [image] NULL,
[message] [nvarchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[sysssislog] ADD CONSTRAINT [PK__sysssisl__3213E83FF20DF9E9] PRIMARY KEY CLUSTERED ([id]) ON [PRIMARY]
GO
