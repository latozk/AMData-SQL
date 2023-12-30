CREATE TABLE [dbo].[hose_Bulk_ONeil]
(
[PROD #] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HYS #] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YAL #] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HCE] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SPEC NO] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VENDOR] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SERIES] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRIMP FTG SERIES] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REUSE FTG SERIES] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DIE REQ] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN DIE] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RING REQ] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN RING] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INITIALS] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STOCKED] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMMENTS] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OPT VENDOR #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hose_Bulk_ONeil] ADD CONSTRAINT [PK_hose_Bulk_ONeil] PRIMARY KEY CLUSTERED ([PROD #]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk_ONeil] TO [GLOBAL\apwconne]
GO
