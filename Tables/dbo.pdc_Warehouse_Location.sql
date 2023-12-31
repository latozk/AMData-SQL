CREATE TABLE [dbo].[pdc_Warehouse_Location]
(
[Warehouse] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Aisle] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Bay] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Level] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Storage_Type] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Location_Status] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Check_Digit] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Pick_Verify] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Putaway_verify] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Movement_Class_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Pick_Zone] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Putaway_Zone] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Content_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Company] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Part_Num] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Item_Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Qty_UOM1] [int] NOT NULL,
[Length_UOM1] [float] NOT NULL,
[Height_UOM1] [float] NOT NULL,
[Width_UOM1] [float] NOT NULL,
[Weight_UOM1] [float] NOT NULL,
[Pieces_On_Hand] [int] NOT NULL,
[Stock_On_Hand] [int] NOT NULL,
[In_Transit_Qty] [int] NOT NULL,
[In_Receipt_Qty] [int] NOT NULL,
[Allocated_Qty] [int] NOT NULL,
[Aging_Date] [date] NULL,
[Location_Frozen] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cycle_Count_Empty] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Allocation_Zone] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Standard_UOM] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Permanent_Location] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
