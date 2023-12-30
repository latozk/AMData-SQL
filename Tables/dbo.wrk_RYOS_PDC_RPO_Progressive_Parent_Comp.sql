CREATE TABLE [dbo].[wrk_RYOS_PDC_RPO_Progressive_Parent_Comp]
(
[Parent] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comp] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[wrk_RYOS_PDC_RPO_Progressive_Parent_Comp] ADD CONSTRAINT [PK_ryos_comp_parent_tmp] PRIMARY KEY CLUSTERED ([Comp], [Parent]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220303-122032] ON [dbo].[wrk_RYOS_PDC_RPO_Progressive_Parent_Comp] ([Parent]) ON [PRIMARY]
GO
