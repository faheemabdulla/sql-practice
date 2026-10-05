--1.
select c.name,count(o.order_id) as orders
from customers c
 left join orders o on c.customer_id = o.customer_id
 group by c.name;

--2.
select c.name,coalesce(sum(o.total_amount),0) as lifetime_value
from customers c
left join orders o on c.customer_id = o.customer_id and status ='delivered'
group by c.name
order by lifetime_value desc;

--3.
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
where o.order_id is null;


--4.
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

--5
select p.product_name,coalesce(sum(oi.quantity),0) as items_count
from products p
left join order_items oi on p.product_id = oi.product_id
group by p.product_id
order by items_count desc;

--6.
select e.name,ei.manager_id
from employees e
left join employees ei on e.employee_id = ei.employee_id

—7.
select e.name,ei.manager_id
from employees e
left join employees ei on e.employee_id = ei.employee_id
where e.manager_id is null

--8.
select c.city, count(distinct c.name) as customers,coalesce (sum(o.total_amount),0) as revenue
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.city
order by revenue desc;

--9
select p.category,sum(oi.quantity * oi.unit_price) as revenue
from products p 
left join order_items  oi on p.product_id = oi.product_id
left join orders o on oi.order_id = o.order_id
group by p.category
order by revenue desc;

--10 
select c.name,c.customer_id,coalesce (max(o.order_date),0)
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.name
order by o.order_date desc;

--11
select c.name,c.customer_id
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.name
having status != 'delivered';

--12.
select p.product_name,p.product_id,coalesce(count(oi.product_id),0) as orders
from products p
left join order_items oi on p.product_id = oi.product_id
group by p.product_name
order by orders desc;

--13.
-- by using count(*) instead of using count(order_id)
--it will give the number of rows intead of number of orders
select c.name,count(*) as orders
from customers c
 left join orders o on c.customer_id = o.customer_id
 group by c.name;

--14.
select c.name,c.customer_id,coalesce (count(o.order_id),0) as ordercount
from customers c
left join orders o on c.customer_id = o.customer_id and status = 'delivered'
group by c.name
order by ordercount
;

--15.
select p.product_name,p.product_id,coalesce(p.stock,0)
from products p
left join  order_items oi on  p.product_id = oi.product_id  
where stock >0
group by p.product_id
having  p.product_id is not oi.product_id

--16. 
select e.manager_id,count(e.employee_id)
from employees e
group by manager_id
;

--17.
select substr(o.order_date,1,7),sum(o.total_amount) as revenue
from orders o
group by substr(o.order_date,1,7);
--in this database only entered months that with orders
--there is no data about month with no orders

--18.
select c.name,o.status
from customers c
 join orders o on c.customer_id = o.customer_id and status !='delivered'and status!='pending';
