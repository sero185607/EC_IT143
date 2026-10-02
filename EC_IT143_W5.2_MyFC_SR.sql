/*
    EC_IT143_W5.2_MyFC_SR.sql

    My Communities Analysis - Create Answers
    Community: MyFC
    Student Initials: SR
*/

USE MyCommunities;
GO


/* =========================================================
   QUESTION 1
   Original Author: Me

   How many teams are in the dataset?
   ========================================================= */

SELECT
    COUNT(*) AS total_teams
FROM dbo.TEAM;


/* =========================================================
   QUESTION 2
   Original Author: Me

   How many attribute records does each team have?
   ========================================================= */

SELECT
    team_api_id,
    COUNT(*) AS attribute_records
FROM dbo.TEAMATTRIBUTES
GROUP BY team_api_id
ORDER BY team_api_id;


/* =========================================================
   QUESTION 3
   Original Author: Me

   What is the latest date for each team attribute record?
   ========================================================= */

SELECT
    team_api_id,
    MAX(date) AS latest_date
FROM dbo.TEAMATTRIBUTES
GROUP BY team_api_id
ORDER BY team_api_id;


/* =========================================================
   QUESTION 4
   Original Author: Another Student

   What is the average build-up passing value for each team?
   ========================================================= */

SELECT
    t.team_long_name,
    AVG(CAST(ta.buildUpPlayPassing AS DECIMAL(10,2)))
        AS average_passing
FROM dbo.TEAM AS t
INNER JOIN dbo.TEAMATTRIBUTES AS ta
    ON t.team_api_id = ta.team_api_id
WHERE ta.buildUpPlayPassing IS NOT NULL
GROUP BY t.team_long_name
ORDER BY average_passing DESC;
GO