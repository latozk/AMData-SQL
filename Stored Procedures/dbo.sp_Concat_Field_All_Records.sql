SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[sp_Concat_Field_All_Records] (
@Tbl_Name nvarchar(25)
, @key_field nvarchar(25)
, @Concat_Field nvarchar(25)
--, @key_value nvarchar(25)
)

as

Declare @SQLStr nvarchar(500) 

Set @SQLStr = '
With e1 as (
  SELECT Row_Number() OVER(Order By ' + @Key_Field + ' ASC) as Row#
  , ECN,  ' + @Concat_Field + '
    FROM ' + @Tbl_Name + ')

SELECT ECN, ' + @Concat_Field + ' = 
    STUFF((SELECT  '', '' + ' + @Concat_Field + '
           FROM e1 b 
           WHERE b.' + @Key_Field + ' = a.' + @Key_Field + '
          FOR XML PATH('''')), 1, 2, '''+''')
FROM e1 a
GROUP BY ' + @Key_field + ''

Execute sp_executesql @SQLStr 



--**Test **
--exec sp_concat_Field eng_ECN_Note, ECN, Note_Txt, 154074

--Use to see what parsed code looks like
--Print @sqlstr 
 

 --**Original
--With e1 as (
--  SELECT Row_Number() OVER(Order By ECN ASC) as Row#
--  ,ECN, Note_Txt 
--    FROM eng_ECN_Note 
--    WHERE ECN =@key_value -- in ('154074', '100051')
--	)
--SELECT ECN, Note_Txt = 
--    STUFF((SELECT  ', ' + Note_Txt
--           FROM e1 b 
--           WHERE b.Ecn = a.Ecn
--          FOR XML PATH('')), 1, 2, '')
--FROM e1 a
--GROUP BY ECN



GO
