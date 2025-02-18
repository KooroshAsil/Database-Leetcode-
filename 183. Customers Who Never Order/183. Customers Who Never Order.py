import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:

    def boolean_value(columns, row):
        return not(row in columns)

    columns = list(orders.customerId)
    masked = customers["id"].apply(lambda x: boolean_value(columns,x))
    filtered = customers["name"][masked == True ]
    
    df = pd.DataFrame( {
        "Customers" : list(filtered)
        })
    
    return df

Customersd = {
    "id" : [1,2,3,4],
    "name" : ["Joe","Henry", "Sam", "Max"]
}
Ordersd = {
    "id" : [1,2],
    "customerId" : [3,1]
}

customers = pd.DataFrame(Customersd)
orders = pd.DataFrame(Ordersd)

print(find_customers(customers, orders))