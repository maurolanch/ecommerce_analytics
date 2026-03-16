WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),

products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

enriched AS (
    SELECT
        o.order_id,
        o.order_date,
        o.quantity,
        o.unit_price,
        o.total_amount,
        o.discount_amount,
        
        -- Customer info
        c.customer_id,
        c.customer_name,
        c.customer_email,
        c.customer_city,
        
        -- Product info
        p.product_id,
        p.product_name,
        p.category_id,
        
        -- Calculated fields
        DATE_TRUNC('month', o.order_date) AS order_month,
        CASE 
            WHEN o.total_amount > 100 THEN 'High Value'
            WHEN o.total_amount > 50 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS order_tier
        
    FROM orders o
    LEFT JOIN customers c ON o.customer_id = c.customer_id
    LEFT JOIN products p ON o.product_id = p.product_id
)

SELECT * FROM enriched