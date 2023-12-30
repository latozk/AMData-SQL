SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create view [dbo].[vw_etl_IMPNPVND] as 
SELECT VNVDNM as Vendor_Name
      ,VNVPNO as Vendor_Override
      ,VNVABR as Vend_Abbreviation
      ,VNACCD as Action_Code
      ,VNPT15 as Part_Number
      ,VNECN8 as ECN_Number
      ,VNPJNO as Project_Number
    , VNVPTN  as Vendor_Part_Number
      ,VNVND6 as Vendor_Code
      ,VNBUYR as Buyer_Code
      ,VNPRC as Price
      ,VNCURC as Currency_Code
      ,VNLDTM as Vendor_Lead_Time
      ,VNMQTY as Minimum_Quantity
      ,VNMDOL as Minimum_Dollars
      ,VNPRCD as Prime_Code
      ,VNDISC as Discount
      ,VNSTS as Status
      ,VNRELD as NPR_Mstr_Rel_Date
      ,VNNODT as No_Process_Date
      ,VNNOID as No_Process_ID
      ,VNCRDT as Create_Date
      ,VNCRID as Creation_ID
      ,VNMNDT as Maintenance_Date
      ,VNMNID as Maintenance_ID
      ,VNNOMG as No_Process_Message
      ,VNMNPG Maintenance_Program
      ,VNNDDT as Vend_Date
  FROM dwn_pdc_NP_Vendor_Part_Number
GO
