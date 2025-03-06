
CREATE TABLE Scores (
    student_id INT,
    subject VARCHAR(50),
    score INT CHECK (score BETWEEN 0 AND 100),
    exam_date VARCHAR(10),
    PRIMARY KEY (student_id, subject, exam_date)
);

INSERT INTO Scores VALUES
(101, 'Math', 70, '2023-01-15'),
(101, 'Math', 85, '2023-02-15'),
(101, 'Physics', 65, '2023-01-15'),
(101, 'Physics', 60, '2023-02-15'),
(102, 'Math', 80, '2023-01-15'),
(102, 'Math', 85, '2023-02-15'),
(103, 'Math', 90, '2023-01-15'),
(104, 'Physics', 75, '2023-01-15'),
(104, 'Physics', 85, '2023-02-15');

WITH 
ExamDates AS (
		SELECT student_id,subject,
		MIN(exam_date) as FirstExam, MAX(exam_date) as LastExam
		FROM Scores
		GROUP BY student_id, subject
), 
ExamScores AS ( 
	SELECT Distinct e.student_id, e.subject,
	s_first.score AS first_score,
	s_last.score AS latest_score
	FROM ExamDates e
	JOIN Scores s_first ON 
	e.student_id =s_first.student_id AND e.subject = s_first.subject AND e.FirstExam = s_first.exam_date
	JOIN Scores s_last ON
	e.student_id = s_last.student_id AND e.subject = s_last.subject AND e.LastExam = s_last.exam_date
)
SELECT student_id, subject, first_score, latest_score
FROM ExamScores
WHERE first_score < latest_score
