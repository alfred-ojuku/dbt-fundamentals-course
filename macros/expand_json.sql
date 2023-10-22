{% macro expand_json() %}

{%- set dic =  {"Sat":"18","HDop":"0.6","PDop":"0.9","VDop":"0","RSSI":"100","iccid":"892540140000105483987","ev":74560} -%}

{%- set list = [] -%}
{%- for key in dic.keys() -%}
  {% set _ = list.append(key) %}
{%- endfor -%}

   WITH expanded AS (
    
    SELECT 
    {% for key in list %}
    JSON_EXTRACT_SCALAR(Attributes, '$.{{key}}') AS {{key}}
    {%- if not loop.last -%}
      ,
    {%- endif -%}
    {% endfor %}
   FROM `analytics-383819`.`telemetry`.`data`
   WHERE CanBusData IS NOT NULL

)
SELECT * FROM expanded
{% endmacro %}