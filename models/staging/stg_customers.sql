WITH source AS (

    SELECT * FROM {{ ref('raw_customers') }}

),

renamed AS (

    SELECT
        customer_id,
        first_name,
        last_name,
        lower(email) AS customer_email,
        phone,
        birth_date,
        city AS customer_city,
        country,
        postal_code,
        segment,
        registration_date,
        last_login,
        is_verified,
        accepts_marketing

    FROM source

)

SELECT * FROM renamed