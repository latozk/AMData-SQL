CREATE TABLE [dbo].[dwn_pdc_Back_Order]
(
[BOTYPE] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOORDN] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOSHDL] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOQTY] [int] NOT NULL,
[BOCMQT] [int] NOT NULL,
[BOORGD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOPRCD] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOBLPR] [decimal] (10, 2) NOT NULL,
[BOPRIC] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOPTCD] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOEXPD] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOCOMD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOSHPD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOALCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOSHPC] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOPART] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BORDCD] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BODLPO] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOPONO] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOVEND] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOINV] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOXRFP] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BOFILX] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
