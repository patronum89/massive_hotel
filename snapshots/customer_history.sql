{% snapshot customer_history %}

{{
    config(
        target_schema = 'snapshot',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at = 'updated_at',
    )
}}

select 
    *
from 
    {{ ref ('staging_customer_data') }}

{% endsnapshot %}
