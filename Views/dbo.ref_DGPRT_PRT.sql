SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





-- =============================================
--Author: Newell, R
--Date: 2020-05-07
--Purpose:	This view displays the ECN information sent to depots in the 
--			nightly batch.  This information can also be used to load 
--			CORE ECN information to NPRS (New Parts Readiness System).
--Last modified date:
--Modification notes:
-- =============================================



CREATE VIEW [dbo].[ref_DGPRT_PRT] AS


SELECT 'PRT' AS TRNTYP
,'ADD' AS TRNCDE
,p.Rel_Proj AS PRJNUM
,CASE	
	WHEN p.REL_ECN>' '
	THEN P.Rel_ECN
	ELSE 'PRECORE'
	END AS ECNNUM
,p.PN AS PRTNUM
,'1' AS SEQNUM
,p.Desc_1 AS PRTDS1
,CASE
	WHEN p.Desc_2 Like '- %'
	THEN ' '+p.Desc_2
	ELSE p.Desc_2
	END AS PRTDS2
,CASE	
	WHEN p.Desc_3 Like '- %'
	THEN ' '+p.Desc_3
	ELSE p.Desc_3
	END AS PRTDS3
,p.[Type] AS PRTTYP
,Null AS STKDSP
,p.Rev AS REVLVL
,p.Comm AS COMCDE
,p.Chart AS CHTNUM
,P.Dwg_Size AS DWGSIZ
,NULL AS COMMEN
,p.Replacing_Part AS REPPRT
,p.HY_Fmt AS HYLFMT
,x.Weight_kg AS PARTWT
,NULL AS DSCW1
,NULL AS DSCW2
,NULL AS DSCW3
,NULL AS TYPSWI
,NULL AS DSPSWI
,NULL AS REVSWI
,NULL AS COMSWI
,NULL AS CHTSWI
,NULL AS DWGSWI
,NULL AS CMTSWI
,NULL AS APPRTAG
,NULL AS KITIND
,NULL AS KITTYP
,NULL AS PRTLEN
,NULL AS ORDCC
,NULL AS STACOD
,NULL AS NONSTK
,NULL AS MKTCLS
,NULL AS DIRSHP
,NULL AS ITCLS
,NULL AS WECLS
,NULL AS ELCLS
,NULL AS AMCLS
,NULL AS UORSCD
,NULL AS PKGQTY
,NULL AS SAFSTK
,NULL AS EAR
,NULL AS BUYQTY
,NULL AS WELIND
,NULL AS SPDIND
,NULL AS RSPL
,NULL AS LUSDTE
,NULL AS HOTREL
,NULL AS PRPCLS
,NULL AS PRPTYP
,NULL AS PRSER
,NULL AS USRID
,p.Serviced AS SRVPRT
,x.MSDS AS HAZMAT
,x2.HCC
,p.[STATUS]
FROM dbo.inp_Picklist_DGPRT pl 
JOIN dbo.eng_Part_Master p ON pl.PN=p.PN
JOIN eng_Part_Master_Ext x ON p.PN=x.PN
JOIN eng_Part_Master_Ext_2 x2 ON p.PN=x2.PN
WHERE  p.[Type]='P'


GO
GRANT DELETE ON  [dbo].[ref_DGPRT_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[ref_DGPRT_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[ref_DGPRT_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[ref_DGPRT_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
