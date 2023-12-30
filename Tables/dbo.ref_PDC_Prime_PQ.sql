CREATE TABLE [dbo].[ref_PDC_Prime_PQ]
(
[PART_NO] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimeFlg] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VEND_CODE] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VENDOR_REF_NO] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLANT_CODE] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EOQ] [int] NULL,
[CURRENT_PQ_COST] [decimal] (18, 2) NULL,
[FUTURE_PQ_COST] [decimal] (18, 2) NULL,
[CURRENT_EFF_DATE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURRENT_EFF_DT] [date] NULL,
[REVIEW_DATE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REVIEW_DT] [date] NULL,
[PB_FLAG] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BRAND] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
