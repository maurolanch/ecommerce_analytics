WITH base AS (

    SELECT * FROM {{ ref('int_orders_items_enriched') }}

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

    -- Metrics
    quantity,
    unit_price,
    subtotal,

    -- Flags
    order_tier

FROM base