{% snapshot customers_snapshot %}

{{ config(
    target_schema = 'snapshots',
    unique_key    = 'customer_id',
    strategy      = 'timestamp',
    updated_at    = 'updated_at',
) }}

SELECT
    *
FROM {{ ref('customers_seed') }}

{% endsnapshot %}

-- Customer 1 moved to Germany
UPDATE ANALYTICS.RAW.CUSTOMERS_SEED
SET country    = 'Germany',
    updated_at = CURRENT_TIMESTAMP()
WHERE customer_id = 1;

-- Customer 2 changed email
UPDATE ANALYTICS.RAW.CUSTOMERS_SEED
SET email      = 'sofia.garcia.new@email.com',
    updated_at = CURRENT_TIMESTAMP()
WHERE customer_id = 2;

-- Customer 3 updated their account balance
UPDATE ANALYTICS.RAW.CUSTOMERS_SEED
SET account_balance = 9999.99,
    updated_at      = CURRENT_TIMESTAMP()
WHERE customer_id = 3;