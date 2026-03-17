WITH source AS (

    SELECT * FROM {{ ref('raw_order_items') }}

),

renamed AS (

    SELECT
        order_item_id,
        order_id,
        product_id,
        quantity,
        CAST(unit_price AS DECIMAL(10,2)) AS unit_price,
        CAST(subtotal AS DECIMAL(10,2)) AS subtotal

    FROM source

)

SELECT * FROM renamed