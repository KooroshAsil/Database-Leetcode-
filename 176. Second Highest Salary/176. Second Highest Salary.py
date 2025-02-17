import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    unique_salaries = employee['salary'].drop_duplicates()
    if len(unique_salaries) >= 2:
        second_highest_salary = unique_salaries.nlargest(2).iloc[-1]
        result_df = pd.DataFrame({'SecondHighestSalary': [second_highest_salary]})
    else:
        result_df = pd.DataFrame({'SecondHighestSalary': [None]})  # or use [pd.NA] for pandas' NA

    return result_df