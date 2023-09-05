SELECT
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,

     -- amount is stored in cents, convert it to dollars
    {{cents_to_dollar('amount', 1)}} as amount,
    created as created_at

FROM {{source('stripe', 'payment')}}
ORDER BY id 