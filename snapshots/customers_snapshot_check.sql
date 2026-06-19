{% snapshot customers_snapshot_check %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['country', 'email']
    )
}}

SELECT * FROM {{ref('customers_seed')  }}

{% endsnapshot %}