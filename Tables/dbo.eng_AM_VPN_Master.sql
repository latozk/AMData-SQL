CREATE TABLE [dbo].[eng_AM_VPN_Master]
(
[Abbr] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AMPN_VPN] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Vend_Div] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Allmakes] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_EPO_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VASP_List_Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Proj] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EPO] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Equiv] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VASP_CAN_ECN_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VASP_CAN_ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NSS] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_EPO_Dt] [date] NULL,
[VASP_CAN_ECN_Dt] [date] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200831-133910] ON [dbo].[eng_AM_VPN_Master] ([Abbr], [PN]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20200831-133834] ON [dbo].[eng_AM_VPN_Master] ([PN]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[eng_AM_VPN_Master] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT SELECT ON  [dbo].[eng_AM_VPN_Master] TO [GLOBAL\PDC_AMData_Marketing]
GO
GRANT DELETE ON  [dbo].[eng_AM_VPN_Master] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[eng_AM_VPN_Master] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[eng_AM_VPN_Master] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[eng_AM_VPN_Master] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
