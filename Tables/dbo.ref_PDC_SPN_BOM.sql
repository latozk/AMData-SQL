CREATE TABLE [dbo].[ref_PDC_SPN_BOM]
(
[p] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pSPN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PrtType] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[c] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cSPN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[cq] [int] NULL,
[cc] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cd] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[co] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
