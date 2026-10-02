WITH source_data AS (

    SELECT
        order_id,
        customer_id,
        product_name,
        quantity,
        price,
        order_date,
        status,
        city

    FROM {{ source('bigquery_source', 'orders') }}

)

SELECT
    CAST(order_id AS INT64) AS order_id,
    CAST(customer_id AS INT64) AS customer_id,
    TRIM(product_name) AS product_name,
    CAST(quantity AS INT64) AS quantity,
    CAST(price AS NUMERIC) AS unit_price,
    CAST(quantity AS INT64) * CAST(price AS NUMERIC) AS order_amount,
    CAST(order_date AS DATE) AS order_date,
    INITCAP(TRIM(status)) AS status,
    INITCAP(TRIM(city)) AS city

FROM source_data
