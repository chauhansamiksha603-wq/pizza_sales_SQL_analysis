-- Use the PIZZAHUT database
USE PIZZAHUT;

------------------------------------------------------------
-- 1. Display all rows from the orders table
SELECT *
FROM orders;

------------------------------------------------------------
-- 2. Show the first 10 rows from the pizza_types table
SELECT *
FROM pizza_types
LIMIT 10;

------------------------------------------------------------
-- 3. List distinct category values from pizza_types
SELECT DISTINCT category
FROM pizza_types;

------------------------------------------------------------
-- 4. Count how many pizzas are listed in the pizzas table
SELECT COUNT(*) AS total_pizza
FROM pizzas;

------------------------------------------------------------
-- 5. Retrieve all orders placed on '2015-01-01'
SELECT *
FROM orders
WHERE order_date = '2015-01-01';

------------------------------------------------------------
-- 6. Show order_id and pizza_id from order_details where quantity > 1
SELECT order_id, pizza_id
FROM order_details
WHERE quantity > 1;

------------------------------------------------------------
-- 7. List all pizza names from pizza_types in alphabetical order
SELECT name
FROM pizza_types
ORDER BY name ASC;

------------------------------------------------------------
-- 8. Find the price of 'bbq_ckn_l' pizza
SELECT price
FROM pizzas
WHERE pizza_id = 'bbq_ckn_l';

------------------------------------------------------------
-- 9. Count the total number of orders in the orders table
SELECT COUNT(*) AS total_orders
FROM orders;

------------------------------------------------------------
-- 10. Find the earliest order date
SELECT MIN(order_date) AS earliest_order_date
FROM orders;

------------------------------------------------------------
-- 11. Find the latest order date
SELECT MAX(order_date) AS latest_order_date
FROM orders;

------------------------------------------------------------
-- 12. Show all pizzas in size 'M'
SELECT *
FROM pizzas
WHERE size = 'M';

------------------------------------------------------------
-- 13. Display all pizza names where category = 'Chicken'
SELECT name
FROM pizza_types
WHERE category = 'Chicken';

------------------------------------------------------------
-- 14. Count the number of unique pizza types in pizza_types
SELECT COUNT(DISTINCT name) AS unique_pizza_types
FROM pizza_types;

------------------------------------------------------------
-- 15. List all pizzas (pizza_id, size, price)
SELECT pizza_id, size, price
FROM pizzas;

------------------------------------------------------------
-- 16. Find how many times 'bbq_ckn_m' pizza was ordered
SELECT COUNT(*) AS bbq_ckn_m_orders
FROM order_details
WHERE pizza_id = 'bbq_ckn_m';

------------------------------------------------------------
-- 17. Show distinct pizza sizes available
SELECT DISTINCT size
FROM pizzas
ORDER BY size ASC;

------------------------------------------------------------
-- 18. Count how many pizzas were ordered in order_details
SELECT SUM(quantity) AS total_no_of_pizzas
FROM order_details;

------------------------------------------------------------
-- 19. List order_ids where exactly 3 pizzas were ordered
SELECT order_id
FROM order_details
GROUP BY order_id
HAVING SUM(quantity) = 3;

------------------------------------------------------------
-- 20. Show all ingredients for 'The Barbecue Chicken Pizza'
SELECT ingredients
FROM pizza_types
WHERE name = 'The Barbecue Chicken Pizza';
