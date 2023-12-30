CREATE TABLE [dbo].[ref_CORE_PN_XRef]
(
[CORE_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CORE_Brand] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN_Brand] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[XPN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[XPN_Brand] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECN_EPO_dt] [date] NULL,
[PNAS400Fmt] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[XPNas400Fmt] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc_1] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc_3] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HCE] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Kit_List] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Part_In_Use] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comm] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rel_Proj] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rel_ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rel_Date] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Replacing_Part] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VASP_List] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VASP_ECN_Date] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Chart] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAD_Sys] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rev] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dwg_Size] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shts] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UOM] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tran_Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Serviced] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-Core_PN_PN_XPN] ON [dbo].[ref_CORE_PN_XRef] ([CORE_PN], [PN], [XPN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200720-102736] ON [dbo].[ref_CORE_PN_XRef] ([PN], [PNAS400Fmt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [re_CORE_PN_XRef__XPN] ON [dbo].[ref_CORE_PN_XRef] ([XPN]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'AlternateBackShade', N'100', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'AlternateBackThemeColorIndex', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'AlternateBackTint', N'100', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'Attributes', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'BackShade', N'100', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'BackTint', N'100', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'DatasheetForeThemeColorIndex', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'DatasheetGridlinesThemeColorIndex', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'DateCreated', N'5/31/2013 2:14:04 PM', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'DisplayViewsOnSharePointSite', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'FilterOnLoad', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'HideNewField', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'LastUpdated', N'3/7/2018 6:12:13 PM', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DefaultView', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_OrderByOn', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Orientation', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'Name', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'OrderByOnLoad', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'PublishToWeb', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'ReadOnlyWhenDisconnected', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'RecordCount', N'1905860', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'ThemeFontIndex', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'TotalsRow', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'Updatable', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', NULL, NULL
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'GUID', N'ᒌઌ䁰꺛ᄀ瀪ᗏ', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'Name', N'CADType', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'21', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'Size', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'SourceField', N'CADType', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CAD_Sys'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'GUID', N'⡠ᔬ혪䗅쪱쾜繘뉨', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'Name', N'ChartNO', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'20', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'Size', N'16', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'SourceField', N'ChartNO', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Chart'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'GUID', N'ऱ�螃䎪Ჽ긳昆', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'Name', N'CommCd', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'13', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'Size', N'5', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'SourceField', N'CommCd', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Comm'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'GUID', N'슰⒟䳍乌䆾꠽돳', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'Name', N'CORE PN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'Size', N'15', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'SourceField', N'CORE PN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'CORE_PN'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'GUID', N'裤䃎웧俴岈ᗥ在', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'Name', N'Desc1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'7', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'Size', N'30', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'SourceField', N'Desc1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_1'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'GUID', N'�䥶䢀䠉䱭䔽', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'Name', N'Desc2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'8', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'Size', N'30', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'SourceField', N'Desc2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_2'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'GUID', N'忐駶턵䗤ᢄᜏ国懐', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'Name', N'Desc3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'9', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'Size', N'30', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'SourceField', N'Desc3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Desc_3'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'GUID', N'ᜒ✄䧱斛엋扵鯾', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'Name', N'DwgSz', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'24', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'Size', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'SourceField', N'DwgSz', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Dwg_Size'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'GUID', N'ѕ﷪늺䦮芮�㎭', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'Name', N'ECN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'28', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'Size', N'8', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'SourceField', N'ECN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'ECN'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'GUID', N'ᬇ䕌迤䇷㊗簰[ᦚ', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'Name', N'HCE', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'Size', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'SourceField', N'HCE', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'HCE'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'GUID', N'玖��䯖Ⱝ馽⹜', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'Name', N'KitLst', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'11', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'Size', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'SourceField', N'KitLst', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Kit_List'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'GUID', N'資Ă뒡䑖ᢔ쌰ߐ¤', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Name', N'Loc', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'22', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Size', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'SourceField', N'Loc', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Loc'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'GUID', N'ˡ폼슃䱲纪펾뉃ⷞ', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'Name', N'PartInUse', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'12', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'Size', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'SourceField', N'PartInUse', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Part_In_Use'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'GUID', N'揜ⓜ扮仪钏ﭹ頠', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Name', N'PN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Size', N'15', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'SourceField', N'PN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PN'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'GUID', N'釓Q侗熺䏣䂘寁', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'Name', N'PNas400Fmt', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'Size', N'16', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'SourceField', N'PNas400Fmt', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'PNAS400Fmt'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'GUID', N'꓇ၰ뮘䩒҈ψ믾폕', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'Name', N'ECNRelDt', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'16', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'Size', N'8', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'SourceField', N'ECNRelDt', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Date'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'GUID', N'蘸칵Ჾ䉖놵𥳐ꄀ', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'Name', N'RelECN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'15', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'Size', N'8', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'SourceField', N'RelECN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_ECN'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'GUID', N'உݴ䗔讱놝襠슀', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'Name', N'Proj', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'14', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'Size', N'8', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'SourceField', N'Proj', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rel_Proj'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'GUID', N'隺蟋냥䳆螒踔兮', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'Name', N'ReplacingPN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'17', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'Size', N'15', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'SourceField', N'ReplacingPN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Replacing_Part'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'GUID', N'毼瀉◝䀽綂鱀쿂泏', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'Name', N'RevLvl', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'23', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'SourceField', N'RevLvl', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Rev'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'GUID', N'呡�䤁䃨鎬馦ᥟᄆ', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'Name', N'ServiceY/N', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'29', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'Size', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'SourceField', N'ServiceY/N', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Serviced'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'GUID', N'橭䃬碏䭄ྞㅸ瑅慙', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'Name', N'Shts', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'25', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'SourceField', N'Shts', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Shts'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'GUID', N'⡩㏖鰶䏗ꖄ吸柢', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Name', N'Status', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'5', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Size', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'SourceField', N'Status', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'GUID', N'餴䍻潆佸બ泳呆䢔', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'Name', N'TransStatus', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'27', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'Size', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'SourceField', N'TransStatus', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Tran_Status'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'GUID', N'吊๪핈䉽麩�툦Ḁ', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'Name', N'TypeCd', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'6', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'Size', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'SourceField', N'TypeCd', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'GUID', N'̔䜖抚쀾厜య', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'Name', N'UOM', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'26', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'Size', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'SourceField', N'UOM', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'GUID', N'⢧鱌亶효姵⏮롊', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'Name', N'VASPECNDt', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'19', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'Size', N'7', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'SourceField', N'VASPECNDt', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_ECN_Date'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'GUID', N'㒎ї甴䜟⺫銹ᆈ鑭', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'Name', N'VASPLst', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'18', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'Size', N'1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'SourceField', N'VASPLst', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'VASP_List'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'GUID', N'썳뜫�䊠㮼굁ﮥ頾', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'Name', N'XPN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'Size', N'15', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'SourceField', N'XPN', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPN'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'CurrencyLCID', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'GUID', N'烍哠�䝹䊢띡㿼텵', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'Name', N'XPNas400Fmt', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'4', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'ResultType', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'Size', N'16', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'SourceField', N'XPNas400Fmt', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'SourceTable', N'0) CORE PN Misc Info (includes active crosses)', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'True', 'SCHEMA', N'dbo', 'TABLE', N'ref_CORE_PN_XRef', 'COLUMN', N'XPNas400Fmt'
GO
