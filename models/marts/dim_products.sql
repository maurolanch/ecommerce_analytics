{{ 
    config(
        materialized='table'
    ) 
}}

WITH products AS (

    SELECT DISTINCT
        product_id,
        product_name,
        category_id

    FROM {{ ref('int_orders_enriched') }}

)

SELECT * 
FROM products