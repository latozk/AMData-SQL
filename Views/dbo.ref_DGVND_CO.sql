SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
--Author: Sexton, C
--Date: 2020-05-08
--Purpose:	This view displays the ECN information sent to depots in the 
--			nightly batch.  This information can also be used to load 
--			CORE ECN information to NPRS (New Parts Readiness System).
--Last modified date: 6/2/2020
--Modification notes: Changed eng_AM_Vendor_Name to eng_AM_Vend 
-- =============================================


CREATE VIEW [dbo].[ref_DGVND_CO] AS


SELECT 'VND' AS TRNTYP
      ,t.[Tran] AS TRNCDE
	  ,e.Proj AS PRJNUM
	  ,e.ECN AS ECNNUM
      ,t.Key_1 AS PRTNUM
      ,'1' AS SEQNUM
	  ,p.HY_Fmt AS HYLFMT
	  ,n.[Name] AS VNDNME
      ,t.Key_3 AS VNDPRT
      ,t.Key_2 AS VNDABR
  FROM ([dbo].[eng_ECN] e
  LEFT JOIN [dbo].[eng_ECN_Tran] t ON e.ECN=t.ECN)
  LEFT JOIN [dbo].[eng_Part_Master] p ON t.Key_1=p.PN
  LEFT JOIN [dbo].[eng_AM_Vend] n ON n.abbr=t.Key_2
  WHERE t.Type='AM' AND t.[Key_1] IN (SELECT dgp.PRTNUM FROM dbo.ref_DGPRT_CO dgp)



GO
GRANT DELETE ON  [dbo].[ref_DGVND_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[ref_DGVND_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[ref_DGVND_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[ref_DGVND_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
