1.SELECT COUNT(*) AS total_products
FROM products;

2.SELECT COUNT(*) AS total_orders
FROM orders;

3.SELECT ROUND(AVG(price),2) AS average_price
FROM products;

4.SELECT MIN(price) AS cheapest,MAX(price) AS expensive FROM products;

5.SELECT SUM(total_amount) AS total_revenue
FROM orders;

6.SELECT COUNT(*) ,COUNT(email)
FROM customers;

7.SELECT category,COUNT(*) AS product_count 
FROM products
GROUP BY category;

8.SELECT city,COUNT(*) AS customers_count
FROM customers
GROUP BY city;

9.SELECT city,COUNT(*) AS customers_count
FROM customers
GROUP BY LOWER(city);

10.SELECT category,ROUND(AVG(price),2) AS 	average_price
FROM products
GROUP BY category;

11.SELECT department,COUNT(*) AS employees
FROM employees
GROUP BY department;

12.SELECT department,AVG(salary) AS average_salary
FROM employees
GROUP BY department;

13.SELECT product_id,COUNT(quantity) AS quantity_sold
FROM order_items
GROUP BY product_id;

14.SELECT status,COUNT(*) AS orders
FROM orders
GROUP BY status;

15.SELECT status,SUM(total_amount) AS total_revenue
FROM orders
GROUP BY status;

16.SELECT customer_id,COUNT(*) AS orders
FROM orders
GROUP BY customer_id
ORDER BY orders DESC;

17.SELECT customer_id,SUM(total_amount) AS total_spend
FROM orders
WHERE status = 'delivered'
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 5;

18.SELECT SUBSTR(order_date,1,7) AS month,COUNT(*) AS orders
FROM orders
GROUP BY SUBSTR(order_date,1,7)

19.SELECT SUBSTR(order_date,1,7) AS month,SUM(total_amount) AS revenue
FROM orders
GROUP BY SUBSTR(order_date,1,7)

20.SELECT category,COUNT(*) AS products,AVG(price) AS average,SUM(stock) AS stock_held 
FROM products
GROUP BY category;

21.SELECT SUBSTR(hire_date,1,4) AS year,COUNT(*) AS employees
FROM employees
GROUP BY SUBSTR(hire_date,1,4)

22.SELECT product_id,SUM(quantity) AS quantity_sold,
SUM(quantity * unit_price) AS total_revenue
FROM order_items
GROUP BY product_id;

