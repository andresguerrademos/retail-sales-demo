with 

source as (

    select * from {{ source('retail-sales-demo', 'inventory') }}

),

renamed as (

    select
        inventory_id,
        store_id,
        product_id,
        quantity_in_stock,
        last_restock_date

    from source

)

select * from renamed
