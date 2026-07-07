/*============================================================
 File        : 05_indexes.sql
 Description : Performance indexes for Data Warehouse
==============================================================*/

SET search_path TO warehouse;

-- Fact Sales
CREATE INDEX idx_fact_sales_date
ON fact_sales(date_key);

CREATE INDEX idx_fact_sales_customer
ON fact_sales(customer_key);

CREATE INDEX idx_fact_sales_product
ON fact_sales(product_key);

CREATE INDEX idx_fact_sales_seller
ON fact_sales(seller_key);

-- Fact Payments
CREATE INDEX idx_fact_payment_status
ON fact_payment(payment_status);

CREATE INDEX idx_fact_payment_method
ON fact_payment(payment_method);

-- Fact Returns
CREATE INDEX idx_fact_returns_status
ON fact_returns(return_status);

CREATE INDEX idx_fact_returns_reason
ON fact_returns(return_reason);

-- Dimensions
CREATE INDEX idx_product_brand
ON dim_product(brand_name);

CREATE INDEX idx_customer_prime
ON dim_customer(is_prime_member);

CREATE INDEX idx_seller_state
ON dim_seller(seller_state);