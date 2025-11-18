-- 1. to show total number of orders for each customer. Show full names and sort the records by Last name in ascending order. 
Select c.first_name, c.last_name, count(o.order_id)as Total_Number_of_Orders from customers c
join Orders o
on c.customer_id = o.customer_id
group by c.first_name, c.last_name
order By c.last_name asc;


-- 2. to show best selling products(IDs, product name, and sold quantity). Show top five best selling products. Sort by sold quantity in descending order.
select p.product_id, p.product_name, sum(o.quantity) as sold_quantity
from products p
join order_lines o
on p.product_id = o.product_id
group by p.product_id, p.product_name
order by sold_quantity desc
fetch first 5 rows only;


-- 3. to calculate the number of customers who made their payments by cash.
select p.payment_description, p.payment_method_id, count(distinct o.customer_id) as customer_count
from payment_method p join orders o
on p.payment_method_id = o.payment_method_id
where p.payment_description = 'Cash'
group by p.payment_description, p.payment_method_id;


--4. to find the most popular shipment method.
select s.shipment_description, count(o.shipment_method_id) as total_count
from shipment_method s
join orders o
on s.shipment_method_id = o.shipment_method_id
group by s.shipment_description
order by total_count desc
fetch first 1 row only;

--5. to find total orders and total revenue from each PAYMENT_METHOD

select p.payment_description, count(distinct o.order_id) as total_orders, sum(l.total_amount) as total_revenue
from  payment_method p join orders o 
on p.payment_method_id = o.payment_method_id
join order_lines l
on l.order_id = o.order_id
group by payment_description
order by total_revenue desc;

--6. to find products that have low inventory below 50 but have generated high sales above 50000.

select p.product_id, p.product_name, i.qty_on_hand, i.qty_on_order, sum(o.total_amount) as total_sales
from products p join product_inventory i
on p.product_id = i.product_id
join order_lines o
on o.product_id = p.product_id
group by p.product_id, p.product_name, i.qty_on_hand, i.qty_on_order
having i.qty_on_hand < 50                -- low inventory threshold
and sum(o.total_amount) > 50000   -- high sales threshold
order by i.qty_on_hand asc;   