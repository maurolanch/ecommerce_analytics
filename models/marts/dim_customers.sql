{{
    config(
        materialized='table'
    )
}}

WITH customers AS (
    SELECT DISTINCT
        customer_id,
        customer_name,
        customer_email,
        customer_city
    FROM {{ ref('int_orders_enriched') }}
)

SELECT * FROM customers