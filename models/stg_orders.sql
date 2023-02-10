with orders_ as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from orders

)
select * from orders_ 