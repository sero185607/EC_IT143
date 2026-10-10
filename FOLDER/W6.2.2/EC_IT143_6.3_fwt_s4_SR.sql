
/*
NAME:    EC_IT143_6.3_fwt_s4_xx.sql
PURPOSE: Create an AFTER UPDATE trigger to track
         the last modified date.

MODIFICATION LOG:
Ver      Date        Author         Description
1.0      10/09/2026  [Your Name]    Created the update trigger.
*/

USE EC_IT143_DA;
GO

CREATE OR ALTER TRIGGER dbo.trg_hello_world_last_mod
ON dbo.t_hello_world
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Prevent the trigger from repeating its own update.
    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    -- Update the modification date for affected records.
    UPDATE t
    SET last_modified_date = GETDATE()
    FROM dbo.t_hello_world AS t
    INNER JOIN inserted AS i
        ON t.my_message = i.my_message;
END;
GO
