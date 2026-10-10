
/*
NAME:    EC_IT143_6.3_fwt_s5_xx.sql
PURPOSE: Test the AFTER UPDATE trigger.
*/

USE EC_IT143_DA;
GO

-- Create a test row if it does not already exist.
IF NOT EXISTS
(
    SELECT 1
    FROM dbo.t_hello_world
    WHERE my_message = 'W6_Trigger_Test'
)
BEGIN
    INSERT INTO dbo.t_hello_world (my_message)
    VALUES ('W6_Trigger_Test');
END;
GO

-- Check the values before the UPDATE.
SELECT
    my_message,
    current_date_time,
    last_modified_by,
    last_modified_date
FROM dbo.t_hello_world
WHERE my_message = 'W6_Trigger_Test';
GO

-- Wait one second so the timestamp change is easier to observe.
WAITFOR DELAY '00:00:01';

-- Modify the record to activate the trigger.
UPDATE dbo.t_hello_world
SET current_date_time = GETDATE()
WHERE my_message = 'W6_Trigger_Test';
GO

-- Check the values after the UPDATE.
SELECT
    my_message,
    current_date_time,
    last_modified_by,
    last_modified_date
FROM dbo.t_hello_world
WHERE my_message = 'W6_Trigger_Test';
GO
