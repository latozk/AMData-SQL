CREATE TABLE [dbo].[wrk_PN_Reverse_Structure_Row_Processed]
(
[Row#] [int] NOT NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[wrk_PN_Reverse_Structure_Row_Processed] ADD CONSTRAINT [PK_wrk_PN_Reverse_Structure_Row_Processed] PRIMARY KEY CLUSTERED ([Row#]) ON [PRIMARY]
GO
