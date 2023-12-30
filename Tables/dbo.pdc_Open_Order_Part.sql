CREATE TABLE [dbo].[pdc_Open_Order_Part]
(
[Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Order_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Vend_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PO_No] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Req_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Open_Order_Qty] [int] NULL,
[Orig_Order_Qty] [int] NULL,
[DS_Qty] [int] NULL,
[Pre_Reciept_Qty] [int] NULL,
[Pre_Reciept_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Curr_Ship_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Confirm_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lead_Time] [float] NULL,
[Notify_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[No_Exped] [int] NULL,
[Grt_Exped] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lst_Exped] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Orig_Ship_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Closed_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Export_qty] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[pdc_Open_Order_Part] ADD CONSTRAINT [PK_pdc_Open_Order_Part] PRIMARY KEY CLUSTERED ([Part_No], [Order_Date], [Vend_Code], [PO_No], [Req_Date]) ON [PRIMARY]
GO
