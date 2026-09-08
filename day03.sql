1.SELECT product_name,price
FROM products
ORDER BY price;

2.SELECT product_name,price
FROM products
ORDER BY price DESC;

3.SELECT name,signup_date
FROM customers
ORDER BY signup_date DESC;

4.SELECT name,salary
FROM employees
ORDER BY salary DESC;

5.SELECT product_name,price
FROM productS
ORDER BY price DESC
LIMIT 3;

6.SELECT order_id,total_amount FROM orders
ORDER BY total_amount DESC
LIMIT 5;

7.SELECT product_name,category,price
FROM products
WHERE category = 'Spices'
ORDER BY price;

8.SELECT name,department,salary
FROM employees
ORDER BY department,salary DESC;

9.SELECT DISTINCT category
FROM products;

10.SELECT DISTINCT status
FROM orders;

11.SELECT DISTINCT LOWER(city)
FROM customers;

12.SELECT product_name,
price*stock AS stock_value
FROM products
ORDER BY stock_value DESC
LIMIT 5;

13.SELECT name,hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 1;

14.SELECT order_id,order_date
FROM orders
ORDER BY order_date LIMIT 3;

15.SELECT order_id,status,total_amount AS value
FROM orders
WHERE status = 'delivered'
ORDER BY total_amount DESC LIMIT 4;

16.SELECT DISTINCT city,state
FROM customers;

17.SELECT product_name,category,price
FROM products
WHERE price BETWEEN 100 AND 500
ORDER BY category,price;

18.SELECT product_name,price
FROM products
ORDER BY price DESC LIMIT 3 OFFSET 3;

19.SELECT product_name,stock
FROM products
WHERE stock > 0
ORDER BY stock LIMIT 1;

20.SELECT DISTINCT department
FROM employees
ORDER BY department;
