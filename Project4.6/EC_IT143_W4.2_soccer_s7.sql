USE MyCommunities;
GO

/*
Project: My Communities
Community: Soccer

Question:
How many teams are in the soccer dataset?

Step 7:
Create a stored procedure.
*/

CREATE OR ALTER PROCEDURE dbo.usp_Soccer_TotalTeams
AS
BEGIN
    SELECT TotalTeams
    FROM dbo.tbl_Soccer_TotalTeams;
END;
GO