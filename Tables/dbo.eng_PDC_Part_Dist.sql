CREATE TABLE [dbo].[eng_PDC_Part_Dist]
(
[PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Unit] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_eng_PDC_Part_Dist_PN] ON [dbo].[eng_PDC_Part_Dist] ([PN]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_eng_PDC_Part_Dist_PN_Unit] ON [dbo].[eng_PDC_Part_Dist] ([PN], [Unit]) ON [PRIMARY]
GO
