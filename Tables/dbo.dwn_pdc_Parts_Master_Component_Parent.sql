CREATE TABLE [dbo].[dwn_pdc_Parts_Master_Component_Parent]
(
[PARENTPART] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[COMPPART] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PM8COMPQTY] [float] NOT NULL,
[PM8CMNTS] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EFFDATE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PM8ASMOPTC] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
