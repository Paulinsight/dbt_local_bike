with

stores as (

    select * from {{ ref('stg_local_bike_bronze__stores') }}

),

result as (

    select
        stores.store_id,
        stores.store_name,
        stores.phone,
        stores.email,
        stores.street,
        stores.city,
        stores.state,
        stores.zip_code
        
    from stores

)

select * from result