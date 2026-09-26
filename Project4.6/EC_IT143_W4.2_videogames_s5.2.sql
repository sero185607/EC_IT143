USE MyCommunities;
GO

/*
Project: My Communities
Community: Video Games

Question:
How many games are in the video games dataset?

Step 5.2:
Refine the table.
*/

ALTER TABLE dbo.tbl_VideoGames_TotalGames
ALTER COLUMN TotalGames INT NOT NULL;
GO

ALTER TABLE dbo.tbl_VideoGames_TotalGames
ADD CONSTRAINT PK_tbl_VideoGames_TotalGames
PRIMARY KEY (TotalGames);
GO