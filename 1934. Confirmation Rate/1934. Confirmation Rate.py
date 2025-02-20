import pandas as pd

def confirmation_rate(signups: pd.DataFrame, confirmations: pd.DataFrame) -> pd.DataFrame:
    signups['time_stamp'] = pd.to_datetime(signups['time_stamp'])
    confirmations['time_stamp'] = pd.to_datetime(confirmations['time_stamp'])

    confirmation_counts = confirmations.groupby('user_id').agg(
    confirmed_count=('action', lambda x: (x == 'confirmed').sum()),
    total_count=('action', 'count')
    ).reset_index()
    
    result_df = signups[['user_id']].merge(confirmation_counts, on='user_id', how='left')

    result_df['confirmed_count'] = result_df['confirmed_count'].fillna(0)
    result_df['total_count'] = result_df['total_count'].fillna(0)
    result_df['confirmation_rate'] = result_df['confirmed_count'] / result_df['total_count'].replace(0, pd.NA)

    result_df['confirmation_rate'] = result_df['confirmation_rate'].fillna(0).round(2)

    output_df = result_df[['user_id', 'confirmation_rate']]
    return output_df

signups_data = {
    'user_id': [3, 7, 2, 6],
    'time_stamp': [
        '2020-03-21 10:16:13',
        '2020-01-04 13:57:59',
        '2020-07-29 23:09:44',
        '2020-12-09 10:39:37'
    ]
}

confirmations_data = {
    'user_id': [3, 3, 7, 7, 7, 2, 2],
    'time_stamp': [
        '2021-01-06 03:30:46',
        '2021-07-14 14:00:00',
        '2021-06-12 11:57:29',
        '2021-06-13 12:58:28',
        '2021-06-14 13:59:27',
        '2021-01-22 00:00:00',
        '2021-02-28 23:59:59'
    ],
    'action': ['timeout', 'timeout', 'confirmed', 'confirmed', 'confirmed', 'confirmed', 'timeout']
}

signups = pd.DataFrame(signups_data)
confirmations= pd.DataFrame(confirmations_data)
confirmation_rate_df = confirmation_rate(signups, confirmations)
print(confirmation_rate_df)