CREATE TABLE [dbo].[ref_Unit]
(
[Unit] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Series] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Code] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opp_Brand_Unit] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Group] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PDC_Class] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PDC_Type] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Class] [int] NULL,
[Model_AM] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Model_EUR] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Project_Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product_Family] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Series_Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Brand] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First_Build_Dt] [date] NULL,
[Last_Build_Dt] [date] NULL,
[Status] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Proj] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Support] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Special_Support] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Support_Comments] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dist] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Source_Comment] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity_US_Min] [int] NULL,
[Capacity_US_Max] [int] NULL,
[Capacity_EUR_Min] [float] NULL,
[Capacity_EUR_Max] [float] NULL,
[Follow_up_Dt] [date] NULL,
[Follow_up_Comments] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Add_Dt] [date] NULL,
[Warehouse_Warriors] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reporting] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reporting_BT_Op_Review] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRD_Balloon_Status] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_Unit] ADD CONSTRAINT [PK_ref_Unit] PRIMARY KEY CLUSTERED ([Unit]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[ref_Unit] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
