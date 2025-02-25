import pandas as pd

def movie_ratings(movies: pd.DataFrame, users: pd.DataFrame, movie_rating: pd.DataFrame) -> pd.DataFrame:
    
    merged_names_users = pd.merge(movie_rating, users, on= "user_id")
    grouped_q1 = merged_names_users.groupby("name").size().reset_index(name ="count")
    q1 = grouped_q1.sort_values(["count", "name"], ascending=[False, True])

    merged_names_movies = pd.merge(movie_rating, movies, on= "movie_id")
    feburary_filter = merged_names_movies[(merged_names_movies["created_at"] >= "2020-02-01") &( merged_names_movies["created_at"] < "2020-03-01")]
    grouped_q2 =  feburary_filter.groupby("title").mean().reset_index()[["title", "rating"]]
    q2 = grouped_q2.sort_values(["rating", "title"], ascending=[False, True])
    
    restul1 = q1["name"].values[0]
    restul2 = q2["title"].values[0]
    
    result = pd.DataFrame(
        {
            "results" : [restul1, restul2]
        }
    )
    
    return result

movies = pd.DataFrame({
    'movie_id': [1, 2, 3],
    'title': ["Avengers", "Frozen 2", "Joker"]
})

users = pd.DataFrame({
    'user_id': [1, 2, 3, 4],
    'name': ["Daniel", "Monica", "Maria", "James"]
})

movie_rating = pd.DataFrame({
    'movie_id': [1, 1, 1, 1, 2, 2, 2, 3, 3],
    'user_id':  [1, 2, 3, 4, 1, 2, 3, 1, 2],
    'rating':   [3, 4, 2, 1, 5, 2, 2, 3, 4],
    'created_at': pd.to_datetime([
        "2020-01-12", "2020-02-11", "2020-02-12", "2020-01-01",
        "2020-02-17", "2020-02-01", "2020-03-01", "2020-02-22", "2020-02-25"
    ])
})

result = movie_ratings(movies, users, movie_rating)
print(result)