with raw_source as (
    -- This 'source' function links to the name we put in sources.yml
    select * from {{ source('raw', 'olist_orders_raw') }}
)

select
    payload:order_id::string as order_id,
    payload:customer_id::string as customer_id,
    payload:order_status::string as order_status,
    payload:order_purchase_timestamp::timestamp as purchase_timestamp,
    payload:order_approved_at::timestamp as approved_at,
    payload:order_delivered_customer_date::timestamp as delivered_at
from raw_source