SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create VIEW [dbo].[vw_etl_eng_ECN_Ext] as
SELECT
    e.FDABCD AS ECN,
    e.FDZFST AS Urgent,
    e.FDZGST AS Reason,
    CASE e.FDZGST
        WHEN 'CSQ' THEN 'Customer Satisfaction/Quality Issue'
        WHEN 'MRO' THEN 'MRO/Raw Material/Conv No'
        WHEN 'MR' THEN 'Mandidory/Regulatory'
        WHEN 'NPR' THEN 'New Product Release'
        WHEN 'PI' THEN 'Process Improvement'
        WHEN 'PE' THEN 'Product Enhancement'
        WHEN 'SR' THEN 'Specifications/Records Correction'
        ELSE NULL
    END AS Reason_Desc,
    e.FDZMST AS OMS_Affected,
    e.FDZNST AS First_Trk_Review_Rqd,
    e.FDZOST AS FSC_Rqd,
    e.FDD3SS AS Unit_SN_Rqd,
    e.FDD2SS AS Comp_SN_Rqd,
    e.FDGLSS AS Hold_ECN,
    e.FDGVSS AS Des_Cons_DB_Consult,
    e.FDNXSS AS Agile_CO,
    e.FDIGDT AS Eff_Date,
    c.TheDate AS Eff_dt
FROM
    dwn_eng_ECN_Ext AS e
LEFT JOIN
    ref_Calendar AS c ON c.CYYMMDD = e.FDIGDT;
GO
