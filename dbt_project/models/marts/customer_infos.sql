select
  customers.id as customer_id,
  customers.first_name as first_name,
  customers.last_name as last_name,
  customer_orders.first_order as first_order,
  customer_orders.last_order as last_order,
  coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
  coalesce(customer_orders.number_of_returned_orders, 0) as number_of_returned_orders,
  coalesce(customer_orders.number_of_return_pending_orders, 0) as number_of_return_pending_orders,
  coalesce(customer_orders.number_of_placed_orders, 0) as number_of_placed_orders,
  coalesce(customer_orders.number_of_shipped_orders, 0) as number_of_shipped_orders,
  coalesce(customer_orders.number_of_completed_orders, 0) as number_of_completed_orders
from {{ ref('customers') }} as customers
left join {{ ref('customer_orders') }} as customer_orders
on customers.id = customer_orders.user_id 
