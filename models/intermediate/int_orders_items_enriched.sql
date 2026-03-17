WITH orders AS (

    SELECT * FROM {{ ref('stg_orders') }}

),

order_items AS (

    SELECT * FROM {{ ref('stg_order_items') }}

),

customers AS (

    SELECT * FROM {{ ref('stg_customers') }}

),

products AS (

    SELECT * FROM {{ ref('stg_products') }}

),

enriched AS (

    SELECT
        -- Order info
        o.order_id,
        o.order_date,
        o.status,
        o.payment_method,
        o.shipping_method,

        -- Customer info
        c.customer_id,
        c.customer_name,
        c.customer_email,
        c.customer_city,

        -- Product info
        p.product_id,
        p.product_name,
        p.category_id,

        -- Order item info
        oi.quantity,
        oi.unit_price,
        oi.subtotal,

        -- Calculated fields
        DATE_TRUNC('month', o.order_date) AS order_month,

        CASE
            WHEN oi.subtotal > 100 THEN 'High Value'
            WHEN oi.subtotal > 50 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS order_tier

    FROM orders o

    LEFT JOIN customers c
        ON o.customer_id = c.customer_id

    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id

    LEFT JOIN products p
        ON oi.product_id = p.product_id

)

SELECT * FROM enriched