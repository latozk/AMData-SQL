CREATE TABLE [dbo].[ref_PDC_Assy_COM]
(
[PARENT_PN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SEQ] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[COMM] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_Assy_COM] ADD CONSTRAINT [PK_ref_PDC_Assy_COM] PRIMARY KEY CLUSTERED ([PARENT_PN], [SEQ]) ON [PRIMARY]
GO
