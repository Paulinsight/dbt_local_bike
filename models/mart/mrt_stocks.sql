with

stocks as (

    select * from {{ ref('stg_local_bike_bronze__stocks') }}

),

stores as (

    select * from {{ ref('stg_local_bike_bronze__stores') }}

),

result as (

    select
        stocks.store_id,
        stocks.product_id,
        stores.store_name,
        stocks.stock
        
    from stocks
    left join stores on stores.store_id = stocks.store_id

)

select * from result