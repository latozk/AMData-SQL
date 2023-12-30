CREATE TABLE [dbo].[pdc_Warehouse_Extract]
(
[Code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date_Formatted] [date] NULL,
[Date] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hours] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Location] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zone] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Function] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Variable] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value] [float] NULL
) ON [PRIMARY]
GO
