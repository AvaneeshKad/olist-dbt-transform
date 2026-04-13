-- Inside fct_daily_orders.sql
WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),
payments AS (
    SELECT * FROM {{ ref('stg_payments') }}
)

SELECT 
    orders.order_id,
    payments.payment_amount,
    -- your other logic here...
FROM orders
LEFT JOIN payments ON orders.order_id = payments.order_id