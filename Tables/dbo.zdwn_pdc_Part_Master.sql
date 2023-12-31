CREATE TABLE [dbo].[zdwn_pdc_Part_Master]
(
[I#PART] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PRTD] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#ORGD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#ORDQ] [float] NOT NULL,
[I#BOQT] [float] NOT NULL,
[I#CMQT] [float] NOT NULL,
[I#ERQT] [float] NOT NULL,
[I#ORDC] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#FRCM] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#SRCC] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#NSTC] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#AQCD] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#SCRT] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#NPGT] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PKGC] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#APKG] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CTVC] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PPCL] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PPTY] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#NRPT] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PRTT] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#VLDT] [float] NOT NULL,
[I#FLDT] [float] NOT NULL,
[I#SLDT] [float] NOT NULL,
[I#NOLQ] [float] NOT NULL,
[I#SOLQ] [float] NOT NULL,
[I#3MOT] [float] NOT NULL,
[I#SUSQ] [float] NOT NULL,
[I#RTDC] [float] NOT NULL,
[I#MAVQ] [float] NOT NULL,
[I#MAD] [float] NOT NULL,
[I#ORDP] [float] NOT NULL,
[I#EOQ] [float] NOT NULL,
[I#PKGQ] [float] NOT NULL,
[I#DSTG] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CPCD] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#VNDC] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CONS] [float] NOT NULL,
[I#DLRN] [float] NOT NULL,
[I#STDC] [float] NOT NULL,
[I#SOHQ] [float] NOT NULL,
[I#CLCR] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#LOCT] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#INVS] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PRDS] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#MKTC] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#INAD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PRDL] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#3MSL] [float] NOT NULL,
[I#12MS] [float] NOT NULL,
[I#12MU] [float] NOT NULL,
[I#12MO] [float] NOT NULL,
[I#P3SL] [float] NOT NULL,
[I#P12S] [float] NOT NULL,
[I#P12U] [float] NOT NULL,
[I#P12O] [float] NOT NULL,
[I#P3MO] [float] NOT NULL,
[I#C3SL] [float] NOT NULL,
[I#C12S] [float] NOT NULL,
[I#C12U] [float] NOT NULL,
[I#C12O] [float] NOT NULL,
[I#BRND] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#COMM] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#MLCT] [float] NOT NULL,
[I#MLSH] [float] NOT NULL,
[I#12ML] [float] NOT NULL,
[I#12MC] [float] NOT NULL,
[I#12SO] [float] NOT NULL,
[I#STSC] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#LRCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#VPPO] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#UNTC] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CLF] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#TRND] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#RPLD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#ALCT] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#RSTG] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#SLSD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CNGR] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CNQT] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#ALPH] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#STKP] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#INSC] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CURT] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CDTM] [varchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#FILL] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
