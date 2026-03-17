SELECT
    customer_id,
    customer_name,
    customer_email,
    customer_city
FROM {{ ref('stg_customers') }}