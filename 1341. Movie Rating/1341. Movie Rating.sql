CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT,
    created_at DATE,
    PRIMARY KEY (movie_id, user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert data into Movies table
INSERT INTO Movies (movie_id, title) VALUES
(1, 'Avengers'),
(2, 'Frozen 2'),
(3, 'Joker');

-- Insert data into Users table
INSERT INTO Users (user_id, name) VALUES
(1, 'Daniel'),
(2, 'Monica'),
(3, 'Maria'),
(4, 'James');

-- Insert data into MovieRating table
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES
(1, 1, 3, '2020-01-12'),
(1, 2, 4, '2020-02-11'),
(1, 3, 2, '2020-02-12'),
(1, 4, 1, '2020-01-01'),
(2, 1, 5, '2020-02-17'),
(2, 2, 2, '2020-02-01'),
(2, 3, 2, '2020-03-01'),
(3, 1, 3, '2020-02-22'),
(3, 2, 4, '2020-02-25');

SELECT * FROM (
	SELECT TOP 1 u.name AS results
	FROM MovieRating m
	JOIN Users u ON u.user_id = m.user_id 
	GROUP BY u.name
	ORDER BY COUNT(rating) DESC, u.name ASC

	UNION ALL 

	SELECT TOP 1 v.title AS results
	FROM MovieRating m
	JOIN Movies v ON m.movie_id = v.movie_id
	WHERE m.created_at >= '2020-02-01' AND m.created_at < '2020-03-01'
	GROUP BY v.title
	ORDER BY AVG(CAST(rating AS float)) DESC, v.title Asc
	) AS result;
