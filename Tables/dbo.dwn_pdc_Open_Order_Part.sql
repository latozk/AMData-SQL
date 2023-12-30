CREATE TABLE [dbo].[dwn_pdc_Open_Order_Part]
(
[I#PRTN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#ORDT] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#VNDC] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PONO] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#REQD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#OPNQ] [int] NOT NULL,
[I#ORGQ] [int] NOT NULL,
[I#DSQT] [int] NOT NULL,
[I#TRCQ] [int] NOT NULL,
[I#PRDT] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CSDT] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CFCD] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#LDTM] [float] NOT NULL,
[I#NOTC] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#NEXP] [int] NOT NULL,
[I#GREX] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#LEXP] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#ORSH] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#CLOD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#PODT] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I#EXPQ] [int] NULL,
[I#FILL] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
