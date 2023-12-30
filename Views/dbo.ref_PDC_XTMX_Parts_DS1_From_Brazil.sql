SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE view [dbo].[ref_PDC_XTMX_Parts_DS1_From_Brazil] as 

--Gets PNs used on the A386/A986 and B386/B986 with LAM theater usage.
WITH LAM AS
(
SELECT [PN]
  FROM [dbo].[eng_PDC_Part_Dist_Agile]
  WHERE [Theater]='LAM' AND (Unit Like 'A986' OR Unit Like 'A386' OR Unit Like 'B986' OR Unit Like 'B386')
)
--Gets PNs used on the A386/A986 and B386/B986 with Brazil theater usage.
, Brazil AS
(
SELECT [PN]
  FROM [dbo].[eng_PDC_Part_Dist_Agile]
  WHERE[Theater]='Brazil' AND (Unit Like 'A986' OR Unit Like 'A386' OR Unit Like 'B986' OR Unit Like 'B386')
)
--Gets PNs used on LAM units other than the A386/A986 and B386/B986 and also gets PNs used on any unit with AM theater usage.
, Other AS
(
SELECT [PN]
  FROM [dbo].[eng_PDC_Part_Dist_Agile]
  WHERE [Theater]='AM' OR ([Theater]='LAM' AND (Unit Not Like 'A986' AND Unit Not Like 'A386' AND Unit Not Like 'B986' AND Unit Not Like 'B386'))
)
--Gets PNs used only on the A386/A986 and B386/B986 with both LAM and Brazil theater usage and not used on other supported PDC units.

SELECT DISTINCT LAM.[PN]
FROM LAM
LEFT JOIN Brazil ON LAM.[PN]=Brazil.[PN]
LEFT JOIN Other
ON LAM.[PN]=Other.[PN]
WHERE Other.[PN] IS NULL



GO
