CREATE TABLE [dbo].[pdc_EOQ]
(
[PART_NO] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIME_FLAG] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VENDOR_REF_NO] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VEND_CODE] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLANT_CODE] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EOQ] [int] NULL,
[CURRENT_PQ_COST] [decimal] (18, 2) NULL,
[FUTURE_PQ_COST] [decimal] (18, 2) NULL,
[CURRENT_EFF_DATE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FUTURE_EFF_DATE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REVIEW_DATE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURR_CODE] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PB_FLAG] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BRAND] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20210517-201455] ON [dbo].[pdc_EOQ] ([PART_NO], [PLANT_CODE], [VEND_CODE]) ON [PRIMARY]
GO
