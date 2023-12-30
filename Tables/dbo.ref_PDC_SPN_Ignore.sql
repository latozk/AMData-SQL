CREATE TABLE [dbo].[ref_PDC_SPN_Ignore]
(
[SPN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Category] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SPNCount] [int] NULL
) ON [PRIMARY]
GO
