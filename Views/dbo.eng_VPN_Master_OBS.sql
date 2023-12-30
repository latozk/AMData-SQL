SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- =============================================
--Author: Newell, R
--Date: 2021-04-22
--Purpose:	This view displays only the obsolete vendor records from the After Market/Vendor table.
--			
--Last modified date:
--Modification notes:

-- =============================================


CREATE VIEW [dbo].[eng_VPN_Master_OBS] AS



SELECT [Abbr]
      ,[AMPN_VPN] AS VPN
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
  WHERE [Status] ='OBS' AND [Abbr] NOT IN (SELECT [Abbr] FROM [dbo].[eng_AM_Abbr])
GO
