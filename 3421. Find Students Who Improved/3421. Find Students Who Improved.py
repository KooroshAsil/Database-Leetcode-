import pandas as pd

def find_students_who_improved(scores: pd.DataFrame) -> pd.DataFrame:
    
    exam_dates = scores.groupby(["student_id", "subject"]).agg(
        first_exam = ("exam_date", min),
        latest_exam = ("exam_date", max),
        ).reset_index()
    
    first_exams = pd.merge(
        scores, exam_dates, on=["student_id", "subject"],
        )

    latest_exams = pd.merge(
        scores, exam_dates, on=["student_id", "subject"],
        )

    first_exams = first_exams[first_exams["exam_date"] == first_exams["first_exam"]]
    latest_exams = latest_exams[latest_exams["exam_date"] == latest_exams["latest_exam"]]

    results = pd.merge(first_exams, latest_exams,on=["student_id", "subject"])[
            ["student_id", "subject", "score_x", "score_y"]
        ]
    
    results.rename(columns={"score_x": "first_score", "score_y":"latest_score"}, inplace= True)
    
    diff = results[results["first_score"] < results["latest_score"]]
    diff = diff.sort_values(by = ["student_id", "subject"])
    
    return diff
    
data = {
    'student_id': [101, 101, 101, 101, 102, 102, 103, 104, 104],
    'subject': ['Math', 'Math', 'Physics', 'Physics', 'Math', 'Math', 'Math', 'Physics', 'Physics'],
    'score': [70, 85, 65, 60, 80, 85, 90, 75, 85],
    'exam_date': ['2023-01-15', '2023-02-15', '2023-01-15', '2023-02-15', 
                  '2023-01-15', '2023-02-15', '2023-01-15', '2023-01-15', '2023-02-15']
}

scores = pd.DataFrame(data)
scores['exam_date'] = pd.to_datetime(scores['exam_date'])

improved_students = find_students_who_improved(scores)

print(improved_students)