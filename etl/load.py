from sqlalchemy import create_engine
from config import *

DATABASE_URL = (
    f"postgresql://{DB_USER}:{DB_PASSWORD}"
    f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

engine = create_engine(DATABASE_URL)

def load(data):

    data["customers"].to_sql(
        "dim_customer",
        engine,
        schema="warehouse",
        if_exists="append",
        index=False
    )

    data["products"].to_sql(
        "dim_product",
        engine,
        schema="warehouse",
        if_exists="append",
        index=False
    )

    data["orders"].to_sql(
        "fact_sales",
        engine,
        schema="warehouse",
        if_exists="append",
        index=False
    )

    data["payments"].to_sql(
        "fact_payment",
        engine,
        schema="warehouse",
        if_exists="append",
        index=False
    )

    data["returns"].to_sql(
        "fact_returns",
        engine,
        schema="warehouse",
        if_exists="append",
        index=False
    )

    data["sellers"].to_sql(
        "dim_seller",
        engine,
        schema="warehouse",
        if_exists="append",
        index=False
    )