CREATE TABLE [dbo].[eng_Unit_Contract]
(
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Test_Status] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[US_Model_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[US_Model_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[US_Model_3] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eur_Model_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eur_Model_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eur_Model_3] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Class] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tran_Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Brand] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity_US_Min] [numeric] (18, 0) NULL,
[Capacity_US_Max] [numeric] (18, 0) NULL,
[Capacity_EUR_Min] [numeric] (18, 0) NULL,
[Capacity_EUR_Max] [numeric] (18, 0) NULL,
[Proj_Name] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Remarks] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_Unit_Contract] ADD CONSTRAINT [PK_eng_Unit_Contract] PRIMARY KEY CLUSTERED ([Unit], [Contract]) ON [PRIMARY]
GO
