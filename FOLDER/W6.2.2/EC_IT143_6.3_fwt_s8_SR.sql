
/*
NAME:    EC_IT143_6.3_fwt_s8_xx.sql
PURPOSE: Test the last modified date and user trigger.
*/

USE EC_IT143_DA;
GO

-- Create a test record if it does not exist.
IF NOT EXISTS
(
    SELECT 1
    FROM dbo.t_hello_world
    WHERE my_message = 'W6_Test_User'
)
BEGIN
    INSERT INTO dbo.t_hello_world (my_message)
    VALUES ('W6_Test_User');
END;
GO

-- Show the values before the update.
SELECT
    my_message,
    current_date_time,
    last_modified_by,
    last_modified_date
FROM dbo.t_hello_world
WHERE my_message = 'W6_Test_User';
GO

-- Update the record to activate the trigger.
WAITFOR DELAY '00:00:01';

UPDATE dbo.t_hello_world
SET current_date_time = DATEADD(SECOND, 1, current_date_time)
WHERE my_message = 'W6_Test_User';
GO

-- Verify the final values.
SELECT
    my_message,
    current_date_time,
    last_modified_by,
    last_modified_date
FROM dbo.t_hello_world
WHERE my_message = 'W6_Test_User';
GO
