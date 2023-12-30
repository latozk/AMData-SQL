CREATE TABLE [dbo].[pdc_Monthend_Master]
(
[Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOH] [float] NULL,
[On_Ord_Qty] [float] NULL,
[Comm_Qty] [float] NULL,
[BO_Qty] [float] NULL,
[Curr_Mo_Line_Ent] [float] NULL,
[Curr_Mo_Line_Ship] [float] NULL,
[Brand] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Std_Cost] [float] NULL
) ON [PRIMARY]
GO
