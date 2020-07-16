SELECT
  id AS stripe_payment_id,
  orderid AS order_id,
  paymentmethod AS payment_method,
  status AS payment_status,
  amount,
  created AS created_date
FROM
  {{ source('stripe', 'payment') }}
