CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Product VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

INSERT INTO Sales VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

SELECT s.product_id, s.year as first_year, quantity, price 
FROM Sales s 
WHERE s.year IN (
	SELECT MIN(year) FROM Sales s1
	WHERE s.product_id = s1.product_id
	);
