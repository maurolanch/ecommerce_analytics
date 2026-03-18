{{ config(
    materialized='incremental',
    unique_key=['order_id', 'product_id']
) }}


WITH base AS (

    SELECT *
    FROM {{ ref('int_order_items_enriched') }}
    
    {% if is_incremental() %}

        WHERE order_date > (
            SELECT COALESCE(MAX(order_date), '1900-01-01') FROM {{ this }}
        )

    {% endif %}


)

SELECT
    -- Keys
    order_id,
    product_id,
    customer_id,

    -- Order info
    order_date,
    order_month,

    -- Product info
    product_name,
    category_id,

    -- Metrics (aggregated at order-product level)
    SUM(quantity) AS total_quantity,
    AVG(unit_price) AS avg_unit_price,
    SUM(subtotal) AS total_revenue,

    -- Flags
    MAX(order_tier) AS order_tier

FROM base

GROUP BY
    order_id,
    product_id,
    customer_id,
    order_date,
    order_month,
    product_name,
    category_id