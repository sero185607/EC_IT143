USE MyCommunities;
GO

/*
Project: My Communities
Community: Video Games

Question:
How many games are in the video games dataset?

Step 7:
Create a stored procedure.
*/

CREATE OR ALTER PROCEDURE dbo.usp_VideoGames_TotalGames
AS
BEGIN
    SELECT TotalGames
    FROM dbo.tbl_VideoGames_TotalGames;
END;
GO