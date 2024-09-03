with 

source as (

    select * from {{ source('retail-sales-demo', 'sales') }}

),

renamed as (

    select
        sale_id,
        store_id,
        product_id,
        date,
        quantity,
        price_per_unit,
        total_sales,
        customer_id

    from source

)

select * from renamed
