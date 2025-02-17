{% macro status_num(status) %}
  case 
      when {{ status }} = 'placed' then 1 
      when {{ status }} = 'shipped' then 2
      when {{ status }} = 'completed' then 3
      when {{ status }} = 'return_pending' then -1
      when {{ status }} = 'returned' then -2
      else  0 -- this should never be the case!
  end

{% endmacro %}

{% macro count_by_status_number(case) %}
count(case when status_number = {{ case }} then 1 end)
{% endmacro %}
