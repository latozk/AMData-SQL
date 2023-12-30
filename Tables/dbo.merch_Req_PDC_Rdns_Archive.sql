CREATE TABLE [dbo].[merch_Req_PDC_Rdns_Archive]
(
[ID] [int] NOT NULL,
[Date] [datetime] NULL,
[Requestedby] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendorcode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VendorPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NonReturnable] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Commoditycode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DScode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product_Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Leadtime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CNVPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PQcost] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DlrNet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HysterCL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YaleCL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoreCharge] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewHysterEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewYaleEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewUtilevEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewNuveraEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewRicoEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reman] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HysterPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YalePN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UtilevPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NuveraPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RicoPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initials] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rev#] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hyster_PN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Yale_PN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VIPNum] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevLvl] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AppendDt] [datetime] NULL,
[AutoNumber] [int] NULL,
[PrtLen] [smallint] NULL,
[PkgQty] [smallint] NULL,
[EAR] [int] NULL,
[BuyQty] [int] NULL,
[DwgSiz] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RlsDte] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SrvPrb] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StkDsp] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChtNum] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ITCls] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WECls] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ELCls] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMCls] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UorSCd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WelInd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SPInd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRPCls] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Requestor] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECNOvrd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjectOvrd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Received] [datetime] NULL,
[Processed] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[merch_Req_PDC_Rdns_Archive] ADD CONSTRAINT [PK_merch_Req_Rdns_Archive] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[merch_Req_PDC_Rdns_Archive] TO [GLOBAL\AP Parts Readiness]
GO
GRANT INSERT ON  [dbo].[merch_Req_PDC_Rdns_Archive] TO [GLOBAL\AP Parts Readiness]
GO
GRANT SELECT ON  [dbo].[merch_Req_PDC_Rdns_Archive] TO [GLOBAL\AP Parts Readiness]
GO
GRANT UPDATE ON  [dbo].[merch_Req_PDC_Rdns_Archive] TO [GLOBAL\AP Parts Readiness]
GO
GRANT DELETE ON  [dbo].[merch_Req_PDC_Rdns_Archive] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[merch_Req_PDC_Rdns_Archive] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[merch_Req_PDC_Rdns_Archive] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[merch_Req_PDC_Rdns_Archive] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
