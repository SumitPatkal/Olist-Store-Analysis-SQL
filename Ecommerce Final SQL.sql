create database if not exists Ecommerce;


# 1) Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics

select
	case 
	when dayofweek(o.order_purchase_timestamp) in (1,7) then 'Weekend' else 'Weekday' end as Day_Type,
    count(distinct o.order_id) as Total_orders,
    concat(cast(round(sum(p.payment_value / 1000)) as char(40)), ' K') as Total_Payment,
    round(avg(p.payment_value)) as Avg_Payment_Per_Customer
from olist_orders_dataset o join olist_order_payments_dataset p on o.order_id = p.order_id
group by Day_Type;

            
# 2) Number of Orders with review score 5 and payment type as credit card.

select count(distinct p.order_id) as Total_Orders
from olist_order_payments_dataset p join olist_order_reviews_dataset r on p.order_id = r.order_id
where r.review_score = 5 and p.payment_type = "credit_card";



# 3) Average number of days taken for order_delivered_customer_date for pet_shop

select 
    p.product_category_name,
    concat(round(avg(datediff(o.order_delivered_customer_date, o.order_purchase_timestamp)), 0), ' days') as avg_delivery_days
from olist_orders_dataset o
join olist_order_items_dataset i 
    on o.order_id = i.order_id
join olist_products_dataset p 
    on i.product_id = p.product_id
where p.product_category_name = 'pet_shop'
group by p.product_category_name;





# 4) Average price and payment values from customers of sao paulo city

select 
    customer_city,
    round(avg(i.price), 0) as avg_order_item_price,
    round(avg(p.payment_value), 0) as avg_payment_value
from olist_order_items_dataset i
join olist_orders_dataset o
    on i.order_id = o.order_id
join olist_order_payments_dataset p 
    on o.order_id = p.order_id
join olist_customers_dataset c
    on o.customer_id = c.customer_id
where c.customer_city = 'sao paulo';





# 5) Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.

select round(avg(datediff(order_delivered_customer_date, 
	order_purchase_timestamp)),0) as Shipping_Days, 
    review_score
from olist_order_reviews_dataset join olist_orders_dataset using(order_id)
where order_delivered_customer_date is not null and order_purchase_timestamp is not null
group by review_score
order by review_score desc;






-- 6) Top selling product categories (EXTRA)

select 
    pc.product_category_name_english as category,
    count(o.order_id) as total_items_sold
from olist_order_items_dataset o
join olist_products_dataset p on o.product_id = p.product_id
join product_category_name_translati pc on p.product_category_name = pc.product_category_name
group by category
order by total_items_sold desc
limit 10;

