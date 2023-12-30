CREATE TABLE [dbo].[ref_PDC_Support_by_Market_Area]
(
[SupptLvlDesc] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MktGrp3] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MktArea] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SupptLvlCd] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_Support_by_Market_Area] ADD CONSTRAINT [PK_ref_PDC_Support_by_Market_Area] PRIMARY KEY CLUSTERED ([MktGrp3]) ON [PRIMARY]
GO
