SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[ref_DGUNT_PRT] AS


SELECT DISTINCT 'UNT' AS TRNTYPE
         ,'ADD' AS TRNCDE
         ,p.[Rel_Proj] AS PRJNUM
         ,p.[Rel_ECN] AS ECNNUM
         ,p.[PN] AS PRTNUM
         ,'1' AS SEQNUM
         ,p.[HY_Fmt] AS HYLFMT
         ,u.[Unit] AS UNTCDE
         , ' ' AS MDLNUM
         , ' ' AS CONNUM
FROM dbo.inp_Picklist_DGPRT pl
JOIN dbo.eng_Part_Master p 
ON pl.PN=p.PN
--JOIN dbo.eng_Unit_Div_ML_GL u ON p.PN=u.PN
JOIN dbo.eng_PDC_Part_Dist u 
ON p.PN=u.PN
--JOIN dbo.eng_Unit_Contract c ON u.Unit=c.Unit
--WHERE u.[Status]='ADD' AND (u.[Contract]='AM' OR u.[Contract]='LAM' OR u.[Contract]='NONE' OR u.[Contract] Like 'MY____' OR u.[Contract]=NULL)

GO
GRANT DELETE ON  [dbo].[ref_DGUNT_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[ref_DGUNT_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[ref_DGUNT_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[ref_DGUNT_PRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
