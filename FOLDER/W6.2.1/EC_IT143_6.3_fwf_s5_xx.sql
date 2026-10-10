
/*
NAME:    EC_IT143_6.3_fwf_s5_SR.sql
PURPOSE: Create a scalar function to extract the first name.

MODIFICATION LOG:
Ver      Date        Author         Description
1.0      10/09/2026  [Your Name]    Created the first-name function.
*/

USE EC_IT143_DA;
GO

-- Q1: How can I extract the first name from ContactName?
-- A1: I created a scalar function using LEFT and CHARINDEX.

CREATE OR ALTER FUNCTION dbo.ufn_w3_schools_first_name
(
    @ContactName NVARCHAR(100)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @CleanName NVARCHAR(100);

    SET @CleanName = LTRIM(RTRIM(@ContactName));

    IF @CleanName IS NULL OR @CleanName = ''
        RETURN NULL;

    RETURN LEFT(
        @CleanName,
        CHARINDEX(' ', @CleanName + ' ') - 1
    );
END;
GO

-- Test the function with a contact name.
SELECT dbo.ufn_w3_schools_first_name(N'Ana Trujillo')
    AS FirstName;
GO
