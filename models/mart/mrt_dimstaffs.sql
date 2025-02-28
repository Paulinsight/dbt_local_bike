with

staffs as (

    select * from {{ ref('stg_local_bike_bronze__staffs') }}

),

stores as (

    select * from {{ ref('stg_local_bike_bronze__stores') }}

),

result as (

    select
        staffs.staff_id,
        staffs.store_id,
        stores.store_name,
        staffs.manager_id,
        manager.staff as manager,
        staffs.staff,
        staffs.email,
        staffs.phone,
        staffs.active
        
    from staffs
    left join stores on stores.store_id = staffs.store_id
    left join staffs as manager 
        on staffs.manager_id = manager.staff_id

)

select * from result