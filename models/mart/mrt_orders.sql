with

orders as (

    select * from {{ ref('stg_local_bike_bronze__orders') }}

),

order_items as (

    select * from {{ ref('stg_local_bike_bronze__order_items') }}

),

result as (

    select
        orders.order_id,
        orders.customer_id,
        orders.store_id,
        orders.staff_id, --réellement utile ?
        order_items.product_id,
        orders.order_status,
        order_items.quantity,
        order_items.price,
        order_items.revenue,
        order_items.discount_rate,
        orders.order_date,
        orders.required_date,
        orders.shipped_date
        
    from order_items
    inner join orders on orders.order_id = order_items.order_id
    where orders.shipped_date is not null

)

select * from result