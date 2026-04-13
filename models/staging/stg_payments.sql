-- models/staging/stg_payments.sql

WITH source AS (
    SELECT * FROM {{ source('raw', 'OLIST_PAYMENTS_RAW') }}
)

SELECT
    order_id::string AS order_id,
    payment_sequential::int AS payment_sequential,
    payment_type::string AS payment_type,
    payment_installments::int AS payment_installments,
    payment_value::float AS payment_amount
FROM source