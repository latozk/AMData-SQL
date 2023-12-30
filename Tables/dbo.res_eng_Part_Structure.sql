CREATE TABLE [dbo].[res_eng_Part_Structure]
(
[ID] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Col] [int] NULL,
[Parent_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Component_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Qty] [decimal] (18, 0) NULL,
[Seq] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Trans] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECN_Add_Dt] [date] NULL,
[ECN_Rem_Dt] [date] NULL,
[Input_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Dt] [date] NULL
) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Attributes', N'0', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', NULL, NULL
GO
EXEC sp_addextendedproperty N'DateCreated', N'2/6/2020 12:31:30 PM', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', NULL, NULL
GO
EXEC sp_addextendedproperty N'LastUpdated', N'2/6/2020 3:04:06 PM', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', NULL, NULL
GO
EXEC sp_addextendedproperty N'Name', N'tbl_Part_Structure_local', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', NULL, NULL
GO
EXEC sp_addextendedproperty N'RecordCount', N'327', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', NULL, NULL
GO
EXEC sp_addextendedproperty N'Updatable', N'True', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', NULL, NULL
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'Name', N'Col', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'2', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'SourceField', N'Col', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'SourceTable', N'tbl_Part_Structure_local', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'Type', N'4', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Col'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'Name', N'Component_PN', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'4', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'Size', N'15', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'SourceField', N'Component_PN', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'SourceTable', N'tbl_Part_Structure_local', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Component_PN'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Name', N'ID', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'1', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Size', N'255', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'SourceField', N'ID', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'SourceTable', N'tbl_Part_Structure_local', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'Name', N'Parent_PN', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'3', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'Size', N'15', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'SourceField', N'Parent_PN', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'SourceTable', N'tbl_Part_Structure_local', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Parent_PN'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'18', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'Name', N'Qty', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'5', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'Size', N'16', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'SourceField', N'Qty', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'SourceTable', N'tbl_Part_Structure_local', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'Type', N'20', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Qty'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'Name', N'Seq', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'6', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'Size', N'16', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'SourceField', N'Seq', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'SourceTable', N'tbl_Part_Structure_local', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Seq'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'Name', N'Trans', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'7', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'Size', N'3', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'SourceField', N'Trans', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'SourceTable', N'tbl_Part_Structure_local', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'res_eng_Part_Structure', 'COLUMN', N'Trans'
GO
