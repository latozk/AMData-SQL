SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE View [dbo].[ref_PDC_Part_Detail_PBI] as 
SELECT PN as Part_Num
      ,Set_SOH as Set_Stock_On_Hand
      ,Set_PreRcpt as Set_Pre_Receipt
      ,Set_OO as Set_On_Order
      ,Set_SS as Set_Safety_Stock
      ,Set_BO as Set_BO_Qty
      ,Set_Commtd as Set_Committed_Qty
      ,Set_12_Mo_Usg as Set_Usg_12_Month
      ,Set_12_Mo_Trans as Set_Trans_12_Mo
      ,Set_MTD_LE as Set_Lines_Entered_MTD
      ,Set_MTD_LF as Set_Lines_Shipped_MTD
      ,Set_12_Mo_LE as Set_Lines_Entered_12_Month
      ,Set_12_Mo_LF as Set_Lines_Shipped_12_Month
      ,Set_Lst_Rcpt_Dt as Set_Last_Receipt_Date
      ,Set_Lst_Tran_Dt as Set_Last_Tran_Date
      ,Set_Mo_Av as Set_Monthly_Avg
      ,Set_Ld_Time as Set_Lead_Time
      ,Set_Vend as Set_Vendor 
  FROM dbo.ref_PDC_Part_Detail





GO
