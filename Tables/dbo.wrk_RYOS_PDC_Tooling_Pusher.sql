CREATE TABLE [dbo].[wrk_RYOS_PDC_Tooling_Pusher]
(
[VPN_Pusher] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[wrk_RYOS_PDC_Tooling_Pusher] ADD CONSTRAINT [PK_ryos_pusher_tmp] PRIMARY KEY CLUSTERED ([VPN_Pusher]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220224-203355] ON [dbo].[wrk_RYOS_PDC_Tooling_Pusher] ([VPN_Pusher]) ON [PRIMARY]
GO
