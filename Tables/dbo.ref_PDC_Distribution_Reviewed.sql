CREATE TABLE [dbo].[ref_PDC_Distribution_Reviewed]
(
[PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Append_Dt] [datetime2] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_Distribution_Reviewed] ADD CONSTRAINT [PK_ref_PDC_Distribution_Reviewed] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20221025-190128] ON [dbo].[ref_PDC_Distribution_Reviewed] ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[ref_PDC_Distribution_Reviewed] TO [GLOBAL\AP Parts Readiness]
GO
GRANT INSERT ON  [dbo].[ref_PDC_Distribution_Reviewed] TO [GLOBAL\AP Parts Readiness]
GO
GRANT SELECT ON  [dbo].[ref_PDC_Distribution_Reviewed] TO [GLOBAL\AP Parts Readiness]
GO
GRANT UPDATE ON  [dbo].[ref_PDC_Distribution_Reviewed] TO [GLOBAL\AP Parts Readiness]
GO
