-- Case Study 1: Sales Performance Analytics

-- Business Problem
-- Management wants to evaluate overall sales performance and identify top-performing products.

-- Data Question
-- What is the total revenue generated and which products contribute most to sales?

-- SQL Query: Total Revenue
SELECT 
    SUM(p.selling_price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id;

-- SQL Query: Top 5 Products by Revenue
SELECT 
    p.product_name,
    SUM(p.selling_price * oi.quantity) AS product_revenue
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY product_revenue DESC 
LIMIT 5;

-- Business Insight
-- The total revenue indicates overall sales health.
-- Top-performing products help prioritize inventory and marketing focus.
