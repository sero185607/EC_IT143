
/*
NAME:    EC_IT143_6.3_fwt_s6_xx.sql
PURPOSE: Ask the next question about tracking modifications.
*/

USE EC_IT143_DA;
GO

-- Q1: How can I keep track of when a record was last modified?
-- A1: An AFTER UPDATE trigger can update the modification date.

-- Q2: How can I keep track of who last modified a record?
-- A2: I can use SUSER_SNAME() to get the current SQL Server login.

-- Next step:
-- Update the trigger to record both the modification date
-- and the user who made the change.
