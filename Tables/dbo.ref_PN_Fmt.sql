CREATE TABLE [dbo].[ref_PN_Fmt]
(
[PN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SVG] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CORE] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PM_Entry] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DB_Entry] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PN_Fmt] ADD CONSTRAINT [PK_ref_PN_Fmt] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
