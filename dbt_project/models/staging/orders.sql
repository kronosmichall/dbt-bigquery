select
  id,
  user_id,
  order_date,
  status,
  {{ status_num('status') }} as status_number
from `dbt-tutorial`.jaffle_shop.orders
