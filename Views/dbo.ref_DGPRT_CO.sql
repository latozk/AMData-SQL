SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





-- =============================================
--Author: Newell, R
--Date: 2020-05-08
--Purpose:	This view displays the ECN information sent to depots in the 
--			nightly batch.  This information can also be used to load 
--			CORE ECN information to NPRS (New Parts Readiness System).
--Last modified date:
--Modification notes:
-- =============================================



CREATE VIEW [dbo].[ref_DGPRT_CO] AS


SELECT 'PRT' AS TRNTYP
,t.[Tran] AS TRNCDE
,e.Proj AS PRJNUM
,t.ECN AS ECNNUM
,t.Key_1 AS PRTNUM
,'1' AS SEQNUM
,t.Desc_1 AS PRTDS1
,CASE
	WHEN t.Desc_2 Like '- %'
	THEN ' '+t.Desc_2
	ELSE t.Desc_2
	END AS PRTDS2
,CASE	
	WHEN t.Desc_3 Like '- %'
	THEN ' '+t.Desc_3
	ELSE t.Desc_3
	END AS PRTDS3
,t.[Part_Type] AS PRTTYP
,t.Stock_Disp AS STKDSP
,t.Rev AS REVLVL
,t.Comm AS COMCDE
,t.Chart AS CHTNUM
,t.Dwg_Size AS DWGSIZ
,c.Dwg_Chg AS COMMEN
,NULL AS REPPRT
,t.HY_Fmt AS HYLFMT
,x.Weight_kg AS PARTWT
,t.CSW_Desc_1  AS DSCW1
,t.CSW_Desc_2  AS DSCW2
,t.CSW_Desc_2  AS DSCW3
,NULL AS TYPSWI
,NULL AS DSPSWI
,t.CSW_Rev AS REVSWI
,NULL AS COMSWI
,t.CSW_Chart AS CHTSWI
,t.CSW_Dwg_Size AS DWGSWI
,t.CSW_Comm CMTSWI
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
,t.Serviced AS SRVPRT
,x.MSDS AS HAZMAT
,x2.HCC
,p.[STATUS]
FROM ((dbo.ref_DGECN_CO dge
LEFT JOIN dbo.eng_ECN e ON dge.ECNNUM=e.ECN
LEFT JOIN dbo.eng_ECN_Part_Tran t ON e.ECN=t.ECN
LEFT JOIN dbo.eng_Part_Dwg_Chg c ON t.ECN=c.ECN AND t.Key_1=c.PN)
LEFT JOIN eng_Part_Master p ON t.Key_1=p.PN)
LEFT JOIN eng_Part_Master_Ext x ON p.PN=x.PN
LEFT JOIN eng_Part_Master_Ext_2 x2 ON p.PN=x2.PN
WHERE p.[Type]='P'


GO
GRANT DELETE ON  [dbo].[ref_DGPRT_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[ref_DGPRT_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[ref_DGPRT_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[ref_DGPRT_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
