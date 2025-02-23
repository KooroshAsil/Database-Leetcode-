import pandas as pd

def find_investments(insurance: pd.DataFrame) -> pd.DataFrame:
    
    duplicated_tiv_2015 = insurance[insurance.duplicated('tiv_2015', keep=False)]
    unique_locations = insurance.groupby(['lat', 'lon']).filter(lambda x: len(x) == 1)
    result_df = duplicated_tiv_2015[duplicated_tiv_2015.set_index(['lat', 'lon']).index.isin(unique_locations.set_index(['lat', 'lon']).index)]

    total_tiv_2016 = round(result_df['tiv_2016'].sum(), 2)

    result = pd.DataFrame(
        {
            "tiv_2016" : [total_tiv_2016]
        }
    )
    
    return result

data = {
    'pid': [1, 2, 3, 4 ],
    'tiv_2015': [10, 20, 10, 10],
    'tiv_2016': [5, 20, 30, 40],
    'lat': [10, 20, 20, 40],
    'lon': [10, 20, 20, 40]
}

insurance = pd.DataFrame(data)

result = find_investments(insurance)
print(result)