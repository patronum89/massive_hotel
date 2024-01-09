{{
    config(
        unique_key='id',
        tag = ['gold']
    )
}}

{{
    dedup_snowflake_data(
        relation = ref ('staging_customer_data'), 
        partition_by = ['id'], 
        order_by = ['updated_at']
    )
}}
