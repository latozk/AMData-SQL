CREATE TABLE [dbo].[ref_PDC_Assy_BOM]
(
[BRAND] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ALT_BUILD] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENT_PN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PART_TYPE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ASSY_LENGTH] [decimal] (16, 2) NULL,
[VENDOR] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[COMP] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[COMP_QTY] [decimal] (16, 0) NULL,
[COMP_CUT_TO] [decimal] (16, 2) NULL,
[COMP_COMM] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REV_DT] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_Assy_BOM] ADD CONSTRAINT [PK_ref_PDC_Assy_BOM] PRIMARY KEY CLUSTERED ([BRAND], [PARENT_PN], [COMP]) ON [PRIMARY]
GO
