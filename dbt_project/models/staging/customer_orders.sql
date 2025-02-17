select
  user_id,
  min(order_date) as first_order,
  max(order_date) as last_order,
  count(id) as number_of_orders
from {{ ref('orders') }} 
group by user_id

