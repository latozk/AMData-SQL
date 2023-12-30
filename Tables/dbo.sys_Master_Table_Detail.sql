CREATE TABLE [dbo].[sys_Master_Table_Detail]
(
[Destination_DB] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Destination_Tbl] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Destination_Field] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Source_Field] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tbl_Ord_No] [int] NULL,
[Fld_Length] [numeric] (5, 0) NULL,
[Fld_Desc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Col_Head_1] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Col_Head_2] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fld_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[sys_Master_Table_Detail] ADD CONSTRAINT [PK_sys_Master_Table_Detail_1] PRIMARY KEY CLUSTERED ([Destination_DB], [Destination_Tbl], [Destination_Field]) ON [PRIMARY]
GO
