SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		K.Latoz
-- Create date: 06/08/2020
-- Description:	Function to Concantenate Fields
-- =============================================
CREATE FUNCTION [dbo].[fn_Concat_Field] (
@Tbl_Name nvarchar(25)
, @key_field nvarchar(25)
, @Concat_Field nvarchar(25)
, @key_value nvarchar(25)
)
RETURNS nvarchar(500) 
AS
BEGIN
Declare @Concat nvarchar(500)
Declare @SQLStr nvarchar(500) 
;
--With e1 as (
--  SELECT Row_Number() OVER(Order By @Key_Field  ASC) as Row#
--  , @Key_Field as Key_Field, @Concat_Field as Concat_Field
--    FROM eng_ecn_Note
--	 WHERE @Key_Field = @Key_Value )

--SELECT Key_Field, Concat_Field = 
--    STUFF((SELECT  '', '' + Concat_Field
--           FROM e1 b 
--           WHERE b.Key_Field= a.Key_Field 
--          FOR XML PATH('')), 1, 2, '')
--FROM e1 a
--GROUP BY Key_field

RETURN @Concat_Field

END

GO
