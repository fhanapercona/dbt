with customers_ as (

    select
        id as customer_id,
        first_name,
        last_name

    from customers

)

select * from customers_