
/*
Koorosh Asil Gharehbaghi 
Computer Science 
40124463
*/

/*
Task 2 : 
	Display the names and prices of products that are in category 1 and have a price of less than $200.
*/

SELECT 
	Name, Price 
FROM products
WHERE CategoryId = 1 AND Price < 200;
