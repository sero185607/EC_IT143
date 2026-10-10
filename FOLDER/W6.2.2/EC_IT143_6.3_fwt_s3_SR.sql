
/*
NAME:    EC_IT143_6.3_fwt_s3_xx.sql
PURPOSE: Research and test a solution for tracking modifications.

MODIFICATION LOG:
Ver      Date        Author         Description
1.0      10/09/2026  [Your Name]    Researched the trigger solution.
*/

USE EC_IT143_DA;
GO

-- Q1: How can I keep track of when a record was last modified?
-- A1: A DEFAULT constraint works for the initial INSERT.

-- Q2: How can I update the modification date after an UPDATE?
-- A2: I can create an AFTER UPDATE trigger.

-- Research sources:
-- https://stackoverflow.com/questions/9522982/t-sql-trigger-update
-- https://stackoverflow.com/questions/4574010/how-to-create-trigger-to-keep-track-of-last-changed-data

-- Test the current table before creating the trigger.
SELECT
    my_message,
    current_date_time,
    last_modified_by,
    last_modified_date
FROM dbo.t_hello_world;
GO
