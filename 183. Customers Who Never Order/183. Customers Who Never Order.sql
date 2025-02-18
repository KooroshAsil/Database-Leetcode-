CREATE TABLE Customers(
	id INT PRIMARY KEY,
	name VARCHAR(20)
);

CREATE TABLE Orders(
	id INT PRIMARY KEY,
	CustomerId VARCHAR(20)
);

INSERT INTO Customers VALUES 
	(1,'Joe'),
	(2,'Henry'),
	(3,'Sam'),
	(4,'Max')
; 

INSERT INTO Orders VALUES 
	(1,3),
	(2,1)
;

SELECT name FROM Customers
WHERE id NOT IN (
	SELECT CustomerId FROM Orders )

