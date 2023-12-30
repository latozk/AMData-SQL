SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




/* =============================================
Author: Newell, R
Date: 2020-05-05
Purpose:	This view displays the ECN information sent to depots in the 
			nightly batch.  This information can also be used to load 
			CORE ECN information to NPRS (New Parts Readiness System).
Last modified date:
Modification notes:
 =============================================
*/


CREATE VIEW [dbo].[ref_DGECN_PRT]


AS
SELECT DISTINCT 'ECN' AS TRNTYP
, 'ADD' AS TRNCDE
,ISNULL(e.Proj,0) AS PRJNUM
, dgp.ECNNUM AS ECNNUM
,ISNULL(r.Seq,1) AS SEQNUM
, NULL AS HYLFMT
, ISNULL(e.Desc_1,'PRECORE') AS ECNTYP
, ISNULL(e.User_ID,'UNKNOWN') AS DSNNME
, ISNULL(e.ADM_Appr_Date,'0') AS RLSDTE
, e.Serv_Prob AS SRVPRB
, v.VIP AS VIPNUM
, ISNULL(r.Reason, 'UNKNOWN - PRECORE ECN') AS COMMEN
, ISNULL(x.Eff_Date,0) AS EFFDTE
FROM dbo.ref_DGPRT_PRT dgp 
LEFT JOIN dbo.eng_ECN AS e ON dgp.ECNNUM=e.ECN
LEFT JOIN dbo.eng_ECN_Reason AS r ON e.ECN = r.ECN 
LEFT JOIN dbo.eng_ECN_Ext AS x ON e.ECN = x.ECN 
LEFT JOIN dbo.eng_ECN_VIP AS v ON e.ECN = v.ECN

GO
GRANT DELETE ON  [dbo].[ref_DGECN_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[ref_DGECN_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[ref_DGECN_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[ref_DGECN_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
