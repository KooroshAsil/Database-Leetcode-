CREATE TABLE Insurance (
    pid INT PRIMARY KEY,
    tiv_2015 FLOAT,
    tiv_2016 FLOAT,
    lat FLOAT NOT NULL,
    lon FLOAT NOT NULL
);

INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES
(1, 10, 5, 10, 10),
(2, 20, 20, 20, 20),
(3, 10, 30, 20, 20),
(4, 10, 40, 40, 40);

SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
WHERE i.tiv_2015 IN (
		SELECT tiv_2015
		FROM Insurance
		GROUP BY tiv_2015
		HAVING COUNT(pid) > 1
	)
	AND NOT EXISTS (
		SELECT 1
		FROM Insurance j
		WHERE j.lat = i.lat AND j.lon = i.lon
		GROUP BY j.lat, j.lon
		HAVING COUNT(j.pid) > 1
	);

/*

-- subquery for getting rows with duplicate values of tiv_2015 
SELECT pid FROM Insurance
WHERE tiv_2015 = 
	(
	SELECT tiv_2015 FROM Insurance
	GROUP BY tiv_2015
	HAVING COUNT(pid) > 1 
	)
---------------------------------------------------------------
-- subquery that returns pid with same lan and lon value 

SELECT pid FROM Insurance I1
WHERE NOT EXISTS (
		SELECT 1 FROM Insurance I2
		WHERE 
			I1.lat = I2.lat
		AND 
			I1.lon = I2.lon
		GROUP BY I2.lat, I2.lon
		HAVING COUNT(pid) > 1
		)
		
-------------------------------------------------------------
*/