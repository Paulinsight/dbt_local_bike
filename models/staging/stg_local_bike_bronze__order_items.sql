with

source as (

    select * from {{ source('local_bike_bronze','order_items') }}

),

result as (

    select
        cast(concat(order_id, '_', item_id) as string) AS order_item_id,
        cast(order_id as string) as order_id,
        cast(product_id as string) as product_id,
        cast(quantity as numeric) as quantity,
        cast(list_price as numeric) as price,
        cast(round(quantity * list_price * (1-discount),2) as numeric) as revenue,
        cast(discount as numeric) as discount_rate

    from source

)

select * from result