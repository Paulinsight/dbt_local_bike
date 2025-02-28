with

source as (

    select * from {{ source('local_bike_bronze','staffs') }}

),

result as (

    select
        cast(staff_id as string) as staff_id,
        cast(store_id as string) as store_id,
        cast(manager_id as string) as manager_id,
        cast(first_name as string) as first_name,
        cast(last_name as string) as last_name,
        cast(email as string) as email,
        cast(phone as string) as phone,
        cast(active as int64) as active


    from source

)

select * from result