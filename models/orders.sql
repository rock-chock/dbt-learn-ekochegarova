WITH orders AS (
  SELECT *
  FROM {{ ref('stg_orders') }}
),

stripe_payments AS (
  SELECT *
  FROM {{ ref('stg_stripe_payments') }}
),

stripe_payments_grouped AS (
  SELECT
    order_id,
    SUM(amount) AS total_amount_per_order
  FROM stripe_payments
  GROUP BY order_id
)

SELECT
  orders.order_id,
  orders.order_date,
  orders.customer_id,
  stripe_payments_grouped.total_amount_per_order
FROM orders
LEFT JOIN stripe_payments_grouped
ON orders.order_id = stripe_payments_grouped.order_id
