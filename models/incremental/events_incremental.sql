{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}

WITH max_event_date AS (
  SELECT 
    MAX(event_date) AS max_date 
  FROM {{ this }}
)

SELECT *
FROM {{ ref('stg_events') }}
{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  WHERE event_date >= (SELECT max_date FROM max_event_date)
{% endif %}
