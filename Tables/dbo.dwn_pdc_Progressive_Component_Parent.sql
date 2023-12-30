CREATE TABLE [dbo].[dwn_pdc_Progressive_Component_Parent]
(
[PRNTPART] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[COMPPART] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[#WCQTY] [float] NOT NULL,
[#WCMNT] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EFFDATE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[#WASMO] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
