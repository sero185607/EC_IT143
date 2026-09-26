USE MyCommunities;
GO

/*
Project: My Communities
Community: Soccer

Question:
How many teams are in the soccer dataset?

Step 6:
Load the table.
*/

TRUNCATE TABLE dbo.tbl_Soccer_TotalTeams;
GO

INSERT INTO dbo.tbl_Soccer_TotalTeams (TotalTeams)
SELECT TotalTeams
FROM dbo.vw_Soccer_TotalTeams;
GO