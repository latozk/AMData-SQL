CREATE TABLE [dbo].[pdc_Part_Master_Inact]
(
[Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Part_Desc] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Origin_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[On_Ord_Qty] [float] NULL,
[BO_Qty] [float] NULL,
[Comm_Qty] [float] NULL,
[Exp_Ret_Qty] [float] NULL,
[Ord_Cntl] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FM] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inplt_Src] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Non_Stk_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Acq_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Scrap_Tag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[No_Pkg_Tag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Package_Code] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Alt_Pkg_Info] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact_Vend] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prm_Prod_Class] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prm_Prod_Type] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_Rep_Tag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Part_Type] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lead_Time] [float] NULL,
[Fcst_LT] [float] NULL,
[Spec_LT] [float] NULL,
[NIJ_Ord_Limit_Qty] [float] NULL,
[SYD_Ord_Limit_Qty] [float] NULL,
[__Mo_Trans] [float] NULL,
[Physical_Inv_Usg] [float] NULL,
[Physical_Inv_Rcpts] [float] NULL,
[Mo_Avg] [float] NULL,
[Safety_Stk] [float] NULL,
[Ord_Point] [float] NULL,
[EOQ] [float] NULL,
[Pkg_Qty] [float] NULL,
[DS_Tag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comb_Purch_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cons_List] [float] NULL,
[Dlr_Net] [float] NULL,
[Std_Cost] [float] NULL,
[SOH] [float] NULL,
[Curr_Location] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Loc_Tag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inv_Seg] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prod_Seg] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Mkt_Class] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inact_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prod_Line] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_3_Mo_Dlr_Usg] [float] NULL,
[Item_12_Mo_Dlr_Usg] [float] NULL,
[Item_12_Mo_IC_Usg] [float] NULL,
[Item_12_Mo_Ord] [float] NULL,
[PRE_3_Mo_Dlr_Usg] [float] NULL,
[PRE_12_Mo_Dlr_Usg] [float] NULL,
[PRE_12_Mo_IC_Usg] [float] NULL,
[PRE_12_Mo_Ord] [float] NULL,
[PRE_3_Mo_Ord] [float] NULL,
[Comb_3_Mo_Dlr_Usg] [float] NULL,
[Comb_12_Mo_Dlr_Usg] [float] NULL,
[Comb_12_Mo_IC_Usg] [float] NULL,
[Comb_12_Mo_Ord] [float] NULL,
[Brand] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Commodity] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MTD_Line_Ent] [float] NULL,
[MTD_Line_Ship] [float] NULL,
[_2_Mo_Line_Ent] [float] NULL,
[_2_Mo_Line_Ship] [float] NULL,
[_2_Mo_Stk_Out] [int] NULL,
[Status_code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Rcpt_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VOPS_PO] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unit_code] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Class_field] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Tran_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Alpha_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sls_Avail_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Re_Source_Tag] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Chg_Date_Time] [varchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Origin_Dt] [date] NULL,
[Inact_Dt] [date] NULL,
[Last_Rcpt_Dt] [date] NULL,
[Last_Tran_Dt] [date] NULL,
[SLS_Avail_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[pdc_Part_Master_Inact] ADD CONSTRAINT [PK_pdc_Part_Master_Inact] PRIMARY KEY CLUSTERED ([Part_No]) ON [PRIMARY]
GO
