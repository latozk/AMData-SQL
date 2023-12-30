CREATE TABLE [dbo].[ref_PDC_SPN_Mimic_PN]
(
[SPN] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Mimic_PN] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Category] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20230314-104502] ON [dbo].[ref_PDC_SPN_Mimic_PN] ([SPN]) ON [PRIMARY]
GO
