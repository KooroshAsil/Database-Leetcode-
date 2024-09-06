-- Create a sample table 
GO

DROP TABLE IF EXISTS dbo.lc180;

CREATE TABLE dbo.lc180 (
	id INT,
	num VARCHAR
);

INSERT INTO dbo.lc180 (id, num) VALUES
(1, 1),(2, 1),(3, 1),
(4, 2),(5, 1),(6, 2),
(7, 2);

SELECT * FROM dbo.lc180
---------------------------------------------------------------------------------
-- writing the query to find distinct numbers that are at leats 3 times in a row 
GO

WITH cte AS (
	SELECT * ,
		LEAD(num, 1) OVER (ORDER BY id) AS next_one,
		LEAD(num, 2) OVER (ORDER BY id) AS nwxt_next_one
	FROM dbo.lc180
) 
SELECT DISTINCT num AS ConsecutiveNums 
FROM cte 
WHERE num = next_one AND num = nwxt_next_one;

GO

