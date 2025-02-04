-- report of all the customers qho have bought all the products.


DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;


-- Creating the Product table
CREATE TABLE Product (
    product_key INT PRIMARY KEY
);

-- Creating the Customer table
CREATE TABLE Customer (
    customer_id INT NOT NULL,
    product_key INT,
    FOREIGN KEY (product_key) REFERENCES Product(product_key)
);


-- Inserting data into the Product table
INSERT INTO Product (product_key) VALUES
(5),
(6);

-- Inserting data into the Customer table
INSERT INTO Customer (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);

-- EVERYTHING READY 
-------------------------------------------------------------------------------------------------------

-- my initial possible (but dummy) solution : ((very very slow)) 

SELECT DISTINCT customer_id FROM dbo.Customer
EXCEPT 
SELECT DISTINCT customer_id FROM 
(		SELECT * FROM (

				SELECT DISTINCT * FROM (
					SELECT 
						c.customer_id,
						q.product_key
					FROM 
						dbo.Customer c
					CROSS JOIN	(SELECT DISTINCT product_key FROM  dbo.Product) AS q	
				) AS r 

		) AS t 
		EXCEPT
		SELECT * FROM dbo.Customer
) AS s

---------------------------------------------------------------------------------------------------

-- optimized way O(N)

SELECT c.customer_id
FROM Customer c
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product);

