{{ config(
    post_hook="UNLOAD ('SELECT * FROM {{target.database}}.{{target.schema}}.order_analytics')
TO 's3://dbt-data-lake-819052087103/parquet_test'
IAM_ROLE 'arn:aws:iam::819052087103:role/dbt-labs-demo-dbtRedshiftSpectrumRole-PN8FIGF1ZWTO'
FORMAT AS PARQUET
ALLOWOVERWRITE;
",
) }}

Select * from {{ ref('order_analytics') }}