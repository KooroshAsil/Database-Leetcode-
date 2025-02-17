CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    salary INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(id)
);

INSERT INTO Department VALUES 
	(1, 'IT'),
	(2, 'Sales')
;

INSERT INTO Employee VALUES 
	(1, 'Joe', 7000, 1),
	(2, 'Jim', 9000, 1),
	(3, 'Henry', 8000, 2),
	(4, 'Sam', 6000, 2),
	(5, 'Max', 9000, 1)
;


WITH cte AS (
	SELECT d.name AS department,
			e.name AS employee,
			e.salary,
			max(e.salary) OVER (PARTITION BY d.id) AS max_salary
		FROM Employee e
			JOIN Department d
				ON e.departmentId = d.id
)
SELECT department,
       employee,
       salary
  FROM cte
 WHERE salary = max_salary;