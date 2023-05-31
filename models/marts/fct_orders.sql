with
orders as (select * from {{ ref("stg_orders") }}),

payments as (select * from {{ ref("stg_payments") }})


select
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    orders.status,
    payments.payment_id,
    payments.paymentmethod,
    payments.amount,
    payments.created_at

from orders
left join payments on orders.order_id = payments.orderid