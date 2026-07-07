import pandas as pd

def clean(df):

    df.drop_duplicates(inplace=True)

    df.fillna("", inplace=True)

    return df