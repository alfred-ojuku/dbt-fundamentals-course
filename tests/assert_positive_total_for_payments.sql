WITH payments AS (
    SELECT * FROM {{ref('stg_payments')}}
)

SELECT order_id,
       amount
FROM payments
WHERE amount < 0