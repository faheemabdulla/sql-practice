1.SELECT category,COUNT(*) AS n
FROM products
GROUP BY category
HAVING COUNT(*) > 2;

2.SELECT LOWER(city),COUNT(*) AS customers
FROM customers
GROUP BY LOWER(city)
HAVING COUNT(*) >3;

3.SELECT department,COUNT(*) AS employee
FROM employees
GROUP BY department
HAVING COUNT(*) >2;

4.SELECT category,ROUND(AVG(price)) AS average_price
FROM products
GROUP BY category
HAVING AVG(price) >200;

5.SELECT customer_id,COUNT(*) AS n 
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 2;

6.SELECT customer_id,SUM(total_amount) AS spend 
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 3000;

7.SELECT SUBSTR(order_date,1,7) AS month,COUNT(*) AS orders
FROM orders
GROUP BY SUBSTR(order_date,1,7)
HAVING COUNT(*)>3;

8.SELECT product_id, SUM(quantity) AS unit_sold
FROM order_items
GROUP BY product_id
HAVING SUM(quantity)>4;

9.SELECT department, ROUND(AVG(salary)) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

10.SELECT category,SUM(stock) AS stock
FROM products
GROUP BY category
HAVING SUM(stock) >300;

11.SELECT customer_id,COUNT(customer_id) AS ORDERS ,SUM(total_amount) AS spend
FROM orders
WHERE status = 'delivered'
GROUP BY customer_id
HAVING  SUM(total_amount) > 2000 AND COUNT(customer_id) >2;

12.SELECT SUBSTR(order_date,1,7) AS month,SUM(total_amount) AS revenue
FROM orders
GROUP BY SUBSTR(order_date,1,7)
HAVING  SUM(total_amount) > 3000 ;

13.SELECT product_id,COUNT(product_id) as appearance
FROM order_items
GROUP BY product_id
HAVING COUNT(PRODUCT_ID) > 3;

14.SELECT category,PRICE,COUNT(*) AS items
FROM products
GROUP BY category
HAVING COUNT(category) > 1 AND MIN(price) < 150;

15.SELECT category, COUNT(*) FROM products  GROUP BY category
HAVING COUNT(*) > 2;

16.WHERE FILTERS BEFORE GROUPING HERE FITLERS SHOULD DONE AFTER GROUPING

17.SELECT city,COUNT(*) AS customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 2
ORDER BY customers DESC;

18.SELECT department,SUM(SALARY)AS TOTAL_SALARY
FROM employees
GROUP BY department
HAVING SUM(SALARY)>150000;

19.SELECT customer_id,status,COUNT(CUSTOMER_ID) AS ORDERS
FROM orders
WHERE status != 'cancelled'
GROUP BY CUSTOMER_ID
HAVING COUNT(CUSTOMER_ID) > 1;

20.SELECT category,ROUND(AVG(PRICE)) AS AVG_PRICE
FROM PRODUCTS
GROUP BY CATEGORY
HAVING AVG(PRICE) BETWEEN 100 AND 400;
