SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[sp_ref_PN_Fmt] AS

TRUNCATE TABLE ref_PN_Fmt;

--GO Msg 2627, Level 14, State 1, Line 37
--Violation of PRIMARY KEY constraint 'PK_ref_PN_Fmt'. Cannot insert duplicate key in object 'dbo.ref_PN_Fmt'. The duplicate key value is ( 1329206    ).

---- =============================================
----Author: Newell, R
----Date: 2020-04-17
----Purpose: Create a table containing all Part Master PNs with commonly used PN formats.  
----The table can be used to bridge pick lists with various PN formats to eng and pdc tables.
----Modification notes:
---- =============================================

WITH pm As
(
SELECT pma.Part_No
FROM pdc_Part_Master pma
Union 
SELECT pmi.Part_No
FROM pdc_Part_Master_Inact pmi
)


INSERT INTO [ref_PN_Fmt]
SELECT [Part_No]

, CASE

	WHEN [Part_No] Like '[^Y]%' 
	OR [Part_No] Like 'S%' 
	OR [Part_No] Like 'U%' 
	OR [Part_No] Like 'YFP%'
	THEN 'NMH-'+RTRIM(LTRIM([Part_No]))

	WHEN RTRIM(LTRIM([Part_No])) Like 'Y_________'AND [Part_No] Not like 'YFP%'
	THEN 'NMH-'+RIGHT(RTRIM([Part_No]),9)

	WHEN RTRIM(LTRIM([Part_No])) Like 'Y__________'AND [Part_No] Not like 'YFP%'
	THEN 'NMH-'+RIGHT(RTRIM([Part_No]),10)

	WHEN RTRIM(LTRIM([Part_No])) Like 'Y___________'AND [Part_No] Not like 'YFP%'
	THEN 'NMH-'+RIGHT(RTRIM([Part_No]),11)

	ELSE Null

	END AS [SVG_PN]

, CASE

	WHEN [Part_No] Like 'S%' 
	OR [Part_No] Like 'U%' 
	OR [Part_No] Like ' 31FP%' 
	OR RTRIM([Part_No]) Like ' [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
	OR RTRIM([Part_No]) Like '[^Y]______[0-9]' AND ([Part_No] Not Like '%FP%' AND [Part_No] Not Like '[^Y][A-Z]%99999' AND [Part_No] Not Like '[^Y][A-Z][A-Z][A-Z][A-Z]%')
	THEN RTRIM(LTRIM([Part_No]))

	WHEN RTRIM(LTRIM([Part_No])) Like 'Y_________' AND ([Part_No] Not Like '%FP%' AND [Part_No] Not Like 'Y[A-Z]%99999' AND [Part_No] Not Like 'Y[A-Z][A-Z][A-Z][A-Z]%')
	THEN RIGHT(RTRIM(LTRIM([Part_No])),9)
	
	WHEN RTRIM(LTRIM([Part_No])) Like 'S___________'
	THEN RIGHT(RTRIM(LTRIM([Part_No])),11)

	WHEN [Part_No] Like ' _______ [A-Z]  '
	THEN LEFT(RTRIM(LTRIM([Part_No])),7)+RIGHT(RTRIM(LTRIM([Part_No])),1)

	WHEN [Part_No] Like  ' ______[A-Z]'
	THEN '0'+Left(RTRIM(LTRIM([Part_No])),7)
	
	ELSE Null
	
	END AS [COREPN]

, CASE

	WHEN [Part_No] Like ' 00000__[A_Z][A-Z]  '
	THEN Left(Right([Part_No],6),2) + SPACE(1) + Left(Right([Part_No],4),2)

	WHEN [Part_No] Like ' 0000___[A_Z][A-Z]  '
	THEN Left(Right([Part_No],7),3) + SPACE(1) + Left(Right([Part_No],4),2)
	
	WHEN [Part_No] Like ' 000____[A-Z][A-Z]  '
	THEN Left(Right([Part_No],8),4) + SPACE(1) + Left(Right([Part_No],4),2)
	
	WHEN [Part_No] Like ' 00_____[A-Z][A-Z]  '
	THEN Left(Right([Part_No],9),5) + SPACE(1) + Left(Right([Part_No],4),2)
	
	WHEN [Part_No] Like ' 0______[A-Z][A-Z]  '
	THEN Left(Right([Part_No],10),6) + SPACE(1) + Left(Right([Part_No],4),2)
	
	WHEN [Part_No] Like ' _______[A-Z][A-Z]  '
	THEN Left(Right([Part_No],11),7) + SPACE(1) + Left(Right([Part_No],4),2)     

	WHEN [Part_No] Like ' 00000__'
	THEN RTRIM(Right([Part_No],2))
	
	WHEN [Part_No] Like ' 0000___'
	THEN RTRIM(Right([Part_No],3))
	
	WHEN [Part_No] Like ' 000____'
	THEN RTRIM(Right([Part_No],4))
	
	WHEN [Part_No] Like ' 00_____'
	THEN RTRIM(Right([Part_No],5))
	
	WHEN [Part_No] Like ' 0______'
	THEN RTRIM(Right([Part_No],6))
	
	ELSE LTRIM(RTRIM([Part_No]))
	
	END AS [PM_Entered_Part_No]

