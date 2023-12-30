SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
--Author: Sexton, C
--Date: 2020-05-06
--Purpose:	This view displays the ECN information sent to depots in the 
--			nightly batch.  This information can also be used to load 
--			CORE ECN information to NPRS (New Parts Readiness System).
--Last modified date: 6/2/2020
--Modification notes: Changed eng_AM_Vendor_Name to eng_AM_Vend
-- =============================================


CREATE VIEW [dbo].[ref_DGVND_PRT] AS


SELECT 'VND' AS TRNTYP
      ,'ADD' AS TRNCDE
	  ,v.Proj AS PRJNUM
	  ,v.ECN AS ECNNUM
      ,p.PN AS PRTNUM
      ,'1' AS SEQNUM
	  ,p.HY_Fmt AS HYLFMT
	  ,n.[Name] AS VNDNME
      ,v.AMPN_VPN AS VNDPRT
      ,v.abbr AS VNDABR
  FROM [dbo].[eng_Part_Master] p 
  JOIN [dbo].[eng_AM_VPN_Master] v ON p.PN=v.PN
  JOIN [dbo].[eng_AM_Vend] n ON v.abbr=n.abbr
  WHERE p.[PN] IN (SELECT pl.PN FROM dbo.inp_Picklist_DGPRT pl) AND v.[Status]<>'OBS'



GO
GRANT DELETE ON  [dbo].[ref_DGVND_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[ref_DGVND_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[ref_DGVND_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[ref_DGVND_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
