{% macro shipping_days(date_order_placed, date_order_arrived, unit='day') %}
    DATEDIFF({{ unit }}, {{ date_order_placed }}, {{ date_order_arrived }})
{% endmacro %}