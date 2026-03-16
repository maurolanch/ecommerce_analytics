WITH source AS (

    SELECT * FROM {{ ref('raw_products') }}

),

renamed AS (

    SELECT
        product_id,
        UPPER(sku) AS uppersku,
        TRIM(product_name) AS product_name,
        description,
        category_id,
        brand_id,
        supplier_id,
        CAST(price AS DECIMAL(10,2)) AS price,
        CAST(cost AS DECIMAL(10,2)) AS cost,
        weight_kg,
        is_active,
        created_at,
        updated_at

    FROM source

)

SELECT * FROM renamed