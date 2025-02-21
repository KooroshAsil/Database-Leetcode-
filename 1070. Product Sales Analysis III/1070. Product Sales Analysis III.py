import pandas as pd

def sales_analysis(sales: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    first_years = sales.groupby('product_id', as_index=False)['year'].min()
    
    # Step 2: Merge the first years back with the original sales data to get quantity and price
    result = pd.merge(first_years, sales, on=['product_id', 'year'], how='inner')
    
    # Step 3: Select the required columns
    result = result[['product_id', 'year', 'quantity', 'price']]
    
    # Rename the 'year' column to 'first_year'
    result.rename(columns={'year': 'first_year'}, inplace=True)
    
    return result

product_data = {
    'product_id': [100, 200, 300],
    'product_name': ['Nokia', 'Apple', 'Samsung']
}

product_df = pd.DataFrame(product_data)

sales_data = {
    'sale_id': [1, 2, 7],
    'product_id': [100, 100, 200],
    'year': [2008, 2009, 2011],
    'quantity': [10, 12, 15],
    'price': [5000, 5000, 9000]
}

sales_df = pd.DataFrame(sales_data)

result = sales_analysis(sales_df, product_df)
print(result)