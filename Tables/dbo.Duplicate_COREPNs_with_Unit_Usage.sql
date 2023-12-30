CREATE TABLE [dbo].[Duplicate_COREPNs_with_Unit_Usage]
(
[COREPN1_UNIT] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN1_DIV] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN1_Desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN1_Serviced] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN1_ComCd] [int] NULL,
[COREPN1_AM_Abbr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN1_AMPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN2_UNIT] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN2_DIV] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN2_Desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN2_Serviced] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COREPN2_ComCd] [int] NULL,
[Desc_Discrepancy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Serviced_Discrepancy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ComCd_Discrepancy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
