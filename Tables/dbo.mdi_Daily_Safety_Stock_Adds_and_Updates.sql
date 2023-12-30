CREATE TABLE [dbo].[mdi_Daily_Safety_Stock_Adds_and_Updates]
(
[PN] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Manual_SS] [int] NULL,
[OVRSL_SS] [int] NULL,
[Comment] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [datetime] NULL CONSTRAINT [DF_mdi_Daily_Safety_Stock_Adds_and_Updates_Date] DEFAULT (CONVERT([date],getdate())),
[Append_Time] [datetime] NULL CONSTRAINT [DF_mdi_Daily_Safety_Stock_Adds_and_Updates_Append_Time] DEFAULT (getdate()),
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mdi_Daily_Safety_Stock_Adds_and_Updates] ADD CONSTRAINT [PK__mdi_Dail__3214EC27FA260608] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20230530-161329] ON [dbo].[mdi_Daily_Safety_Stock_Adds_and_Updates] ([Append_Time]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20230530-161208] ON [dbo].[mdi_Daily_Safety_Stock_Adds_and_Updates] ([Manual_SS]) ON [PRIMARY]
GO
