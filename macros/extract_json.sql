{% macro extract_json(column_json) %}
  (fromjson({{ column_json }})['message'])
{% endmacro %}
