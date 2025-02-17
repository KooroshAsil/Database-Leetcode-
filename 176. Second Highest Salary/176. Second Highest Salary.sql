CREATE TABLE Employee (
	id INT PRIMARY KEY,
	salary INT
);

INSERT INTO Employee VALUES 
	(1, 100),
	(2, 200),
	(3, 300),
	(4, 100)
; 

SELECT MAX(salary) AS SecondHighestSalary 
FROM Employee
WHERE salary < 
(
	SELECT MAX(salary) FROM Employee
);
