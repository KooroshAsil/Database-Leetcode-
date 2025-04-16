
/*
Koorosh Asil Gharehbaghi 
Computer Science 
40124463
*/

/*
Task 4 : 
	Calculate the total sales for each category based on the prices of sold products..
*/

SELECT 
	p.CategoryID,
    SUM(p.Price*t.no_transactions) AS TotalSales
FROM products p 
JOIN (
SELECT 
	ProductID, COUNT(*) AS no_transactions
FROM transactions
GROUP BY ProductID
) t 
ON p.ProductId = t.ProductID
GROUP BY p.CategoryID 
;