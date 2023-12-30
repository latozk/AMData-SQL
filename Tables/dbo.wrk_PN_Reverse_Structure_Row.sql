CREATE TABLE [dbo].[wrk_PN_Reverse_Structure_Row]
(
[Row#] [int] NOT NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[wrk_PN_Reverse_Structure_Row] ADD CONSTRAINT [PK_wrk_PN_Reverse_Structure] PRIMARY KEY CLUSTERED ([Row#]) ON [PRIMARY]
GO
