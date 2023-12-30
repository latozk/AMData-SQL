CREATE TABLE [dbo].[hose_Fitting_ONeil]
(
[PROD #] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HYS #] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YAL #] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SERIES] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VENDOR] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN PUSHER] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[THREAD/FLANGE] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HOSE ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HOSE TYPE] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COA] [decimal] (18, 4) NULL,
[BASE PN] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PERM/REUSE] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REF] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INITIALS] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE&TIME STAMP] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OPT VENDOR #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hose_Fitting_ONeil] ADD CONSTRAINT [PK_hose_Fitting_ONeil] PRIMARY KEY CLUSTERED ([PROD #]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting_ONeil] TO [GLOBAL\apyoulha]
GO
