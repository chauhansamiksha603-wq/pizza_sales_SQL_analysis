-- Use the PIZZAHUT database
USE PIZZAHUT;

------------------------------------------------------------
-- 21. Join orders and order_details to display order_id, date, and pizza_id
SELECT 
    orders.order_id, order_details.pizza_id, orders.order_date
FROM
    orders
JOIN
    order_details ON orders.order_id = order_details.order_id;

------------------------------------------------------------
-- 22. Show all pizzas with their full name by joining pizzas and pizza_types
SELECT 
    pizza_types.name,
    pizzas.pizza_type_id,
    pizzas.size,
    pizzas.pizza_id,
    pizzas.price
FROM
    pizzas
JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id;

------------------------------------------------------------
-- 23. Find the number of pizzas sold per category
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS total_ordered_pizzas
FROM
    order_details
JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category;

------------------------------------------------------------
-- 24. Calculate the total revenue (quantity × price) from all orders
SELECT 
    SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM
    order_details
JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id;

------------------------------------------------------------
-- 25. Show the top 5 revenue-generating pizza types
SELECT 
    pizzas.pizza_type_id,
    SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM
    pizzas
JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.pizza_type_id
ORDER BY total_revenue DESC
LIMIT 5;

------------------------------------------------------------
-- 26. Find the most frequently ordered pizza_id
SELECT 
    pizza_id, SUM(quantity) AS total_ordered_pizzas
FROM
    order_details
GROUP BY pizza_id
ORDER BY total_ordered_pizzas DESC
LIMIT 1;

------------------------------------------------------------
-- 27. Show the average order value (per order)
SELECT 
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM
    (SELECT 
        order_id, SUM(quantity * price) AS order_total
    FROM
        order_details
    JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
    GROUP BY order_id) AS subquery;

------------------------------------------------------------
-- 28. Calculate total sales (revenue) for each pizza size
SELECT 
    pizzas.size,
    SUM(pizzas.price * order_details.quantity) AS total_revenue
FROM
    order_details
JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY total_revenue DESC;

------------------------------------------------------------
-- 29. Find the number of orders placed each day
SELECT 
    order_date, COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY order_date
ORDER BY order_date;

------------------------------------------------------------
-- 30. Identify the day with the maximum number of orders
SELECT 
    order_date, COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY order_date
ORDER BY total_orders DESC
LIMIT 1;

------------------------------------------------------------
-- 31. Find the pizza type with the lowest revenue
SELECT 
    pizzas.pizza_type_id,
    SUM(pizzas.price * order_details.quantity) AS total_revenue
FROM
    order_details
JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.pizza_type_id
ORDER BY total_revenue ASC
LIMIT 1;

------------------------------------------------------------
-- 32. Count the number of pizzas ordered in January 2015
SELECT 
    SUM(order_details.quantity) AS total_pizzas_jan2015
FROM
    order_details
JOIN
    orders ON order_details.order_id = orders.order_id
WHERE
    orders.order_date BETWEEN '2015-01-01' AND '2015-01-31';

------------------------------------------------------------
-- 33. Show monthly revenue totals
SELECT 
    DATE_FORMAT(orders.order_date, '%Y-%m') AS month,
    SUM(order_details.quantity * pizzas.price) AS total_monthly_revenue
FROM
    order_details
JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN
    orders ON order_details.order_id = orders.order_id
GROUP BY month
ORDER BY month;

------------------------------------------------------------
-- 34. Find the top 3 categories with the highest sales
SELECT 
    pizza_types.category,
    SUM(pizzas.price * order_details.quantity) AS total_sales
FROM
    pizzas
JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY total_sales DESC
LIMIT 3;

------------------------------------------------------------
-- 35. Find the average number of pizzas per order
SELECT 
    AVG(total_pizzas) AS avg_pizza_per_orders
FROM
    (SELECT 
        order_id, SUM(quantity) AS total_pizzas
    FROM
        order_details
    GROUP BY order_id) AS order_totals;

------------------------------------------------------------
-- 36. Show the largest single order by total quantity
SELECT 
    SUM(quantity) AS total_quantity, order_id
FROM
    order_details
GROUP BY order_id
ORDER BY total_quantity DESC
LIMIT 1;

------------------------------------------------------------
-- 37. List orders where more than 5 pizzas were bought
SELECT 
    SUM(quantity) AS total_quantity, order_id
FROM
    order_details
GROUP BY order_id
HAVING total_quantity > 5
ORDER BY total_quantity DESC;

------------------------------------------------------------
-- 38. Calculate the revenue for each order
SELECT 
    order_details.order_id,
    SUM(order_details.quantity * pizzas.price) AS revenue_each_order
FROM
    order_details
JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY order_details.order_id;

------------------------------------------------------------
-- 39. Show the top 10 orders with the highest revenue
SELECT 
    order_details.order_id,
    SUM(order_details.quantity * pizzas.price) AS revenue_each_order
FROM
    order_details
JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY order_details.order_id
ORDER BY revenue_each_order DESC
LIMIT 10;

------------------------------------------------------------
-- 40. Find the least ordered pizza type
SELECT 
    pizzas.pizza_type_id,
    SUM(order_details.quantity) AS least_order_pizza_type
FROM
    pizzas
JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.pizza_type_id
ORDER BY least_order_pizza_type ASC
LIMIT 1;
