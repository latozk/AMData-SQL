CREATE TABLE [dbo].[ref_PDC_DC_BT_Jumbo_Unique]
(
[PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_DC_BT_Jumbo_Unique] ADD CONSTRAINT [PK_ref_PDC_DC_BT_Jumbo_Unique] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
