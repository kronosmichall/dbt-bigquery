select
  user_id,
  min(order_date) as first_order,
  max(order_date) as last_order,
  count(id) as number_of_orders,
  {{ count_by_status_number(-2)}} as number_of_returned_orders,
  {{ count_by_status_number(-1)}} as number_of_return_pending_orders,
  {{ count_by_status_number(1)}} as number_of_placed_orders,
  {{ count_by_status_number(2)}} as number_of_shipped_orders,
  {{ count_by_status_number(3)}} as number_of_completed_orders
from {{ ref('orders') }} as orders 
group by user_id

