--1.
SELECT product_name, price FROM products
WHERE price > (SELECT AVG(price) FROM products);

--2.
with category as
(select product_id,avg(price) as average,category
 from products
 group by category)
SELECT p.product_name,p.price
from category c
join products p on c.product_id = p.product_id
where price < c.average

--3.
select name from customers
where customer_id in (select customer_id from orders where status ='cancelled')

--4.
select order_id,total_amount
from orders
where total_amount > (select avg(total_amount) from orders)

—5.
with spend as 
(select customer_id,sum(total_amount) as total
 from orders where status = 'delivered'
group by customer_id)
 select c.name ,s.total
 from spend s
 join customers c on s.customer_id = c.customer_id
 where s.total > 2000

--6.
with trevenue as 
(select product_id,sum(quantity * unit_price) as revenue
 from order_items
 group by product_id
)
select p.product_name,p.category,t.revenue
from trevenue t
join products p on t.product_id = p.product_id
order by t.revenue desc limit 3

--7.
select name,salary,department,(select avg(salary)
from employees
group by department) as avgsalary
from employees
where salary >(select avg(salary)
from employees
group by department)


--8.
with trevenue as
(select product_id,sum(quantity * unit_price) as revenue
from order_items
group by product_id)
select p.category,sum(t.revenue) as revenuepercat
from trevenue t
join products p on t.product_id = p.product_id
group by p.category
order by revenuepercat desc limit 1;

--9.
with totalspend as
(select customer_id,sum(total_amount) as spend
from orders
group by customer_id)
select c.name,t.spend
from totalspend t
join customers c on t.customer_id=c.customer_id
where t.spend >(select avg(t.spend) from totalspend t )

--10.
SELECT product_name, price,
(SELECT AVG(price) FROM products) AS overall_avg,
ROUND(price - (SELECT AVG(price) FROM products), 2) AS diff
FROM products
WHERE price >(SELECT AVG(price) FROM products);

--11.
with trevenue as 
(select order_id,sum(quantity*unit_price) as revenue
from order_items
group by order_id),

percity as
(select o.customer_id,sum(t.revenue) as income
from trevenue t
join orders o on t.order_id = o.order_id
group by o.customer_id)

select c.city,sum(p.income) as revenuepercity,avg(p.income) as average
from percity p
join customers c on p.customer_id=c.customer_id
group by c.city
having sum(p.income) > avg(p.income)

--12.
with revmonth as (
select o.order_id,sum(oi.quantity * oi.unit_price) as revenue,substr(o.order_date,1,7) as month
from orders o
join order_items oi on o.order_id =oi.order_id
group by o.order_id)
select month,revenue,avg(revenue)
from revmonth
group by month
having revenue > avg(revenue)

--13.
WITH customercategory as
(SELECT o.customer_id, COUNT(DISTINCT p.category) AS category_count
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id)
    
    select c.name,cc.category_count
    from customercategory cc
    join customers c on cc.customer_id = c.customer_id
    where cc.category_count > 2

--14.
select product_name,category,max(price)
from products
group by category


--15.
--anit join is more readable because its simply explanation and readable
select c.name from customers c
 join orders o on c.customer_id= o.customer_id
where  status ='cancelled'


--16.
with pcount as(
select oi.order_id,count(distinct p.product_id) as productcount
from  order_items oi
join  products p on oi.product_id = p.product_id
group by oi.order_id)

select order_id,productcount
from pcount
where productcount > 2

--17.
with mostspend as(
  select c.name,o.customer_id,sum(o.total_amount) as spend
from orders o
  join customers c on o.customer_id = c.customer_id
group by o.customer_id)

select name,max(spend) from mostspend

-- Q18: Which products have sold more units than the average units sold per product?

-- Answer: These products have sold more units than the average among
-- products that have recorded sales. This highlights the products with
-- above-average unit demand.

WITH product_units AS (
    SELECT
        product_id,
        SUM(quantity) AS units_sold
    FROM order_items
    GROUP BY product_id
),
average_units AS (
    SELECT
        AVG(units_sold) AS avg_units_sold
    FROM product_units
)

SELECT
    p.product_name,
    pu.units_sold
FROM product_units pu
JOIN products p
    ON pu.product_id = p.product_id
WHERE pu.units_sold > (SELECT avg_units_sold FROM average_units)
ORDER BY pu.units_sold DESC;
