SELECT SUM(amount) AS total_amount
FROM {{ref('stg_payments')}}
WHERE status = 'success'
