with 

source as (

    select * from {{ source('retail-sales-demo', 'customers') }}

),

renamed as (

    select
        customer_id,
        customer_name,
        email,
        phone_number,
        loyalty_points

    from source

)

select * from renamed
