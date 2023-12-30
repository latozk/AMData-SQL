SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[ref_PDC_PN_VC_eng_ECN_Part_Dwg_Concat_CO_pl] as 



SELECT DISTINCT c.ECN, c.PN, c.Dwg_Chg, d.Set_Vend
FROM dbo.eng_ECN_Part_Dwg_Concat_CO_pl c
JOIN ref_CORE_PN_XRef x
ON c.PN=x.CORE_PN
LEFT JOIN dbo.ref_pdc_Part_Set_Detail d
ON x.PNAS400Fmt=d.PN

GO
