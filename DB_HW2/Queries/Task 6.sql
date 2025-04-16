
/*
Koorosh Asil Gharehbaghi 
Computer Science 
40124463
*/

/*
Task 6 :
	Identify the buyers who have purchased at least one product with a price greater than $500.
*/

SELECT DISTINCT
    b.BuyerID, b.FirstName, b.LastName
FROM buyers b
JOIN transactions t ON b.BuyerID = t.BuyerID
JOIN products p ON t.ProductID = p.ProductID
WHERE p.Price > 500
;