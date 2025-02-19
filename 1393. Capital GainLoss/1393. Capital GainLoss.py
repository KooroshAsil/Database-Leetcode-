import pandas as pd

def set_sign(row) :
    row = list(row)
    if row[1] == "Buy":
        return row[3]*-1
    elif row[1] == "Sell":
        return row[3]*1
    else:
        return 0
    
def capital_gainloss(stocks: pd.DataFrame) -> pd.DataFrame:
    stocks.price = stocks.apply(set_sign, axis=1)
    labels = list(stocks.groupby("stock_name").sum().index)
    values = list(stocks.groupby("stock_name").sum().price)
    
    df = pd.DataFrame({
        "stock_name" : labels,
        "capital_gain_loss" :  values
    })
    return df

data = {
    'stock_name': ['Leetcode', 'Corona Masks', 'Leetcode', 'Handbags', 'Corona Masks', 
                   'Corona Masks', 'Corona Masks', 'Corona Masks', 'Handbags', 'Corona Masks'],
    'operation': ['Buy', 'Buy', 'Sell', 'Buy', 'Sell', 
                  'Buy', 'Sell', 'Buy', 'Sell', 'Sell'],
    'operation_day': [1, 2, 5, 17, 3, 
                      4, 5, 6, 29, 10],
    'price': [1000, 10, 9000, 30000, 1010, 
              1000, 500, 1000, 7000, 10000]
}

stocks = pd.DataFrame(data)
print(capital_gainloss(stocks))