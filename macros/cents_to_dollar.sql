{% macro cents_to_dollar(column_name, decimal_places=2) -%}
{#- converts cents to dollars in a given column -#}
round({{column_name}} / 100, {{decimal_places}})
{%- endmacro -%}