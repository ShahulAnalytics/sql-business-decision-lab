-- Case Study 4: Revenue Leakage Detection

-- Business Problem
-- Finance teams suspect revenue loss due to heavy discounting
-- and low-margin product sales.

-- Data Question
-- Which products generate low profit margins and may contribute to revenue leakage?

-- SQL Query: Product Profitability
SELECT 
    p.product_name,
    SUM((p.selling_price - p.cost_price) * oi.quantity) AS total_profit,
    SUM(p.selling_price * oi.quantity) AS total_revenue,
    ROUND(
        SUM((p.selling_price - p.cost_price) * oi.quantity) * 100.0
        / SUM(p.selling_price * oi.quantity),
    2) AS profit_margin_percentage
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY profit_margin_percentage ASC;

-- SQL Query: Low Margin Products
SELECT 
    p.product_name,
    ROUND(
        SUM((p.selling_price - p.cost_price) * oi.quantity) * 100.0
        / SUM(p.selling_price * oi.quantity),
    2) AS profit_margin_percentage
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
HAVING ROUND(
        SUM((p.selling_price - p.cost_price) * oi.quantity) * 100.0
        / SUM(p.selling_price * oi.quantity),
    2) < 10
ORDER BY profit_margin_percentage ASC;

-- Business Insight
-- Products with low profit margins reduce overall profitability.
-- Pricing strategy and cost optimization are required to prevent revenue leakage.
