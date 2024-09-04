with

sales as (

    select * from {{ ref('stg_retail-sales-demo__sales') }}

),

stores as (

    select * from {{ ref('stg_retail-sales-demo__stores') }}

)

select
    stores.store_name,
    stores.location,
    round(sum(sales.total_sales), 2) as total_sales
from
    sales
join stores
    on sales.store_id = stores.store_id
group by
    stores.store_name,
    stores.location
order by
    total_sales desc