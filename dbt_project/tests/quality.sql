with customer_counts as(
  select
    count(customer_id) as total_count,
    count(case when number_of_orders = 0 then 1 end) as no_orders_count
  from
    {{ ref('customer_infos')}}
)

select
  *
from 
  customer_counts 
when
  total_count < 2 * no_orders_count

