/*
Write a solution to report the fraction of players that logged in again on the day after the day they first logged in,
rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least 
two consecutive days starting from their first login date, then divide that number by the total number of players.
*/ 
-----------------------------------------------------------------------------------------------------------------------------

-- Creating the table and inserting values 

DROP TABLE IF EXISTS dbo.lc550

CREATE TABLE dbo.lc550 (
	player_id INT, 
	device_id INT,
	event_date DATE,
	games_played INT
);

INSERT INTO dbo.lc550 (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

SELECT * FROM dbo.lc550;
----------------------------------------------------------------------------------------------------------------
-- Wrting the solution

GO

WITH cte1 AS (
	SELECT 
		DISTINCT player_id, 
		MIN(event_date) AS first_logged,
		DATEADD(DAY, 1, MIN(event_date)) AS next_day
	FROM dbo.lc550  
	GROUP BY player_id
), 
cte2 AS 
(
	SELECT 
		 lc.player_id
	FROM 
		dbo.lc550 lc
	INNER JOIN 
		cte1 e ON lc.player_id = e.player_id
	WHERE 
		lc.event_date = e.next_day
)
SELECT
(ROUND((SELECT COUNT(*) * 1.0 FROM cte2) / (SELECT COUNT(player_id) * 1.0 FROM cte1),2))
AS fraction;

GO
----------------------------------------------------------------------------------------------------------------

/* primary solution :

WITH cte AS (
	SELECT 
		DISTINCT player_id, 
		MIN(event_date) AS first_logged,
		DATEADD(DAY, 1, MIN(event_date)) AS next_day
	FROM dbo.lc550  
	GROUP BY player_id
)
SELECT 
    lc.player_id,
    lc.device_id,
    lc.event_date,
    lc.games_played,
	e.first_logged,
	e.next_day
FROM 
    dbo.lc550 lc
INNER JOIN 
    cte e ON lc.player_id = e.player_id
WHERE 
	lc.event_date = e.next_day
*/