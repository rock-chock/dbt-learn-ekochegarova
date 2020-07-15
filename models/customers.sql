with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

<<<<<<< HEAD
  SELECT *
  FROM {{ ref('orders') }}
=======
    select * from {{ ref('stg_orders') }}
>>>>>>> f0672c03e448663a2291cc0a3b9591a066455dbd

),

customer_orders as (

    select
        customer_id,
<<<<<<< HEAD
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(total_amount_per_order) AS lifetime_value
=======

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

>>>>>>> f0672c03e448663a2291cc0a3b9591a066455dbd
    from orders

    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
<<<<<<< HEAD
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.lifetime_value
=======
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders
>>>>>>> f0672c03e448663a2291cc0a3b9591a066455dbd

    from customers

    left join customer_orders using (customer_id)

)

select * from final
