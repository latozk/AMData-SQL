CREATE TABLE [dbo].[ref_Mfg_Loc]
(
[Code] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Loc] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Mfg] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Brand] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comment] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plant] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Plant Code] ON [dbo].[ref_Mfg_Loc] ([Plant]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'AlternateBackShade', N'100', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'AlternateBackThemeColorIndex', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'AlternateBackTint', N'100', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'Attributes', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'BackShade', N'100', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'BackTint', N'100', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'DatasheetForeThemeColorIndex', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'DatasheetGridlinesThemeColorIndex', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'DateCreated', N'11/8/2013 11:27:58 AM', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'DisplayViewsOnSharePointSite', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'FilterOnLoad', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'HideNewField', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'LastUpdated', N'1/29/2019 11:55:25 AM', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DefaultView', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_OrderByOn', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Orientation', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'Name', N'0) Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'OrderByOnLoad', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'PublishToWeb', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'ReadOnlyWhenDisconnected', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'RecordCount', N'56', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'ThemeFontIndex', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'TotalsRow', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'Updatable', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', NULL, NULL
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'5', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'1644', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'GUID', N'朵纳竝䄙粢캴跤憔', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'Name', N'Brand', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'4', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'Size', N'255', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'SourceField', N'Brand', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Brand'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'1008', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'GUID', N'Ⱙ磌禾䥧綳峟͚�', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'Name', N'Mfg Code', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'Size', N'255', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'SourceField', N'Mfg Code', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'6', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'7596', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'GUID', N'⳦팆适主벮漬‖', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'Name', N'Comment', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'5', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'Size', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'SourceField', N'Comment', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'TextFormat', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'Type', N'12', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Comment'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'2070', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'GUID', N'饇摶觘且䒲ﲍ낓', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Name', N'Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Size', N'255', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'SourceField', N'Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'2565', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'GUID', N'蹘⻨⁡䉦➇ᜀ영�', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'Name', N'Manufacturer Name', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'Size', N'255', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'SourceField', N'Manufacturer Name', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Mfg'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'7', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'GUID', N'ⓖ喧ﮨ䍇좑ヒ鶃兼', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'Name', N'Plant Code', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'6', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'Size', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'SourceField', N'Plant Code', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Plant'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'8', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'GUID', N'둗垟裰䍪얡ᓷ듻', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Name', N'Active/Inactive', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'7', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Size', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'SourceField', N'Active/Inactive', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) Mfg Location', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_Mfg_Loc', 'COLUMN', N'Status'
GO
