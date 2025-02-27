with

source as (

    select * from {{ source('local_bike_bronze','brands') }}

),

result as (

    select
        cast(brand_id as string) as brand_id,
        cast(brand_name as string) as brand_name

    from source

)

select * from result