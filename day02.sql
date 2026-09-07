1.SELECT * FROM products
WHERE category = 'Spices';

2.SELECT * FROM products
WHERE price > 300;

3.SELECT * FROM customers
WHERE city = 'Chennai';

4.SELECT * FROM orders
WHERE status = 'delivered';

5.SELECT * FROM orders
WHERE status != 'delivered';

6.SELECT * FROM products
WHERE price BETWEEN 100 AND 200;

7.SELECT * FROM customers
WHERE city IN ('Kochi','Chennai');

8.SELECT * FROM products
WHERE product_name LIKE '%POWDER%';

9.SELECT * FROM products
WHERE product_name LIKE 'C%';

10.SELECT * FROM customers
WHERE email IS NULL;

11.SELECT * FROM customers
WHERE email IS NOT NULL;

12.SELECT * FROM employees
WHERE department = 'Sales' AND salary > 55000;

13.SELECT * FROM employees
WHERE department IN ('Analytics','Operations')

14.SELECT  * FROM products
WHERE stock =0;

15.SELECT * FROM orders
WHERE order_date > '2024-06-01'

16.SELECT * FROM customers
WHERE LOWER(city) = 'bangalore';

17.SELECT * FROM employees
WHERE hire_date LIKE '2022%'

18.SELECT * FROM employees
WHERE salary < 60000 OR salary IS NULL;

19.SELECT * FROM products
WHERE price < 350 AND (category = 'Spices' OR category = 'Beverages');

20.SELECT * FROM orders
WHERE status = 'delivered' AND total_amount BETWEEN 800 AND 1500;
