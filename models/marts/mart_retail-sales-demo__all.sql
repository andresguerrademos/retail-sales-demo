with

sales as (

    select * from {{ ref('stg_retail-sales-demo__sales') }}

),

stores as (

    select * from {{ ref('stg_retail-sales-demo__stores') }}

),

products as (

    select * from {{ ref('stg_retail-sales-demo__products') }}

),

suppliers as (

    select * from {{ ref('stg_retail-sales-demo__suppliers') }}

),

customers as (

    select * from {{ ref('stg_retail-sales-demo__customers') }}

)

select
    sa.sale_id,
    sa.date,
    sa.quantity,
    sa.price_per_unit,
    sa.total_sales,
    st.store_name,
    st.location,
    p.product_name,
    p.category,
    p.price,
    p.cost,
    su.supplier_name,
    su.contact_person,
    su.contact_email,
    su.contact_phone,
    c.customer_name,
    c.email,
    c.phone_number,
    c.loyalty_points
from
    sales sa
join stores st
    on sa.store_id = st.store_id
join products p
    on sa.product_id = p.product_id
join suppliers su
    on p.supplier_id = su.supplier_id
join customers c
    on sa.customer_id = c.customer_id