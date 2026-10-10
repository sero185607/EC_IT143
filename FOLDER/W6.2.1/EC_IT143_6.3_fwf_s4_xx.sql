
/*
NAME:    EC_IT143_6.3_fwf_s4_SR.sql
PURPOSE: Research and test a solution to extract the first name.

MODIFICATION LOG:
Ver      Date        Author         Description
1.0      10/09/2026  [Your Name]    Researched and tested the query.
*/

USE EC_IT143_DA;
GO

-- Q1: How can I extract the first name from ContactName?
-- A1: LEFT returns characters from the beginning of a string.
-- CHARINDEX finds the position of the first space.
-- LTRIM and RTRIM remove extra spaces.

-- Research sources:
-- LEFT:
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/left-transact-sql
-- CHARINDEX:
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql

-- Test the solution using the W3 Schools customers table.

SELECT TOP (10)
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
