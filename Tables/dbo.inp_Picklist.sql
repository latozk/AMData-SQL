CREATE TABLE [dbo].[inp_Picklist]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inp_Picklist] ADD CONSTRAINT [PK_inp_Picklist] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[inp_Picklist] TO [GLOBAL\AP PDC Users]
GO
GRANT INSERT ON  [dbo].[inp_Picklist] TO [GLOBAL\AP PDC Users]
GO
GRANT SELECT ON  [dbo].[inp_Picklist] TO [GLOBAL\AP PDC Users]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist] TO [GLOBAL\AP PDC Users]
GO
EXEC sp_addextendedproperty N'AlternateBackShade', N'95', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'AlternateBackThemeColorIndex', N'1', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'AlternateBackTint', N'100', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'Attributes', N'0', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'BackShade', N'100', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'BackTint', N'100', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'DatasheetForeThemeColorIndex', N'0', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'DatasheetGridlinesThemeColorIndex', N'3', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'DateCreated', N'4/10/2019 12:17:40 PM', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'DisplayViewsOnSharePointSite', N'1', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'FilterOnLoad', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'HideNewField', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'LastUpdated', N'2/7/2020 10:06:24 AM', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DefaultView', N'2', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_OrderByOn', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Orientation', N'0', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'Name', N'Picklist_local', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'OrderByOnLoad', N'True', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'PublishToWeb', N'1', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'ReadOnlyWhenDisconnected', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'RecordCount', N'120', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'RowHeight', N'285', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'ThemeFontIndex', N'1', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'TotalsRow', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'Updatable', N'True', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', NULL, NULL
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'1', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'GUID', N'宸ꢁ聳俊⺚뗛뎓', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Name', N'PN', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'0', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Size', N'255', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'SourceField', N'PN', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Picklist_local', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'inp_Picklist', 'COLUMN', N'PN'
GO
