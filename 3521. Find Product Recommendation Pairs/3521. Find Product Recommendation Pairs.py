import pandas as pd

def find_product_recommendation_pairs(product_purchases: pd.DataFrame, product_info: pd.DataFrame) -> pd.DataFrame:
    product_purchases_df
    product_info_df 

    merged = pd.merge(product_purchases_df, product_purchases_df, on='user_id', how='inner')
    merged = merged[merged["product_id_x"] < merged["product_id_y"]]

    grouped = merged.groupby(["product_id_x", "product_id_y"]).size().reset_index(name='customer_count')
    grouped.rename(columns={"product_id_x": "product1_id", "product_id_y": "product2_id"}, inplace=True)

    cat = product_info_df[['product_id', 'category']].copy()  
    cat.rename(columns={'product_id': 'product1_id'}, inplace=True)

    result = pd.merge(grouped, cat, on='product1_id', how='inner')
    cat.rename(columns={'product1_id': 'product2_id'}, inplace=True)  # Rename for the second merge
    result = pd.merge(result, cat, on='product2_id', how='inner', suffixes=('_1', '_2'))
    result.rename( columns = {"category_1":"product1_category", "category_2" : "product2_category"}, inplace = True)
    
    tmp = result["customer_count"]
    result.drop("customer_count", axis=1, inplace=True) 
    result["customer_count"] = tmp
    result = result[result["customer_count"] >= 3]

    result = result.sort_values(by=['customer_count', 'product1_id','product2_id'], ascending=[False, True,True])
    
    return result


product_purchases_data = {
    'user_id': [1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5],
    'product_id': [101, 102, 103, 101, 102, 104, 101, 103, 105, 101, 102, 103, 104, 102, 104],
    'quantity': [2, 1, 3, 1, 5, 1, 2, 1, 4, 1, 1, 2, 3, 2, 1]
}

product_purchases_df = pd.DataFrame(product_purchases_data)

product_info_data = {
    'product_id': [101, 102, 103, 104, 105],
    'category': ['Electronics', 'Books', 'Clothing', 'Kitchen', 'Sports'],
    'price': [100, 20, 35, 50, 75]
}

product_info_df = pd.DataFrame(product_info_data)

result = find_product_recommendation_pairs(product_purchases_df, product_info_df)
print(result)