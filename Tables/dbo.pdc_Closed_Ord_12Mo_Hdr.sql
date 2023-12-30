CREATE TABLE [dbo].[pdc_Closed_Ord_12Mo_Hdr]
(
[Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_No] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Req_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Open_Ord_Qty] [int] NOT NULL,
[Orig_Ord_Qty] [int] NULL,
[DS_Qty] [int] NULL,
[Pre_Rcpt_Qty] [int] NULL,
[Pre_Rcpt_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Curr_Ship_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Confirm_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lead_Time] [float] NULL,
[Notify_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[No_Exped] [int] NULL,
[Greatest_Exp_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Least_Exp_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Original_Ship_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Closed_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Promise_Date] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20210628-170130] ON [dbo].[pdc_Closed_Ord_12Mo_Hdr] ([Part_No]) ON [PRIMARY]
GO
