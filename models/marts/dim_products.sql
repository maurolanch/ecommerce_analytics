SELECT
    product_id,
    product_name,
    category_id
FROM {{ ref('stg_products') }}