,CASE
	
	WHEN [Part_No] Like ' 00000__[A_Z][A-Z]  '
	THEN Left(Right([Part_No],6),2) + SPACE(1) + Left(Right([Part_No],4),2)
	
	WHEN [Part_No] Like ' 0000___[A_Z][A-Z]  '
	THEN Left(Right([Part_No],7),3) + SPACE(1) + Left(Right([Part_No],4),2)
	
	WHEN [Part_No] Like ' 000____[A-Z][A-Z]  '
	THEN Left(Right([Part_No],8),4) + SPACE(1) + Left(Right([Part_No],4),2)
	
	WHEN [Part_No] Like ' 00_____[A-Z][A-Z]  '
	THEN Left(Right([Part_No],9),5) + SPACE(1) + Left(Right([Part_No],4),2)
	
	WHEN [Part_No] Like ' 0______[A-Z][A-Z]  '
	THEN Left(Right([Part_No],10),6) + SPACE(1) + Left(Right([Part_No],4),2)
	
	WHEN [Part_No] Like ' _______[A-Z][A-Z]  '
	THEN Left(Right([Part_No],11),7) + SPACE(1) + Left(Right([Part_No],4),2)   
	
	WHEN [Part_No] Like ' 00000__'
	THEN RTRIM(Right([Part_No],2))
	
	WHEN [Part_No] Like ' 0000___'
	THEN RTRIM(Right([Part_No],3))
	
	WHEN [Part_No] Like ' 000____'
	THEN RTRIM(Right([Part_No],4))
	
	WHEN [Part_No] Like ' 00_____'
	THEN RTRIM(Right([Part_No],5))
	
	WHEN [Part_No] Like ' 0__________'
	THEN RTRIM(Right([Part_No],6))
    
	WHEN RTRIM([Part_No]) Like 'Y_________'
	THEN Right(RTRIM([Part_No]),9)
	
	WHEN RTRIM([Part_No]) Like 'Y__________'
	THEN Right(RTRIM([Part_No]),10)
	
	WHEN RTRIM([Part_No]) Like 'Y__________[A-Z]'
	THEN Right(RTRIM([Part_No]),11)
	
	WHEN RTRIM([Part_No]) Like 'Y_________[0-9][0-9]'
	THEN 'Y'+Right(RTRIM([Part_No]),11)
    
	ELSE LTRIM(RTRIM([Part_No]))
	
	END AS [DB_ENTERED_Part_No]

FROM pm
--Where Part_No=' 071640A'
--WHERE [Part_No]=' 0000142    '
----Scenarios
--OR [Part_No] Like ' _______    '
--OR [Part_No] Like ' [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]   '
--OR [Part_No] Like ' _______  [0-9][0-9]'
--OR [Part_No] Like ' _______ [0-9][0-9][0-9]'
--OR [Part_No] Like ' _______ [A-Z]  '
--OR [Part_No] Like ' _______[A-Z]___'
--OR [Part_No] Like '[^Y]%'
--OR [Part_No] Like 'Y_________  '
--OR [Part_No] Like 'Y_________[0-9][0-9]'
--OR [Part_No] Like 'Y_________[A-Z]_'
----Examples
--OR [Part_No] Like '%FP%'
--OR [Part_No] Like '%9999%'
--OR [Part_No] Like '%PICK%'
--OR [Part_No]=' 3050155    '
--OR [Part_No]='Y504228284  '
--OR [Part_No] =  ' 0027850AB  '
--OR [Part_No] =  ' 0027850 AB '
--OR [Part_No] =  ' 0027850  AB'
--OR [Part_No] =  ' 0002009 B03'
--OR [Part_No] =  ' 0012425 100'
--OR [Part_No] Like 'S012%'
--OR [Part_No] Like 'U03%'
--OR [Part_No] =  'Y150105816  '
--OR [Part_No] =  'Y150105816RL'
--OR [Part_No] Like ' 0000068 B  '
 
ORDER BY [Part_No]

GO
