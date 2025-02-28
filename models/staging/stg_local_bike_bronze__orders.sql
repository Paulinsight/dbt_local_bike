with

source as (

    select * from {{ source('local_bike_bronze','orders') }}

),

result as (

    select
        cast(order_id as string) as order_id,
        cast(customer_id as string) as customer_id,
        cast(store_id as string) as store_id,
        cast(staff_id as string) as staff_id,
        cast(order_status as int64) as order_status,
        cast(order_date as date) as order_date,
        cast(required_date as date) as required_date,
        safe_cast(shipped_date as date) as shipped_date


    from source

)

select * from result