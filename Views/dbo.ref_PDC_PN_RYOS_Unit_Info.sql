SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays PNs with used on Unit info (unit support, unit last buid and unit status).
--			
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_PN_RYOS_Unit_Info] AS


With u As
(
SELECT Unit
      ,[Group]
      ,Last_Build_Dt As Last_Build
      ,Status As [Prod_Stat_(F/C/NC)]
	  ,Support
  FROM dbo.ref_Unit
  Where Support <> 'Not Supported'
)
SELECT CORE_PN
	  ,as400PN
	  ,Unit_Code
      ,ptu.[Group]
      ,ptu.Last_Build
      ,ptu.[Prod_Stat_(F/C/NC)]
	  ,u.Support
	  ,ptu.RYOS
  FROM dbo.ref_PDC_Part_to_Unit_Detail ptu
  Join dbo.ref_PDC_RYOS ryos
  On ptu.as400PN=ryos.PN
  Join u
  On ptu.Unit_Code=u.Unit

GO
