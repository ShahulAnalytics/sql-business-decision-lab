-- Case Study 2: Customer Retention Analysis

-- Business Problem
-- The company wants to understand customer purchase behavior
-- and identify repeat customers for retention strategies.

-- Data Question
-- How many orders has each customer placed,
-- and who are the most loyal customers?

-- SQL Query: Orders per Customer
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- SQL Query: Top 10 Loyal Customers
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC
LIMIT 10;

-- Business Insight
-- Customers with higher order frequency represent strong loyalty.
-- These customers should be prioritized for retention campaigns
-- and personalized marketing.
