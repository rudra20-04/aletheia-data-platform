/*------------------------------------------------------------
 Create Views
------------------------------------------------------------*/

CREATE OR REPLACE VIEW warehouse.vw_customer_dashboard AS

SELECT

    dc.customer_key,
    dc.customer_id,
    dc.customer_first_name,
    dc.customer_last_name,
    dc.customer_email,
    dc.is_prime_member,

    COUNT(DISTINCT fs.order_id) AS total_orders,

    SUM(fs.total_amount) AS total_spent,

    SUM(fs.quantity) AS total_products,

    AVG(fs.total_amount) AS avg_order_value,

    MIN(dd.full_date) AS first_purchase,

    MAX(dd.full_date) AS last_purchase

FROM warehouse.dim_customer dc

LEFT JOIN warehouse.fact_sales fs
ON dc.customer_key = fs.customer_key

LEFT JOIN warehouse.dim_date dd
ON fs.date_key = dd.date_key

GROUP BY

    dc.customer_key,
    dc.customer_id,
    dc.customer_first_name,
    dc.customer_last_name,
    dc.customer_email,
    dc.is_prime_member;


CREATE OR REPLACE VIEW warehouse.vw_payment_dashboard AS

SELECT

    fp.payment_key,

    dd.full_date,

    fp.payment_method,

    fp.payment_status,

    fp.payment_amount

FROM warehouse.fact_payments fp

JOIN warehouse.dim_date dd
ON fp.date_key = dd.date_key;


CREATE OR REPLACE VIEW warehouse.vw_product_dashboard AS

SELECT

    dp.product_key,
    dp.product_id,
    dp.product_name,
    dp.brand_name,
    dp.product_color,
    dp.product_size,

    cat.category_name,

    SUM(fs.quantity) AS total_quantity,

    SUM(fs.total_amount) AS revenue,

    AVG(fs.selling_price) AS avg_price,

    COUNT(DISTINCT fs.order_id) AS total_orders

FROM warehouse.dim_product dp

LEFT JOIN warehouse.fact_sales fs
ON dp.product_key = fs.product_key

LEFT JOIN warehouse.dim_category cat
ON dp.category_key = cat.category_key

GROUP BY

    dp.product_key,
    dp.product_id,
    dp.product_name,
    dp.brand_name,
    dp.product_color,
    dp.product_size,
    cat.category_name;


    CREATE OR REPLACE VIEW warehouse.vw_returns_dashboard AS

SELECT

    fr.return_key,

    dd.full_date,

    fr.return_reason,

    fr.return_status

FROM warehouse.fact_returns fr

JOIN warehouse.dim_date dd
ON fr.date_key = dd.date_key;


CREATE OR REPLACE VIEW warehouse.vw_sales_dashboard AS

SELECT

    fs.sales_key,
    fs.order_id,

    dd.full_date,
    dd.day_name,
    dd.month_name,
    dd.month_number,
    dd.quarter_number,
    dd.year_number,

    dc.customer_id,
    dc.customer_first_name || ' ' || dc.customer_last_name AS customer_name,
    dc.is_prime_member,

    dp.product_id,
    dp.product_name,
    dp.brand_name,
    dp.product_color,
    dp.product_size,

    cat.category_name,

    ds.seller_name,
    ds.seller_state,
    ds.seller_city,

    fs.quantity,
    fs.selling_price,
    fs.total_amount

FROM warehouse.fact_sales fs

JOIN warehouse.dim_date dd
ON fs.date_key = dd.date_key

JOIN warehouse.dim_customer dc
ON fs.customer_key = dc.customer_key

JOIN warehouse.dim_product dp
ON fs.product_key = dp.product_key

JOIN warehouse.dim_category cat
ON dp.category_key = cat.category_key

JOIN warehouse.dim_seller ds
ON fs.seller_key = ds.seller_key;


SELECT *
FROM warehouse.vw_sales_dashboard
LIMIT 10;