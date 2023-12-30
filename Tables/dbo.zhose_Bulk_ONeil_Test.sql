CREATE TABLE [dbo].[zhose_Bulk_ONeil_Test]
(
[PROD #] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HYS #] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[YAL #] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DESCRIPTION] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HCE] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SPEC NO] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Series] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRIMP FTG SERIES] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REUSE FTG SERIES] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DIE REQ] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN DIE] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RING REQ] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN RING] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initials] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Stocked] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OPT VENDOR #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
