SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		K.Latoz
-- Create date:2020*08-28
-- Description:	Function to Return Aftermarket Brand based on PN Format
-- =============================================
CREATE FUNCTION [dbo].[fn_PN_Brand] (@PN varchar(15))
RETURNS varchar(1) 
AS
BEGIN
	-- Declare the return variable here
	DECLARE @PN_Fmt as varchar(15) 
	DECLARE @Brand as varchar(1)

	SET @Brand = 	
Case
	 When len(ltrim(rtrim(@PN)))>9 and ltrim(@PN) like '[A-Z]%' --PN is greater than 9 and starts with Alpha (Hyster-SMH)
		  Then ''
	When len(ltrim(rtrim(@PN)))=9 and  isnumeric(ltrim(rtrim(@PN))) = 1 --PN length is 9 and numeric (Yale)
		Then  'Y'
	When len(ltrim(rtrim(@PN)))=7 and  substring((ltrim(rtrim(@PN))),1,1) <> '8' 
		Then 'H' + ltrim(rtrim(@PN)) + '   '
	Else
		 ''
END


	-- Return the result of the function
RETURN @Brand;

END




GO
