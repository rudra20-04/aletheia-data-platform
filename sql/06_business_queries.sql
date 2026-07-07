/*============================================================
 Business Queries
==============================================================*/

SET search_path TO warehouse;

--------------------------------------------------------------
-- 1. Total Revenue
--------------------------------------------------------------
SELECT SUM(total_amount) AS total_revenue
FROM fact_sales;

--------------------------------------------------------------
-- 2. Monthly Revenue
--------------------------------------------------------------
SELECT
d.month_name,
SUM(f.total_amount) revenue
FROM fact_sales f
JOIN dim_date d
ON f.date_key=d.date_key
GROUP BY d.month_number,d.month_name
ORDER BY d.month_number;

--------------------------------------------------------------
-- 3. Top 10 Products
--------------------------------------------------------------
SELECT
p.product_name,
SUM(f.total_amount) revenue
FROM fact_sales f
JOIN dim_product p
ON f.product_key=p.product_key
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;

--------------------------------------------------------------
-- 4. Top Sellers
--------------------------------------------------------------
SELECT
s.seller_name,
SUM(f.total_amount) revenue
FROM fact_sales f
JOIN dim_seller s
ON f.seller_key=s.seller_key
GROUP BY s.seller_name
ORDER BY revenue DESC
LIMIT 10;

--------------------------------------------------------------
-- 5. Customer Segmentation
--------------------------------------------------------------
SELECT
is_prime_member,
COUNT(*) customers
FROM dim_customer
GROUP BY is_prime_member;

--------------------------------------------------------------
-- 6. Return Rate
--------------------------------------------------------------
SELECT
ROUND(
COUNT(DISTINCT return_key)::numeric /
COUNT(DISTINCT order_id)*100,
2
) AS return_rate
FROM fact_returns
CROSS JOIN fact_sales;

--------------------------------------------------------------
-- 7. Payment Success
--------------------------------------------------------------
SELECT
payment_status,
COUNT(*) transactions
FROM fact_payment
GROUP BY payment_status;

--------------------------------------------------------------
-- 8. Brand Performance
--------------------------------------------------------------
SELECT
brand_name,
SUM(total_amount) revenue
FROM fact_sales fs
JOIN dim_product dp
ON fs.product_key=dp.product_key
GROUP BY brand_name
ORDER BY revenue DESC;