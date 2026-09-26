USE MyCommunities;
GO

/*
Project: My Communities
Community: Video Games

Question:
How many games are in the video games dataset?

Step 6:
Load the table.
*/

TRUNCATE TABLE dbo.tbl_VideoGames_TotalGames;
GO

INSERT INTO dbo.tbl_VideoGames_TotalGames (TotalGames)
SELECT TotalGames
FROM dbo.vw_VideoGames_TotalGames;
GO