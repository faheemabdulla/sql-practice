--1.
select product_name,price,
rank () over (order by price desc) as ranked
from products

--2.
select product_name,price,category,
rank () over (partition by category order by price desc) as ranked
from products

--3.
select product_name,price,category,
avg(price) over (partition by category ) as avg_per_cat
from products

—4.
select product_name,price,category,
avg(price) over (partition by category ) as avg_per_cat,
price-avg(price) over (partition by category )as diff
from products

—5.
with ranked as (select product_name,price,category,
row_number() over (partition by category order by price desc ) as toporder
from products)
select * from ranked where toporder <=2 

--6.
select name,department,salary,
row_number() over (partition by department order by salary desc) as ranked
from employees

--7.
with ranked as (select name,department,salary,
row_number() over (partition by department order by salary desc) as ranks
from employees)
select * from ranked where ranks=1


--8.
select name,department,salary,
round(avg(salary) over (partition by department ),2) as avg_per_dept
from employees



--9.
select c.name,o.order_id,o.customer_id,o.order_date,
row_number() over (partition by o.customer_id order by o.order_date) as orderseq
from orders o
join customers c on o.customer_id = c.customer_id

--10.
with ranked as (select c.name,o.order_id,o.customer_id,o.order_date,
row_number() over (partition by o.customer_id order by o.order_date) as orderseq
from orders o
join customers c on o.customer_id = c.customer_id)
select * from ranked where orderseq =1


--11.
with ranked as (select c.name,o.order_id,o.customer_id,o.order_date,
row_number() over (partition by o.customer_id order by o.order_date desc) as orderseq
from orders o
join customers c on o.customer_id = c.customer_id)
select * from ranked where orderseq =1

--12.
-- Q12: Who are the top 3 customers by total delivered spend?

-- Answer: Aisha Rahman leads with ₹4,080 in delivered spend,
-- followed by Ravi Kumar with ₹3,975 and Meera Nair with ₹3,725.
-- These three customers are the highest-value customers based on
-- delivered orders.

WITH customer_spend AS (
    SELECT
        customer_id,
        SUM(total_amount) AS delivered_spend
    FROM orders
    WHERE status = 'delivered'
    GROUP BY customer_id
),
ranked_customers AS (
    SELECT
        customer_id,
        delivered_spend,
        RANK() OVER (ORDER BY delivered_spend DESC) AS spend_rank
    FROM customer_spend
)
SELECT
    c.name,
    rc.delivered_spend,
    rc.spend_rank
FROM ranked_customers rc
JOIN customers c
    ON rc.customer_id = c.customer_id
WHERE rc.spend_rank <= 3
ORDER BY rc.spend_rank;



--13.
with product_revenue as
(select p.product_name,p.product_id,p.category,sum(oi.quantity * oi.unit_price) as revenue
 from order_items oi
 join products p on oi.product_id = p.product_id
 group by p.product_id,p.product_name,p.category)
 ,ranked_products as
 (select product_name,product_id,category,revenue,row_number() over(partition by category order by revenue desc ) as ranked_revenue
  from product_revenue)
  
  select product_name,category,revenue,ranked_revenue
  from ranked_products
  where ranked_revenue <=2

--14.
-- by row_number by oreder of salary its putting number and if same salary occurit will check next priority and move on
--but in rank by if salaries are same then it will get same rankings for each and next will get after two of that
-- but in dense_rank same value get same rank and next value get next rank
select name,salary,
row_number() over(order by salary desc) as rn,
rank() over (order by salary desc) as rank,
dense_rank () over (order by salary desc)as denserank
from employees

--15.
select order_id,sum(total_amount) as total,(select avg(total_amount) from orders)as average 
from orders
group by order_id

--16.
select city,signup_date,rank()over(partition by city order by signup_date) as rn
from customers


--17.
select product_name,price,category,
max(price) over (partition by category order by price desc) as categorymax,
max(price)over(partition by category order by price desc) - price as diff
from products

--18.
with ranked as (select product_name,price ,category,
rank() over (partition by category order by price desc) as rn
from products)
select product_name,price ,category,rn
from ranked
where rn =2;
