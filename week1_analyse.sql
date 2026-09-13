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
