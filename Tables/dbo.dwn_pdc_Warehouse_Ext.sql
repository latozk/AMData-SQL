CREATE TABLE [dbo].[dwn_pdc_Warehouse_Ext]
(
[CODE] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DATE] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HOURS] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LOCATION] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[USERID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZONE] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FUNCTION] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VARIABLE] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VALUE] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LAST] [varbinary] (1) NOT NULL
) ON [PRIMARY]
GO
