with 

source as (

    select * from {{ source('retail-sales-demo', 'suppliers') }}

),

renamed as (

    select
        supplier_id,
        supplier_name,
        contact_person,
        contact_email,
        contact_phone

    from source

)

select * from renamed
