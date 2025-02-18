CREATE TABLE Seat (
	id INT PRIMARY KEY,
	student VARCHAR(20)
);

INSERT INTO Seat VALUES 
	(1, 'Abbot'),
	(2, 'Doris'),
	(3, 'Emerson'),
	(4, 'Green'),
	(5, 'Jeames')
;

SELECT 
    CASE 
        WHEN id = (SELECT MAX(id) FROM seat) AND id % 2 = 1 THEN id 
        WHEN id % 2 = 1 THEN id + 1
        ELSE id - 1
    END AS id, student
FROM Seat
ORDER BY id ;

