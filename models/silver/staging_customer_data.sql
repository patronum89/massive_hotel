{{
    config(
        tag = ['silver']
    )
}}
{{
  generate_flatten_json(
    model_name = source('raw', 'cust_raw_data'),
    json_column = 'record_content'
  )
}}
{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  -- (uses >= to include records with updated at greater than data currently present in silver layer)
  where record_content:updated_at >= (select max(updated_at) from {{ this }})
{% endif %}