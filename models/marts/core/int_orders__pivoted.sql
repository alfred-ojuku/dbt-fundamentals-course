WITH payments AS (
    SELECT * FROM {{ref('stg_payments')}}

),
pivoted AS (
    SELECT 
        order_id,
        {% set payment_methods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}
        {% for payment_method in payment_methods %}
          {%- if not loop.last -%}
           SUM(CASE WHEN payment_method = '{{payment_method}}' THEN amount ELSE 0 END) AS {{payment_method}}_amount,
           {% else -%}
           SUM(CASE WHEN payment_method = '{{payment_method}}' THEN amount ELSE 0 END) AS {{payment_method}}_amount
          {% endif -%}
        {%endfor%} 
    FROM payments
    WHERE status = 'success'
    GROUP BY 1
    ORDER BY 1
)

SELECT * FROM pivoted