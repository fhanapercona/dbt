with 

source as (

    select * from {{source('dbt_training','orders') }}
),
staged as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from public.orders

)
select * from staged