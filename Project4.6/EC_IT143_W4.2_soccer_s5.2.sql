USE MyCommunities;
GO

/*
Project: My Communities
Community: Soccer

Question:
How many teams are in the soccer dataset?

Step 5.2:
Refine the table.
*/

ALTER TABLE dbo.tbl_Soccer_TotalTeams
ALTER COLUMN TotalTeams INT NOT NULL;
GO

ALTER TABLE dbo.tbl_Soccer_TotalTeams
ADD CONSTRAINT PK_tbl_Soccer_TotalTeams
PRIMARY KEY (TotalTeams);
GO