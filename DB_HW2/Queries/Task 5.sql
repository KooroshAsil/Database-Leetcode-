
/*
Koorosh Asil Gharehbaghi 
Computer Science 
40124463
*/

/*
Task 5 :
	Find the list of buyers who have purchased a product from category 1.
*/

SELECT
    b.BuyerID, b.FirstName, b.LastName,
    COUNT(t.ProductID) AS TotalPurchasesInCategory1
FROM buyers b
JOIN transactions t ON b.BuyerID = t.BuyerID
JOIN products p ON t.ProductID = p.ProductID
WHERE p.CategoryId = 1
GROUP BY b.BuyerID, b.FirstName, b.LastName
;
