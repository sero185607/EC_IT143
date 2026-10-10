
/*
NAME:    EC_IT143_6.3_fwf_s3_SR.sql
PURPOSE: Test a query to extract the first name from ContactName.
*/

USE EC_IT143_DA;
GO

-- Q1: How can I extract the first name from ContactName?
-- A1: I can use LEFT and CHARINDEX to find the first word.

SELECT
    CustomerID,
    CustomerName,
    ContactName,
    LEFT(
        LTRIM(RTRIM(ContactName)),
        CHARINDEX(' ', LTRIM(RTRIM(ContactName)) + ' ') - 1
    ) AS FirstName
FROM dbo.t_w3_schools_customers
ORDER BY CustomerID;
GO
