SELECT
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,

     -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    created as created_at

FROM {{source('stripe', 'payment')}}