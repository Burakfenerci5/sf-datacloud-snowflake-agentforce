-- Create a schema for our output
CREATE SCHEMA IF NOT EXISTS data_cloud_share;

-- Flattened View for Agentforce Consumption
CREATE OR REPLACE VIEW data_cloud_share.customer_360_gold AS
SELECT 
    c.customer_id,
    c.email,
    c.loyalty_tier,
    -- AI needs clear labels, so we calculate these pre-query
    CASE 
        WHEN SUM(o.total_amount) > 1000 THEN 'High Value'
        ELSE 'Standard'
    END AS customer_segment,
    MAX(o.order_date) as last_order_date
FROM raw_data.customers c
LEFT JOIN raw_data.orders o ON c.customer_id = o.customer_id
GROUP BY 1, 2, 3;