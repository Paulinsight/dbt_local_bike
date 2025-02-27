with

source as (

    select * from {{ source('local_bike_bronze','stocks') }}

),

result as (

    select
        cast(store_id as string) as store_id,
        cast(product_id as string) as product_id,
        cast(quantity as int64) as quantity

    from source

)

select * from result