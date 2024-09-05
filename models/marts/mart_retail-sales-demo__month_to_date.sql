with

sales as (

    select * from {{ ref('stg_retail-sales-demo__sales') }}

),

current_mtd as (

    select
        sum(total_sales) as current_mtd_sales
    from
        sales
    where
        date between date_trunc(current_date, month) and current_date

),

previous_mtd as (

    select
        sum(total_sales) as previous_mtd_sales
    from
        sales
    where
        date between date_trunc(date_sub(current_date, interval 1 month), month) and date_sub(current_date, interval 1 month)

)

select
    c.current_mtd_sales,
    p.previous_mtd_sales,
    round((c.current_mtd_sales - p.previous_mtd_sales) / p.previous_mtd_sales * 100, 2) as mtd_comparison
from
    current_mtd c, previous_mtd p