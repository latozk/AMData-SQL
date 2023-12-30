CREATE TABLE [dbo].[wrk_RYOS_PDC_Tooling_Ring]
(
[VPN_Ring] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[wrk_RYOS_PDC_Tooling_Ring] ADD CONSTRAINT [PK_ryos_ring_tmp] PRIMARY KEY CLUSTERED ([VPN_Ring]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220224-203424] ON [dbo].[wrk_RYOS_PDC_Tooling_Ring] ([VPN_Ring]) ON [PRIMARY]
GO
