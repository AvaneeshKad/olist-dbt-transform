with raw_source as (
    -- Changed to UPPERCASE to match your YML exactly
    select * from {{ source('raw', 'OLIST_ORDERS_RAW') }}
)

select
    payload:order_id::string as order_id,
    payload:customer_id::string as customer_id,
    payload:order_status::string as order_status,
    payload:order_purchase_timestamp::timestamp as purchase_timestamp,
    payload:order_approved_at::timestamp as approved_at,
    payload:order_delivered_customer_date::timestamp as delivered_at
from raw_source