CREATE TABLE [dbo].[ref_PDC_Proj_Master]
(
[Proj] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Track] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cmpl] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RG_Type] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gate] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rel_Dt] [date] NULL,
[Impl_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_Proj_Master] ADD CONSTRAINT [PK_ref_PDC_Proj_Master_2] PRIMARY KEY CLUSTERED ([Proj]) ON [PRIMARY]
GO
