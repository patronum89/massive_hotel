{% macro safe_concat(field_list) %}
  --  Takes an input list and generates a concat() statement with each argument in the list safe_casted to a string and wrapped in an ifnull()
  concat({% for f in field_list %}
            {{ f }}
            {% if not loop.last %}, {% endif %}
        {% endfor %})
{% endmacro %}