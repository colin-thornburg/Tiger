with payments as (

select
    id as payment_id,
    orderid,
    paymentmethod,
    status,
    -- amount is stored in cents, convert it to dollars
    created as created_at,
    amount
from {{ source('stripe', 'payment') }}
)

Select * from payments