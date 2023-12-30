CREATE TABLE [dbo].[zeng_ECN_Part_Tran]
(
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Tran] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Key_1] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Key_2] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Key_3] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Test_Status] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Part_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Dwg_Size] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_Proj] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_EPO] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Dwg_Cont] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EPO_Rev] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Last_EPO_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Vasp_List_Status] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AM_VPN_Abbr] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AM_VPN_Div] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Vasp_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VASP] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NSS] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HY_Fmt] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc_3] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Kit_List] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rev] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Chart] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AM_VPN] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rein_With_Usg] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Stock_Disp] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comm] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_Dwg_Ctrl] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_Dwg_Size] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_Chart] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_HCE] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_Desc_1] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_Desc_2] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_Desc_3] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_Rev] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_Comm] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CSW_Warranty] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CAD_Sys] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Shts] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UOM] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Serviced] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Last_EPO_Dt] [date] NULL,
[Vasp_Dt] [date] NULL,
[Rel_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[zeng_ECN_Part_Tran] ADD CONSTRAINT [PK_eng_ECN_Part_Tran] PRIMARY KEY NONCLUSTERED ([ECN], [Type], [Tran], [Key_1], [Key_2], [Key_3]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECN_Part_Tran_ECN] ON [dbo].[zeng_ECN_Part_Tran] ([ECN]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_ECN_Part_Tran__ECN_PN_Tran] ON [dbo].[zeng_ECN_Part_Tran] ([ECN], [PN], [Tran]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ecn_Type_Tran_Key_1-Key_2] ON [dbo].[zeng_ECN_Part_Tran] ([ECN], [Type], [Tran], [Key_1], [Key_2]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_eng_ECN_Part_Tran_PN] ON [dbo].[zeng_ECN_Part_Tran] ([PN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_ECN_Part_Tran_Tran] ON [dbo].[zeng_ECN_Part_Tran] ([Tran]) ON [PRIMARY]
GO
