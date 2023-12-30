SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[ref_PDC_Part_Need_Dt] AS

--A part's Need Date is null if it has already been received by the PDC.  
--If not yet received by the PDC, the Need Date is equal to the first due project implementation date, 
--unless it is a new replacing part in qhich case the Need Date is equal to the part's Origin Date.
--The Need Date is set by the sp_ref_PDC_Proj_Tracking procedure which builds the table used in this view.
--This view simply gets just the PN and Need Dt from the Project tracking table as it contains multiple PNs 

SELECT DISTINCT [PN]
      ,[NeedDt]
  FROM [dbo].[ref_PDC_Proj_Tracking]

GO
