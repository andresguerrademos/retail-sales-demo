with

sales as (

    select * from {{ ref('stg_retail-sales-demo__sales') }}

),

suppliers as (

    select * from {{ ref('stg_retail-sales-demo__suppliers') }}

),

products as (

    select * from {{ ref('stg_retail-sales-demo__products') }}

)

select
    su.supplier_name,
    su.contact_person,
    round(sum(sa.total_sales), 2) as total_sales
from
    sales sa
join products p
    on sa.product_id = p.product_id
join suppliers su
    on p.supplier_id = su.supplier_id
group by
    su.supplier_name,
    su.contact_person
order by
    total_sales desc
    