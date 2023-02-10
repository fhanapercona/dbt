

with customers as (

    select * from {{ ref ('stg_customers') }}
),

orders as (

    select * from {{ ref ('stg_orders') }}
),
customer_orders as (

    select
        customer_id::integer,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders_

    group by 1

),

final as (

    select
        customers_.customer_id::integer,
        customers_.first_name,
        customers_.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers_

    left join customer_orders using (customer_id)

)

select * from final