
/* 
	180. Consecutive Numbers
Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 */ 

CREATE TABLE Logs (
	id INT PRIMARY KEY,
	num VARCHAR(10)
)

INSERT INTO Logs (id, num) VALUES 
	(1, '1'),
	(2, '1'),
	(3, '1'),
	(4, '2'),
	(5, '1')
;

SELECT * FROM Logs;

SELECT DISTINCT num AS ConsecutiveNums FROM (
	SELECT 
		num,
		LAG(num, 1) OVER (ORDER BY id) AS prev1,
		LAG(num, 2) OVER (ORDER BY id) AS prev2
	FROM 
		Logs
	) AS lagtablea
WHERE num = prev1 AND prev1 = prev2
;