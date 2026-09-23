--1.
select o.order_id, c.name
from orders o 
join customers c on o.customer_id = c.customer_id;

--2.
select o.order_id, c.name,c.city
from orders o 
join customers c on o.customer_id = c.customer_id;


--3.
select oi.order_item_id, p.product_name
from order_items oi 
join products p on oi.product_id = p.product_id;

--4.
select oi.order_item_id, p.product_name,p.category
from order_items oi 
join products p on oi.product_id = p.product_id;

--5.
select o.order_id ,c.name,o.total_amount
from orders o
join customers c  on o.customer_id = c.customer_id
where status = 'delivered';

--6.
select o.order_id,c.name,c.city
from orders o
join customers c  on o.customer_id = c.customer_id
where city ='Chennai';

--7.
select oi.order_item_id,o.status
from order_items oi
join orders o  on oi.order_id = o.order_id
where status = 'cancelled';

--8.
select c.name,p.product_name,oi.quantity
from orders o
join customers c  on o.customer_id = c.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
;

--9.
select c.name,count(*) as orders
from orders o
join customers c  on o.customer_id = c.customer_id
group by c.name;

--10.
select c.name,sum(o.total_amount) as total_spend
from orders o
join customers c  on o.customer_id = c.customer_id
group by c.name
order by total_spend desc;

-—11.
select lower(c.city),count(*) as orders
from orders o
join customers c  on o.customer_id = c.customer_id
group by lower(c.city)
;

--12.
SELECT c.city, COUNT(*) AS orders, SUM(o.total_amount) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status ='delivered'
GROUP BY c.city
ORDER BY revenue DESC;

--13.
SELECT  p.product_name, oi.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY c.name;

--14.
SELECT p.product_name, SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
limit 5;


--15.
SELECT p.category, SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;


--16.
select distinct c.name,p.category
from order_items oi
join products p on oi.product_id =p.product_id
join orders o on oi.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
where category = 'Spices';

-- 17.
select round(avg(o.total_amount),2) as order_value,c.city
from orders o
join customers c on o.customer_id = c.customer_id
group by city;

--18.
select e.name,e.manager_id
from employees e
join employees em on e.employee_id = em.employee_id;

--19.
select  distinct substr(o.order_date,1,7) as month ,count(*) as orders,c.state
from orders o
join customers c on o.customer_id =c.customer_id
where state = 'Tamil Nadu'
group by  substr(o.order_date,1,7) 
;

--20.
select o.order_id,c.name,c.city,o.total_amount
from orders o 
join customers c on o.customer_id = c.customer_id
order by o.total_amount desc
limit 1;
