SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_etl_eng_ECN] AS 
SELECT
    e.ABABCD AS ECN,
    e.ABAADT AS Init_Date,
    e.ABABTX AS Model_1,
    e.ABACTX AS Model_2,
    e.ABABST AS Urgent,
    e.ABACST AS Serv_Prob_Ref,
    e.ABADST AS Cst_Red,
    e.ABADTX AS Eff_SN,
    e.ABAETX AS Serv_Prob,
    e.ABAEST AS EEC_Affected,
    e.ABAFST AS UL_FM_Affected,
    e.ABADCD AS Origin,
    e.ABAECD AS T_PN_Proj,
    e.ABAGST AS IC,
    e.ABAHST AS EL,
    e.ABAIST AS Drive_Line,
    e.ABAJST AS Mast_Attch,
    e.ABAKST AS SN_Rqd_Unit,
    e.ABALST AS SN_Rqd_Engine,
    e.ABAMST AS SN_Rqd_Xmsn,
    e.ABANST AS SN_Rqd_Mast,
    e.ABAOST AS SN_Rqd_Attch,
    e.ABAPST AS SN_Rqd_None,
    e.ABAQST AS Sales_Lit_Affected,
    e.ABARST AS PFI_SFI_Affected,
    e.ABASST AS Tech_Pubs_Affected,
    e.ABATST AS Dwgs_Affected,
    e.ABAUST AS Impl_Reporting,
    e.ABAVST AS Comp_Common,
    e.ABAWST AS New_Rel,
    e.ABAXST AS Status,
    e.ABEIST AS Spl_Proc_None,
    e.ABGKST AS Released,
    e.ABIMST AS Attch,
    e.ABKMST AS Serv_Part_Affected,
    e.ABE7TX AS Desc_1,
    e.ABCENA AS Desc_2,
    e.ABM7ST AS VIP_Cat,
    e.ABOBST AS DSN_Appr_ID,
    e.ABOCST AS RVW_Appr_ID,
    e.ABODST AS MFG_Appr_ID,
    e.ABOEST AS ADM_Appr_ID,
    e.ABCODT AS DSN_Appr_Date,
    e.ABCPDT AS RVW_Appr_Date,
    e.ABCQDT AS MFG_Appr_Date,
    e.ABCRDT AS ADM_Appr_Date,
    e.ABUKST AS Cat,
    CASE e.ABUKST
        WHEN '1' THEN 'Production'
        WHEN '2' THEN 'VASP'
        WHEN '3' THEN 'Records'
        WHEN '4' THEN 'All Makes'
        WHEN '5' THEN 'Aftermarket'
        WHEN '6' THEN 'Advance Release'
        WHEN '7' THEN 'SPED'
        WHEN '8' THEN 'MRO/Raw Material'
        ELSE NULL
    END AS Cat_Desc,
    e.ABJCCD AS User_ID,
    e.ABC4CD AS Proj_Prefix,
    e.ABBRCD AS Proj,
    c1.TheDate AS Init_Dt,
    c2.TheDate AS DSN_Appr_Dt,
    c3.TheDate AS RVW_Appr_Dt,
    c4.TheDate AS MFG_Appr_Dt,
    c5.TheDate AS ADM_Appr_Dt
FROM
    dwn_eng_ECN AS e
LEFT JOIN
    ref_Calendar AS c1 ON c1.CYYMMDD = e.ABAADT
LEFT JOIN
    ref_Calendar AS c2 ON c2.CYYMMDD = e.ABCODT
LEFT JOIN
    ref_Calendar AS c3 ON c3.CYYMMDD = e.ABCPDT
LEFT JOIN
    ref_Calendar AS c4 ON c4.CYYMMDD = e.ABCQDT
LEFT JOIN
    ref_Calendar AS c5 ON c5.CYYMMDD = e.ABCRDT;
GO
