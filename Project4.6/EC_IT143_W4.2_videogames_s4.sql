USE MyCommunities;
GO

/*
Project: My Communities
Community: Video Games

Question:
How many games are in the video games dataset?

Step 4:
Create a view.
*/

CREATE OR ALTER VIEW dbo.vw_VideoGames_TotalGames
AS
SELECT COUNT(*) AS TotalGames
FROM dbo.game;
GOç