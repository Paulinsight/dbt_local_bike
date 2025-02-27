with

source as (

    select * from {{ source('local_bike_bronze','customers') }}

),

result as (

    select
        cast(customer_id as string) as customer_id,
        cast(first_name as string) as first_name,
        cast(last_name as string) as last_name,
        cast(phone as string) as phone,
        cast(email as string) as email,
        cast(street as string) as street,
        cast(city as string) as city,
        cast(state as string) as city,
        cast(zip_code as int64) as zip_code

    from source

)

select * from result