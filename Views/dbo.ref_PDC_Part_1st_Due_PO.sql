SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays the first due PO for a PN (the PO having the earliest [Curr_Ship_Date] AND [Req_Date] dates).  
--This information is used in project tracking.	
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_Part_1st_Due_PO] AS

WITH p1 AS
(
SELECT [Part_No]
      ,[Order_Date]
      ,[Vend_Code]
      ,[PO_No]
      ,[Req_Date]
      ,[Open_Order_Qty]
      ,[Orig_Order_Qty]
      ,[DS_Qty]
      ,[Pre_Reciept_Qty]
      ,[Pre_Reciept_Date]
      ,[Curr_Ship_Date]
      ,[Confirm_Code]
      ,[Lead_Time]
      ,[Notify_Code]
      ,[No_Exped]
      ,[Grt_Exped]
      ,[Lst_Exped]
      ,[Orig_Ship_Date]
      ,[Closed_Date]
      ,[PO_Date]
      ,[Export_qty]
  FROM [dbo].[pdc_Open_Order_Part]
  WHERE [PO_No] Like '[0-9]%'
  )
, p2 AS
(
SELECT [Part_No] AS PN
      ,MIN([Curr_Ship_Date]) AS MINSD
	  ,SUM([Pre_Reciept_Qty]) AS SUMPrQ
  FROM p1
  GROUP BY [Part_No] 
  )
, p3 AS
  (
SELECT PN
      ,MINSD
	  ,SUMPrQ
	  ,MIN([Req_Date]) AS MINRD
  FROM p1 
  JOIN p2
  ON [Part_No]=PN AND [Curr_Ship_Date]=MINSD
  GROUP BY PN
      ,MINSD
	  ,SUMPrQ
  )
, p4 AS
  (
SELECT PN
      ,MINSD
	  ,SUMPrQ
	  ,MINRD
	  ,MIN([PO_No])AS MINPO
  FROM p1 
  JOIN p3
  ON [Part_No]=PN AND [Curr_Ship_Date]=MINSD AND [Req_Date]=MINRD
  GROUP BY PN
      ,MINSD
	  ,SUMPrQ
	  ,MINRD
  )
, p5 AS
  (
SELECT PN
      ,MINSD
	  ,SUMPrQ
	  ,MINRD
	  ,MINPO
	  ,MAX([Confirm_Code])AS MAXCC
  FROM p1 
  JOIN p4
  ON [Part_No]=PN AND [Curr_Ship_Date]=MINSD AND [Req_Date]=MINRD AND [PO_No]=MINPO
  GROUP BY PN
      ,MINSD
	  ,SUMPrQ
	  ,MINRD
	  ,MINPO
 )
SELECT [Part_No]
      ,[Order_Date]
      ,[Vend_Code]
      ,[PO_No]
      ,[Req_Date]
      ,[Open_Order_Qty]
      ,[DS_Qty]
      ,[Pre_Reciept_Qty]
      ,[Pre_Reciept_Date]
      ,[Curr_Ship_Date]
      ,[Confirm_Code]
      ,[Lead_Time]
      ,[Notify_Code]
      ,[Grt_Exped]
      ,[Lst_Exped]
      ,[Orig_Ship_Date]
      ,[Closed_Date]
      ,[PO_Date]
	  ,SUMPrQ AS[Tot_Pre_Receipt_Qty]
  FROM p1 
  JOIN p5
  ON [Part_No]=PN AND [Curr_Ship_Date]=MINSD AND [Req_Date]=MINRD AND [PO_No]=MINPO AND [Confirm_Code]=MAXCC



GO
