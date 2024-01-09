{% macro dedup_snowflake_data(relation, partition_by, order_by) %}

    select *
    from {{ relation }}
    qualify
        row_number() over (
            partition by {{ safe_concat(partition_by)}}
            order by {{ safe_concat(order_by) }}
        ) = 1

{% endmacro %}