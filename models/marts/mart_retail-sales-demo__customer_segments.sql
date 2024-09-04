with

customers as (

    select * from {{ ref('stg_retail-sales-demo__customers') }}

)

select
    customer_id,
    customer_name,
    email,
    phone_number,
    loyalty_points,
    case
        when loyalty_points < 200 then 'Low'
        when loyalty_points between 200 and 500 then 'Medium'
        else 'High'
    end as loyalty_segment
from
    customers
order by
    loyalty_points desc