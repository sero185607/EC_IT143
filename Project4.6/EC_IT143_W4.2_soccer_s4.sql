USE MyCommunities;
GO

/*
Project: My Communities
Community: Soccer

Question:
How many teams are in the soccer dataset?

View:
Returns the total number of teams in the TEAM table.
*/

CREATE VIEW dbo.vw_Soccer_TotalTeams
AS
SELECT COUNT(*) AS TotalTeams
FROM dbo.TEAM;
GO