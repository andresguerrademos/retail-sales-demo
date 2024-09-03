with 

source as (

    select * from {{ source('retail-sales-demo', 'stores') }}

),

renamed as (

    select
        store_id,
        store_name,
        location,
        manager_id

    from source

)

select * from renamed
