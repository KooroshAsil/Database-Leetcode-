CREATE TABLE Stocks (
	stock_name VARCHAR(20),
	operation VARCHAR(20),
	operation_day INT,
	price INT
);

INSERT INTO Stocks VALUES
('Leetcode', 'Buy', 1, 1000),
('Corona Masks', 'Buy', 2, 10),
('Leetcode', 'Sell', 5, 9000),
('Handbags', 'Buy', 17, 30000),
('Corona Masks', 'Sell', 3, 1010),
('Corona Masks', 'Buy', 4, 1000),
('Corona Masks', 'Sell', 5, 500),
('Corona Masks', 'Buy', 6, 1000),
('Handbags', 'Sell', 29, 7000),
('Corona Masks', 'Sell', 10, 10000);


WITH cte AS (
	SELECT stock_name, CASE 
		WHEN operation = 'Buy' THEN -1*price
		WHEN operation = 'Sell' THEN 1*price
		ELSE 0
	END AS price 
	FROM Stocks
)
SELECT stock_name, SUM(price) AS capital_gain_loss
FROM cte 
GROUP BY stock_name;
