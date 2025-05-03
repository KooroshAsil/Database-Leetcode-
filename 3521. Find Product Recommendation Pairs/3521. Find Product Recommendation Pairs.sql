/*
3521. Find Product Recommendation Pairs

Amazon wants to implement the Customers who bought this also bought... feature based 
on co-purchase patterns. Write a solution to :

Identify distinct product pairs frequently purchased together by the same customers 
(where product1_id < product2_id)
For each product pair, determine how many customers purchased both products
A product pair is considered for recommendation if at least 3 different customers 
have purchased both products.

Return the result table ordered by customer_count in descending order, and in case of 
a tie, by product1_id in ascending order, and then by product2_id in ascending order.
*/

--Drop tables if they exist
DROP TABLE IF EXISTS ProductPurchases;
DROP TABLE IF EXISTS ProductInfo;

-- Create ProductInfo table
CREATE TABLE ProductInfo (
    product_id INT PRIMARY KEY,
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create ProductPurchases table
CREATE TABLE ProductPurchases (
    user_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (user_id, product_id),
    FOREIGN KEY (product_id) REFERENCES ProductInfo(product_id)
);

-- Insert data into ProductInfo table
INSERT INTO ProductInfo (product_id, category, price) VALUES
(101, 'Electronics', 100.00),
(102, 'Books', 20.00),
(103, 'Clothing', 35.00),
(104, 'Kitchen', 50.00),
(105, 'Sports', 75.00);

-- Insert data into ProductPurchases table
INSERT INTO ProductPurchases (user_id, product_id, quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(1, 103, 3),
(2, 101, 1),
(2, 102, 5),
(2, 104, 1),
(3, 101, 2),
(3, 103, 1),
(3, 105, 4),
(4, 101, 1),
(4, 102, 1),
(4, 103, 2),
(4, 104, 3),
(5, 102, 2),
(5, 104, 1);


WITH cat AS (
    SELECT DISTINCT
        ProductInfo.product_id,
        category
    FROM ProductInfo
    JOIN ProductPurchases
    ON ProductInfo.product_id = ProductPurchases.product_id
) 
SELECT 
	p1.product_id AS product1_id ,
	p2.product_id AS product2_id ,
	cat1.category AS product1_category,
	cat2.category AS product2_category,
	COUNT(p1.user_id) AS customer_count
FROM ProductPurchases p1
JOIN ProductPurchases p2
ON p1.user_id = p2.user_id AND p1.product_id < p2.product_id
JOIN cat AS cat1
ON cat1.product_id = p1.product_id
JOIN cat AS cat2
ON cat2.product_id = p2.product_id
GROUP BY 
	p1.product_id, 
	p2.product_id,
	cat1.category,
	cat2.category
HAVING 
	COUNT(p1.user_id) >= 3
ORDER BY 
	COUNT(p1.user_id) DESC,
	product1_id ASC,
	product2_id ASC