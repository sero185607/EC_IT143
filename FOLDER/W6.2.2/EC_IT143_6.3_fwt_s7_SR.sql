
/*
NAME:    EC_IT143_6.3_fwt_s7_xx.sql
PURPOSE: Track the last modified date and server user.
*/

USE EC_IT143_DA;
GO

CREATE OR ALTER TRIGGER dbo.trg_hello_world_last_mod
ON dbo.t_hello_world
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Prevent the trigger from processing its own audit update.
    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    -- Store the modification date and current SQL Server login.
    UPDATE t
    SET
        last_modified_date = GETDATE(),
        last_modified_by = SUSER_SNAME()
    FROM dbo.t_hello_world AS t
    INNER JOIN inserted AS i
        ON t.my_message = i.my_message;
END;
GO
