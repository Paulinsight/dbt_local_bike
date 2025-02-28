with

products as (

    select * from {{ ref('stg_local_bike_bronze__products') }}

),

categories as (

    select * from {{ ref('stg_local_bike_bronze__categories') }}

),

brands as (

    select * from {{ ref('stg_local_bike_bronze__brands') }}

),

result as (

    select
        products.product_id,
        products.product_name,
        brands.brand_name as brand,
        categories.category_name as category,
        products.model_year,
        products.price
        
    from products
    left join brands on brands.brand_id = products.brand_id
    left join categories on categories.category_id = products.category_id

)

select * from result