SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_etl_eng_Part_Master] AS 
SELECT
    p.BBB9CD AS PN,
    p.BBM8ST AS Warranty,
    p.BBABCD AS ECN,
    p.BBBLCD AS Loc,
    p.BBB6CD AS Vend,
    p.BBB8CD AS VPN,
    p.BBCBCD AS Replacing_Part,
    p.BBGZCD AS Comm,
    p.BBEVST AS Test_Status,
    p.BBEWST AS Type,
    p.BBEXST AS Dwg_Size,
    p.BBCKTX AS Chart,
    p.BBCLTX AS Rel_Proj,
    p.BBCMTX AS Rel_EPO,
    p.BBCNTX AS Rel_ECN,
    p.BBAODT AS Rel_Date,
    p.BBCQTX AS EPO_Cur_Rev,
    p.BBAPDT AS Latest_EPO_Date,
    p.BBEYST AS VASP_List,
    p.BBEZST AS Status,
    p.BBE0ST AS HCE,
    p.BBAQDT AS VASP_ECN_Date,
    p.BBE1ST AS HY_Fmt,
    p.bbaxna AS Desc_1,
    p.BBAYNA AS Desc_2,
    p.bbazna AS Desc_3,
    p.BBE2ST AS Part_In_Use,
    p.BBE3ST AS Kit_List,
    p.BBCYNB AS Rev,
    p.BBIUST AS Tran_Status,
    p.BBD3NB AS EPO_Rev,
    p.BBSFST AS CAD_Sys,
    p.BBIWNB AS Shts,
    p.BBK1TX AS UOM,
    p.BBULST AS Serviced,
    p.Software_Req,
    CASE p.BBM8ST
        WHEN 'A' THEN 'Software Required: Activated via truck display.'
        WHEN 'O' THEN 'Software Required: Ordered by dealer.'
        WHEN 'N' THEN 'No Software Required.'
        ELSE NULL
    END AS Software_Msg,
    c1.TheDate AS Rel_Dt,
    c2.TheDate AS Latest_EPO_Dt,
    c3.TheDate AS VASP_ECN_Dt
FROM
    dwn_eng_Part_Master AS p
LEFT JOIN
    ref_Calendar AS c1 ON c1.CYYMMDD = p.BBAODT
LEFT JOIN
    ref_Calendar AS c2 ON c2.CYYMMDD = p.BBAPDT
LEFT JOIN
    ref_Calendar AS c3 ON c3.CYYMMDD = p.BBAQDT;
GO
