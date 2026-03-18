{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

SELECT
    order_id,
    order_date,
    customer_id,
    total_amount,
    total_items,
    total_revenue,
    num_products,
    order_month,
    order_tier

FROM {{ ref('int_orders_enriched') }}

{% if is_incremental() %}

    WHERE order_id > (
            SELECT COALESCE(MAX(order_id), 0) FROM {{ this }}
    )

{% endif %}