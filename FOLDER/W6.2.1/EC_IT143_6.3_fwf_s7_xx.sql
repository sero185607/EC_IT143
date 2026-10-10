
/*
NAME:    EC_IT143_6.3_fwf_s7_SR.sql
PURPOSE: Verify that the scalar function matches the ad hoc query.
*/

USE EC_IT143_DA;
GO

-- Expected result: zero rows if the function works correctly.

WITH NameCheck AS
(
    SELECT
        CustomerID,
        ContactName,

        -- Original ad hoc query
        LEFT(
            LTRIM(RTRIM(ContactName)),
            CHARINDEX(' ', LTRIM(RTRIM(ContactName)) + ' ') - 1
        ) AS FirstName_AdHoc,

        -- User-defined scalar function
        dbo.ufn_w3_schools_first_name(ContactName) AS FirstName_UDF

    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM NameCheck
WHERE ISNULL(FirstName_AdHoc, N'<NULL>')
   <> ISNULL(FirstName_UDF, N'<NULL>');
GO
