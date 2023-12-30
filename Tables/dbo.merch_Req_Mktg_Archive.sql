CREATE TABLE [dbo].[merch_Req_Mktg_Archive]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Date] [datetime] NULL,
[Name] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendorcode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor Number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Additional Info] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reman Number] [nvarchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hyster] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Yale] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Utilev] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Nuvera] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initials] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Edit Date] [datetime] NULL,
[R&R and Reman - Vendor Reman] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rev] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VIP #] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Non-Returnable] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Commoditycode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DS code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Leadtime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CNVPN (Y/N)] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PQcost] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DlrNet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HysterCL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YaleCL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Corecharge] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewHysterEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewYaleEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewUtilevEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewNuveraEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[merch_Req_Mktg_Archive] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT INSERT ON  [dbo].[merch_Req_Mktg_Archive] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT SELECT ON  [dbo].[merch_Req_Mktg_Archive] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT UPDATE ON  [dbo].[merch_Req_Mktg_Archive] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT DELETE ON  [dbo].[merch_Req_Mktg_Archive] TO [GLOBAL\PDC_AMData_Marketing]
GO
GRANT INSERT ON  [dbo].[merch_Req_Mktg_Archive] TO [GLOBAL\PDC_AMData_Marketing]
GO
GRANT SELECT ON  [dbo].[merch_Req_Mktg_Archive] TO [GLOBAL\PDC_AMData_Marketing]
GO
GRANT UPDATE ON  [dbo].[merch_Req_Mktg_Archive] TO [GLOBAL\PDC_AMData_Marketing]
GO
