-- Case Study 3: Inventory Optimization

-- Business Problem
-- The operations team wants to identify fast-moving and slow-moving products
-- to optimize inventory planning and reduce holding costs.

-- Data Question
-- Which products sell the most and which products have low sales volume?

-- SQL Query: Product Sales Volume
SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units_sold DESC;

-- SQL Query: Slow-Moving Products
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(oi.quantity) < 50
ORDER BY total_units_sold ASC;

-- Business Insight
-- High-volume products require priority stock replenishment.
-- Slow-moving products indicate overstock risk and require demand planning adjustments.
