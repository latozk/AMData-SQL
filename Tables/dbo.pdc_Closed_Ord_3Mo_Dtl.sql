CREATE TABLE [dbo].[pdc_Closed_Ord_3Mo_Dtl]
(
[PO_No] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Req_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pre_Rcpt_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pre_Rcpt_Time] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pre_Rcpt_Qty] [int] NULL,
[Inbin_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inbin_Qty] [int] NULL,
[Emerg_Qty] [int] NULL,
[Loc_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Move_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Closed_date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20210628-170505] ON [dbo].[pdc_Closed_Ord_3Mo_Dtl] ([Part_No]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20210628-170538] ON [dbo].[pdc_Closed_Ord_3Mo_Dtl] ([PO_No]) ON [PRIMARY]
GO
