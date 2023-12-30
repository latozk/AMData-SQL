SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays only the aftermarket records from the After Market/Vendor table.
--			
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[eng_AMPN_Master] AS



SELECT [Abbr]
      ,[AMPN_VPN] AS AMPN
      ,[PN]
      ,[ECN]
      ,[Vend_Div]
      ,[Status]
      ,[Allmakes]
      ,[ECN_EPO_Date]
      ,[VASP_List_Status]
      ,[Proj]
      ,[EPO]
      ,[Equiv]
      ,[VASP_CAN_ECN_Date]
      ,[VASP_CAN_ECN]
      ,[NSS]
      ,[ECN_EPO_Dt]
      ,[VASP_CAN_ECN_Dt]
  FROM [dbo].[eng_AM_VPN_Master]
  WHERE [Status] <>'OBS' AND [Abbr] IN (SELECT [Abbr] FROM [dbo].[eng_AM_Abbr])
GO
