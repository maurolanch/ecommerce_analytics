{{
    config(
        materialized='table'
    )
}}

WITH orders AS (
    SELECT * FROM {{ ref('int_orders_enriched') }}
)

SELECT
    order_id,
    order_date,
    order_month,
    customer_id,
    product_id,
    quantity,
    unit_price,
    total_amount,
    discount_amount,
    order_tier
FROM orders