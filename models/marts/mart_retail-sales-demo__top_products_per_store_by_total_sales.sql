with

sales as (

    select * from {{ ref('stg_retail-sales-demo__sales') }}

),

stores as (

    select * from {{ ref('stg_retail-sales-demo__stores') }}

),

products as (

    select * from {{ ref('stg_retail-sales-demo__products') }}

)

select
    st.store_name,
    p.product_name,
    round(sum(total_sales), 2) as total_sales,
    row_number() over (partition by st.store_name order by sum(total_sales) desc) as rank
from
    sales sa
join stores st
    on sa.store_id = st.store_id
join products p
    on sa.product_id = p.product_id
group by
    st.store_name,
    p.product_name
order by
    st.store_name,
    total_sales desc
