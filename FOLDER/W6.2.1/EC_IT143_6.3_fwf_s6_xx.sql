
/*
NAME:    EC_IT143_6.3_fwf_s6_SR.sql
PURPOSE: Compare the ad hoc query with the scalar function.

MODIFICATION LOG:
Ver      Date        Author         Description
1.0      10/09/2026  [Your Name]    Compared query and function results.
*/

USE EC_IT143_DA;
GO

-- Compare the two methods side by side.

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
ORDER BY CustomerID;
GO
