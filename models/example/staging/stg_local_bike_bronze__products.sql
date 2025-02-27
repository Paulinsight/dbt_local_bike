with

source as (

    select * from {{ source('local_bike_bronze','products') }}

),

result as (

    select
        cast(product_id as string) as product_id,
        cast(brand_id as string) as brand_id,
        cast(category_id as string) as category_id,
        cast(product_name as string) as product_name,
        cast(model_year as int64) as model_year,
        cast(list_price as numeric) as price

    from source

)

select * from result