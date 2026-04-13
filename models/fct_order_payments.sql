WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

payments AS (
    SELECT * FROM {{ ref('stg_payments') }}
)

SELECT
    o.order_id,
    -- If your stg_orders has a status column, use that here
    p.payment_type,
    p.payment_amount,
    p.payment_installments,
    CASE 
        WHEN p.payment_installments > 12 THEN 'high_installment_risk'
        WHEN p.payment_amount > 5000 THEN 'high_value_check'
        ELSE 'standard'
    END AS transaction_risk_profile
FROM orders o
JOIN payments p ON o.order_id = p.order_id