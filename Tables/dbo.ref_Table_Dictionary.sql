CREATE TABLE [dbo].[ref_Table_Dictionary]
(
[tbl_Key] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Src_System] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Src_Tbl] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dest_Tbl] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dwn_Tbl] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dwn_Pkg] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[etl_Pkg] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Priority] [int] NULL,
[Load_Type] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Frequency] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Schedule_Time] [time] NULL,
[Src_Rec_Cnt] [int] NULL,
[Dwn_Rec_Cnt] [int] NULL,
[Prev_Dwn_Rec_Cnt] [int] NULL,
[dwn_Flag] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dwn_Flag_dt] [datetime] NULL,
[dwn_Start_dt] [datetime] NULL,
[dwn_End_dt] [datetime] NULL,
[etl_Flag] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[etl_Flag_dt] [datetime] NULL,
[etl_Start_dt] [datetime] NULL,
[etl_End_dt] [datetime] NULL,
[etl_Rec_Cnt] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_Table_Dictionary] ADD CONSTRAINT [PK_ref_Table_Dictionary] PRIMARY KEY CLUSTERED ([tbl_Key]) ON [PRIMARY]
GO
