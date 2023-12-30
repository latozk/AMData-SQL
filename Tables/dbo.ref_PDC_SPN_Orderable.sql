CREATE TABLE [dbo].[ref_PDC_SPN_Orderable]
(
[SPN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Mimic_PN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_SPN_Orderable] ADD CONSTRAINT [PK_ref_PDC_SPN_Orderable] PRIMARY KEY CLUSTERED ([SPN]) ON [PRIMARY]
GO
