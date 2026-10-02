/*
    EC_IT143_W5.2_VideoGames_SR.sql

    My Communities Analysis - Create Answers
    Community: Video Games
    Student Initials: SR
*/

USE MyCommunities;
GO


/* =========================================================
   QUESTION 1
   Original Author: Me

   How many games are in the dataset?
   ========================================================= */

SELECT
    COUNT(*) AS total_games
FROM dbo.game;


/* =========================================================
   QUESTION 2
   Original Author: Me

   How many games are in each genre?
   ========================================================= */

SELECT
    g.genre_name,
    COUNT(*) AS total_games
FROM dbo.game AS gm
INNER JOIN dbo.genre AS g
    ON gm.genre_id = g.id
GROUP BY g.genre_name
ORDER BY total_games DESC;


/* =========================================================
   QUESTION 3
   Original Author: Me

   How many games are available on each platform?
   ========================================================= */

SELECT
    p.platform_name,
    COUNT(*) AS total_games
FROM dbo.game_platform AS gp
INNER JOIN dbo.platform AS p
    ON gp.platform_id = p.id
GROUP BY p.platform_name
ORDER BY total_games DESC;


/* =========================================================
   QUESTION 4
   Original Author: Another Student

   What is the average release year for each platform?
   ========================================================= */

SELECT
    p.platform_name,
    AVG(CAST(gp.release_year AS DECIMAL(10,2)))
        AS average_release_year
FROM dbo.game_platform AS gp
INNER JOIN dbo.platform AS p
    ON gp.platform_id = p.id
WHERE gp.release_year IS NOT NULL
GROUP BY p.platform_name
ORDER BY average_release_year;
GO