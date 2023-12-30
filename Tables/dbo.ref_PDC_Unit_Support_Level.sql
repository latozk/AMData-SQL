CREATE TABLE [dbo].[ref_PDC_Unit_Support_Level]
(
[ID] [float] NOT NULL,
[Desc] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_Unit_Support_Level] ADD CONSTRAINT [PK_ref_PDC_Unit_Support_Level] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
