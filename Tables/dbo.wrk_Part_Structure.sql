CREATE TABLE [dbo].[wrk_Part_Structure]
(
[Init_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Col] [int] NULL,
[Parent_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Component_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200508-145811] ON [dbo].[wrk_Part_Structure] ([Init_PN]) ON [PRIMARY]
GO
