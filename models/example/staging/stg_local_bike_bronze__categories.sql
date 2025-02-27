with

source as (

    select * from {{ source('local_bike_bronze','categories') }}

),

result as (

    select
        cast(category_id as string) as category_id,
        cast(category_name as string) as category_name

    from source

)

select * from result