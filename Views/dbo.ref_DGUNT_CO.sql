SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[ref_DGUNT_CO] AS


SELECT 'UNT' AS TRNTYPE
      ,t.[Tran] AS TRNCDE
      ,e.[Proj] AS PRJNUM
      ,e.[ECN] AS ECNNUM
      ,dgp.PRTNUM
      ,'1' AS SEQNUM
      ,t.[HY_Fmt] AS HYLFMT
      ,u.[Unit] AS UNTCDE
      , ' ' AS MDLNUM
      , ' ' AS CONNUM
FROM dbo.ref_DGPRT_CO dgp 
JOIN dbo.eng_ecn_Part_Tran t
ON dgp.PRTNUM=t.Key_1
JOIN dbo.eng_ecn e 
ON t.ECN=e.ECN
--LEFT JOIN dbo.eng_Part_Unit_Contract_Div u ON t.Key_1=u.Key_1)
JOIN dbo.eng_PDC_Part_Dist u 
ON dgp.PRTNUM =u.PN
--LEFT JOIN dbo.eng_Unit_Contract c 
--ON u.Unit=c.Unit
GO
GRANT DELETE ON  [dbo].[ref_DGUNT_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[ref_DGUNT_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[ref_DGUNT_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[ref_DGUNT_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
