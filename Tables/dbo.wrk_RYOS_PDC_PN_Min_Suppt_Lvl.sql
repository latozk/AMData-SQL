CREATE TABLE [dbo].[wrk_RYOS_PDC_PN_Min_Suppt_Lvl]
(
[PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Support_ID] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[wrk_RYOS_PDC_PN_Min_Suppt_Lvl] ADD CONSTRAINT [PK_ryos_min_suppt_lvl_tmp] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220224-202758] ON [dbo].[wrk_RYOS_PDC_PN_Min_Suppt_Lvl] ([PN]) ON [PRIMARY]
GO
