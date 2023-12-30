CREATE TABLE [dbo].[merch_Req_PDC_Rdns_Queue]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
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
[AMHyster] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMHysterAbr] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMHysterNme] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMHysterHYLFmt] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMYale] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMYaleAbr] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMYaleNme] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMYaleHYLFmt] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMUtilev] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMUtilevAbr] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMUtilevNme] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMUtilevHYLFmt] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMNuvera] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMNuveraAbr] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMNuveraNme] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMNuveraHYLFmt] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMRico] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMRicoAbr] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMRicoNme] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMRicoHYLFmt] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VIPNum] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevLvl] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AppendDt] [datetime] NULL,
[AutoNumber] [int] NULL,
[DSNNme] [nvarchar] (243) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[VIPNnum] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Requestor] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECNOvrd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjectOvrd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Received] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[merch_Req_PDC_Rdns_Queue] ADD CONSTRAINT [PK_merch_Req_Rdns_Queue] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[merch_Req_PDC_Rdns_Queue] TO [GLOBAL\AP Parts Readiness]
GO
GRANT INSERT ON  [dbo].[merch_Req_PDC_Rdns_Queue] TO [GLOBAL\AP Parts Readiness]
GO
GRANT SELECT ON  [dbo].[merch_Req_PDC_Rdns_Queue] TO [GLOBAL\AP Parts Readiness]
GO
GRANT UPDATE ON  [dbo].[merch_Req_PDC_Rdns_Queue] TO [GLOBAL\AP Parts Readiness]
GO
GRANT SELECT ON  [dbo].[merch_Req_PDC_Rdns_Queue] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT DELETE ON  [dbo].[merch_Req_PDC_Rdns_Queue] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[merch_Req_PDC_Rdns_Queue] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[merch_Req_PDC_Rdns_Queue] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[merch_Req_PDC_Rdns_Queue] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
