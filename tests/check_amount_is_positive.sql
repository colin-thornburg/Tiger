SELECT *
FROM {{ ref('order_analytics') }}
WHERE amount < 0
