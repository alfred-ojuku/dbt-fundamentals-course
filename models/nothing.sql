{% macro expand_json() %}

    {% set payment_methods = dbt_utils.get_column_values(table=source("telemetry", 'data'), where="CanBusData IS NOT NULL", column='CanBusData') %}
    {{ payment_methods }}

    {%- call statement('dictionary', fetch_result=True) -%}
      SELECT CanBusData FROM `analytics-383819`.`telemetry`.`data`
      WHERE CanBusData IS NOT NULL
    {%- endcall -%}

    {%- set dict = load_result('dictionary')['data'][0][0] -%}
    {{ dict }}




    {%- set list = [] -%}
    {%- for key in dict.keys() -%}
        {% set _ = list1.append(key) %}
    {%- endfor -%}
    {{ list }}

   WITH expanded AS (
    
    SELECT 
    {% for key in list1 %}
        
    JSON_EXTRACT_SCALAR(CanBusData, '$.{{ key }}') AS {{ key }}
        {%- if not loop.last %}
            ,
        {%- endif -%}
    {% endfor %}
   FROM `analytics-383819`.`telemetry`.`data`
   WHERE CanBusData IS NOT NULL

)
SELECT * FROM expanded

{% endmacro %}
