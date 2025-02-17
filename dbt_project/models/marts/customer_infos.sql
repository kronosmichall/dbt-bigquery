select
  customers.id,
  customers.first_name,
  customers.last_name,
  customer_orders.first_order,
  customer_orders.last_order,
  customer_orders.number_of_orders
from {{ ref('customers') }} as customers
left join {{ ref('customer_orders') }} as customer_orders
on customers.id = customer_orders.user_id 
