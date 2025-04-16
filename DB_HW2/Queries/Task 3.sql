
/*
Koorosh Asil Gharehbaghi 
Computer Science 
40124463
*/

/*
Task 3 : 
	Find the average price of products in each category.
*/

SELECT 
	CategoryId, AVG(Price) 
FROM products 
GROUP BY CategoryId