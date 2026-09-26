USE MyCommunities;
GO

/*
Project: My Communities
Community: Soccer

Question:
How many teams are in the soccer dataset?

Step 5.1:
Create a table from the view.
*/

SELECT *
INTO dbo.tbl_Soccer_TotalTeams
FROM dbo.vw_Soccer_TotalTeams;
GO