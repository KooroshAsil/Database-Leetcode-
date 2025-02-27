import pandas as pd 

def monthly_transactions(transactions: pd.DataFrame) -> pd.DataFrame:
    
    transactions["trans_date"] = pd.to_datetime(transactions['trans_date'])
    transactions["month"] = transactions['trans_date'].dt.to_period("M")
    
    transactions["state"] = transactions['state'].apply(lambda x: 1 if x == "approved" else 0)

    transactions["approved_total_amount"] = transactions["amount"] * transactions["state"]

    result = transactions.groupby(
        ["month", "country"]
    ).agg(
        trans_count=("id", "count"),
        approved_count=("state", "sum"),
        trans_total_amount=("amount", "sum"),
        approved_total_amount=("approved_total_amount", "sum") 
    ).reset_index()
        
    return result

data = {
    "id" : [121,122,123,124],
    'country': ['US', 'US', 'US', 'DE'],
    'state': ['approved', 'declined', 'approved', 'approved'],
    'amount': [1000, 2000, 2000, 2000],
    'trans_date': ['2018-12-09', '2018-12-19', '2019-01-01', '2019-01-07']
}   

df = pd.DataFrame(data)
result = monthly_transactions(df)
print(result)