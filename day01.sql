
1.SELECT * FROM products;

2.SELECT product_name ,price FROM products;

3.SELECT name,department FROM employees;

4.SELECT order_id,total_amount FROM orders;


5.SELECT product_name AS item,
price AS rupees
FROM products;

6.SELECT product_name,
price,
price - price *0.1 AS discounted_price
FROM products;

7.SELECT product_name,
stock,
price * stock AS stock_value
FROM products;


8.SELECT name || ' <' || email ||'>' AS name_email
FROM customers;

9.SELECT name,
salary,
ROUND(salary/12) AS monthly_salary
FROM employees;

10.SELECT * ,
quantity * unit_price AS line_total
FROM order_items;

11.SELECT product_name,
category AS product_group
FROM products;

12.SELECT name ||'  hello from kirana cart' AS greeting
FROM customers;
