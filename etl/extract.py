import pandas as pd

def extract():

    data = {
        "customers": pd.read_csv("../data/raw/customers.csv"),
        "products": pd.read_csv("../data/raw/products.csv"),
        "orders": pd.read_csv("../data/raw/orders.csv"),
        "payments": pd.read_csv("../data/raw/payments.csv"),
        "returns": pd.read_csv("../data/raw/returns.csv"),
        "sellers": pd.read_csv("../data/raw/sellers.csv")
    }

    return data