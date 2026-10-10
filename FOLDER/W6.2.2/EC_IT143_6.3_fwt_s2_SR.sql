
/*
NAME:    EC_IT143_6.3_fwt_s2_xx.sql
PURPOSE: Begin creating an answer.

MODIFICATION LOG:
Ver      Date        Author         Description
1.0      10/09/2026  [Your Name]    Documented the initial solution.
*/

USE EC_IT143_DA;
GO

-- Q1: How can I keep track of when a record was last modified?
-- A1: A DEFAULT constraint with GETDATE() works for the initial INSERT.

-- Q2: How can I keep track of when a record is modified again?
-- A2: Maybe I can use an AFTER UPDATE trigger.
