CREATE TABLE [dbo].[merch_Req_PDC_Rdns_New_Data_Archive]
(
[AppendDt] [datetime] NULL,
[ECNNum] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrjNum] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UsrID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PNUC] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HYLFmt] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN_Y/N] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HysterPN_Y/N] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HysterPN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HysterUC] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YalePN_Y/N] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YalePN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YaleUC] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UtilevPN_Y/N] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UtilevPN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UtilevUC] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NuveraPN_Y/N] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NuveraPN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NuveraUC] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RicoPN_Y/N] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RicoPN] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RicoUC] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrtDs1] [nvarchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrtDs2] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrtDs3] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrPTyp] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MktCls] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SafStk] [int] NULL,
[NonStk] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrdCC] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StaCod] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DirShp] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VC] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InPlnt] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Source] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LT] [decimal] (18, 1) NULL,
[RepPrt] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ComCde] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRSer] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CNVPN (Y/N)] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VndPrt] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VndNme] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VndAbr] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMHyster] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMHysterAbr] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMHysterNme] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMYale] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMYaleAbr] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMYaleNme] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMUtilev] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMUtilevAbr] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMUtilevNme] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMNuvera] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMNuveraAbr] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMNuveraNme] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VIPNum] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevLvl] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoNumber] [int] NOT NULL IDENTITY(1, 1),
[DSNNme] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrtLen] [smallint] NULL,
[PkgQty] [smallint] NULL,
[EAR] [int] NULL,
[BuyQty] [int] NULL,
[DwgSiz] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RlsDte] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SrvPrb] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StkDsp] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChtNum] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ITCls] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WECls] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ELCls] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMCls] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UorSCd] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WelInd] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SPInd] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRPCls] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VIPNnum] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Requestor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECNOvrd] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProjectOvrd] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HCC] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hazmat] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ServiceFlag] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EffDate] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[merch_Req_PDC_Rdns_New_Data_Archive] ADD CONSTRAINT [PK_merch_Req_PDC_Rdns_New_Data_Archive] PRIMARY KEY CLUSTERED ([AutoNumber]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[merch_Req_PDC_Rdns_New_Data_Archive] TO [GLOBAL\AP Parts Readiness]
GO
GRANT INSERT ON  [dbo].[merch_Req_PDC_Rdns_New_Data_Archive] TO [GLOBAL\AP Parts Readiness]
GO
GRANT SELECT ON  [dbo].[merch_Req_PDC_Rdns_New_Data_Archive] TO [GLOBAL\AP Parts Readiness]
GO
GRANT UPDATE ON  [dbo].[merch_Req_PDC_Rdns_New_Data_Archive] TO [GLOBAL\AP Parts Readiness]
GO
GRANT DELETE ON  [dbo].[merch_Req_PDC_Rdns_New_Data_Archive] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[merch_Req_PDC_Rdns_New_Data_Archive] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[merch_Req_PDC_Rdns_New_Data_Archive] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[merch_Req_PDC_Rdns_New_Data_Archive] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
