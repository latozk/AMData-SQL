CREATE TABLE [dbo].[ref_PDC_SPN_X_Ref]
(
[SPN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Category] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_SPN_X_Ref] ADD CONSTRAINT [PK_ref_PDC_SPN_X_Ref] PRIMARY KEY CLUSTERED ([SPN], [PN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20230314-104937] ON [dbo].[ref_PDC_SPN_X_Ref] ([PN]) ON [PRIMARY]
GO
