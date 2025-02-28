with

customers as (

    select * from {{ ref('stg_local_bike_bronze__customers') }}

),

result as (

    select
        customers.customer_id,
        customers.customer,
        customers.phone,
        customers.email,
        customers.street,
        customers.city,
        customers.state,
        customers.zip_code
        
    from customers

)

select * from result