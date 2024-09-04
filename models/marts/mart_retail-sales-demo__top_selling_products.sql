with

sales as (

    select * from {{ ref('stg_retail-sales-demo__sales') }}

),

products as (

    select * from {{ ref('stg_retail-sales-demo__products') }}

)

select
    p.product_name,
    sum(s.quantity) as quantity,
    round(sum(total_sales), 2) as total_sales
from
    sales s
join products p
    on s.product_id = p.product_id
group by
    p.product_name
order by
    quantity desc
