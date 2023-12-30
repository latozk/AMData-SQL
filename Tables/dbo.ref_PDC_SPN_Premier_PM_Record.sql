CREATE TABLE [dbo].[ref_PDC_SPN_Premier_PM_Record]
(
[PN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Mimic_PN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dPN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Category] [varchar] (58) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comm] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Combi] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Alpha] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DS] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NsCd] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrdCls] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrdTyp] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrtType] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OC] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SC] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PkgCd] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PkgQty] [float] NULL
) ON [PRIMARY]
GO
