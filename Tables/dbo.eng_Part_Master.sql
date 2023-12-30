CREATE TABLE [dbo].[eng_Part_Master]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Warranty] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Vend] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VPN] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Replacing_Part] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comm] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Test_Status] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Dwg_Size] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Chart] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_Proj] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_EPO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rel_Date] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EPO_Cur_Rev] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Latest_EPO_Date] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VASP_List] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HCE] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VASP_ECN_Date] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HY_Fmt] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc_1] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc_3] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Part_In_Use] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Kit_List] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rev] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Tran_Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EPO_Rev] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CAD_Sys] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Shts] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UOM] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Serviced] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Software_Rqd] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Software_Msg] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rel_Dt] [date] NULL,
[Latest_EPO_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_Part_Master] ADD CONSTRAINT [PK_eng_Part_Master] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [eng_Part_Master_Comm_Cd] ON [dbo].[eng_Part_Master] ([Comm]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_eng_Part_Master_Type] ON [dbo].[eng_Part_Master] ([Type]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[eng_Part_Master] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[eng_Part_Master] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[eng_Part_Master] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[eng_Part_Master] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
