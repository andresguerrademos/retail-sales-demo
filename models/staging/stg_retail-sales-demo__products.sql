with 

source as (

    select * from {{ source('retail-sales-demo', 'products') }}

),

renamed as (

    select
        product_id,
        product_name,
        category,
        price,
        cost,
        supplier_id

    from source

)

select * from renamed
