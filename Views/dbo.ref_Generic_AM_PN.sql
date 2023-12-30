SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE view [dbo].[ref_Generic_AM_PN] as 
SELECT DISTINCT ltrim(rtrim(Prod_PN)) AS Prod_PN
,ltrim(rtrim(AM_PN)) AS AM_PN
, dbo.fn_PN_Fmt_Core_AM(Prod_PN) as Prod_PN_AS400
, dbo.fn_PN_Fmt_Core_AM([AM_PN]) as AM_PN_AS400
FROM ref_CORE_AM
WHERE AM_Brand<>'AMSN '
GO
