USE MyCommunities;
GO

/*
Project: My Communities
Community: Video Games

Question:
How many games are in the video games dataset?

Step 5.1:
Create a table from the view.
*/

SELECT *
INTO dbo.tbl_VideoGames_TotalGames
FROM dbo.vw_VideoGames_TotalGames;
GO