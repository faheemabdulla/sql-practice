- Q1: Which cities are our biggest customer bases, and is our
-- customer base concentrated or spread out?
-- Answer: Hyderabad and Chennai lead with 4 customers each, followed
-- by Bangalore and Kochi with 3 each. The customer base is evenly
-- spread rather than heavily concentrated in one city, which reduces
-- geographic risk.
-- Note: 'bangalore' appears in lowercase for one customer, so LOWER()
-- is used to normalise city names.
SELECT
LOWER(city) AS city,
COUNT(*) AS customers
FROM customers
GROUP BY LOWER(city)
ORDER BY customers DESC;


Q2: Which product categories generate the most revenue?
-- (Use order_items — quantity × unit_price.)
-- Answer: Spices generate the most revenue at 7,525, followed by
-- Grains at 6,260 and Beverages at 3,880. Spices are the strongest
-- revenue-generating category in the available order-item data.




-- Q3: What proportion of orders are not completing successfully,
-- and what's the revenue impact?
-- Answer: 5 of 25 orders, or 20%, are not completed successfully.
-- These include cancelled, returned, and pending orders. Together
-- they represent 1,960 in order value, meaning 20% of all recorded
-- order value is tied to orders that are not currently delivered.
  select count(*) from orders
where status = 'delivered'
