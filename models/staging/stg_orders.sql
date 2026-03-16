WITH source AS (

    SELECT * FROM {{ ref('raw_orders') }}

),

renamed AS (

    SELECT
        order_id,
        order_number,
        customer_id,
        order_date,
        status,
        subtotal,
        discount_percent,
        shipping_cost,
        tax_amount,
        total_amount,
        payment_method,
        shipping_method,
        promotion_id,
        notes

    FROM source

)

SELECT * FROM renamed