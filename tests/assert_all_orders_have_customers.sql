SELECT 
    c.customer_id AS customer_id,
    o.order_id AS order_id
FROM {{ ref('gold_orders') }} as o
LEFT JOIN {{ ref('gold_customers') }} as c
ON c.customer_id=o.customer_id
WHERE c.customer_id IS NULL