SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- =============================================
--Author: Newell, R
--Date: 2022-05-05
--Purpose:	This view displays PDC supported Parts with used on Unit info and details (unit support, unit last buid and unit status).
--			
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_Part_to_Unit_Detail] AS


With u As
(
SELECT Unit
      ,[Group]
      ,Last_Build_Dt As Last_Build
      ,Status As [Prod_Stat_(F/C/NC)]
	  ,Support
	  ,Class
  FROM dbo.ref_Unit
  Where Support <> 'Not Supported'
)
SELECT CORE_PN
	  ,ptu.PN As as400PN
	  ,ptu.Unit As Unit_Code
      ,[Group]
      ,Last_Build
      ,[Prod_Stat_(F/C/NC)]
	  ,u.Support
	  ,RYOS
	  ,Class
  FROM dbo.ref_PDC_Part_to_Unit ptu
  Join dbo.ref_PDC_RYOS ryos
  On ptu.PN=ryos.PN
  Join u
  On ptu.Unit=u.Unit

GO
