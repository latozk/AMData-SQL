SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		K.Latoz
-- Create date:2020*07-18
-- Description:	Function to format part numbers to AS400 Format
-- =============================================
CREATE FUNCTION [dbo].[fn_PN_Fmt_Core_AM] (@PN varchar(15))
RETURNS varchar(15) 
AS
BEGIN
	-- Declare the return variable here
	DECLARE @PN_Fmt as varchar(15) 

	SET @PN_Fmt = 	
Case
	 When len(ltrim(rtrim(@PN)))>9 and ltrim(@PN) like '[A-Z]%'
		  Then Left(ltrim(rtrim(@PN)) + '   ', 12)
	When len(ltrim(rtrim(@PN)))=9 and  isnumeric(ltrim(rtrim(@PN))) = 1
		Then 'Y' + ltrim(rtrim(@PN)) + '   '
	/* Added 2023-01-30 per request from Robin */
	When len(ltrim(rtrim(@PN)))=8 and ltrim(@PN) like '%[A-Z]'
        Then ' ' + Left(ltrim(rtrim(@PN)), 7)+' '+ Right(ltrim(rtrim(@PN)),1)+ '  '
	Else
		' ' + Left(ltrim(rtrim(@PN)) + '            ', 11)
END


	-- Return the result of the function
RETURN @PN_Fmt;

END


GO
