CREATE TABLE [dbo].[dwn_pdc_IMPEOQ]
(
[I#PART] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PRMF] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#VRFN] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#VEND] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PLTC] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#EOQ] [float] NOT NULL,
[I#CPQP] [float] NOT NULL,
[I#FPQP] [float] NOT NULL,
[I#CDTE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#FDTE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#REVD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CURC] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PBFL] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PBRAND] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
