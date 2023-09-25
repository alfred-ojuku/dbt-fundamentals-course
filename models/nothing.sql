{% set expand_json_query %}
WITH expanded AS (
SELECT JSON_EXTRACT_SCALAR(CanBusData, '$.RPM') AS RPM
FROM `analytics-383819`.`telemetry`.`data`
WHERE CanBusData IS NOT NULL
)
SELECT * FROM expanded
{% endset %}
{% set results = run_query(expand_json_query) %}
{{results}}


{% set database = target.database%}
{% set schema =  target.schema%}
SELECT 
      table_type,
      table_name,
      table_schema,
      last_altered
FROM {{database}}.information_schema.tables
WHERE table_schema = upper('{{schema}}')
