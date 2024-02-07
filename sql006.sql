
USE coffee_store;
 
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM customers;

-- Inner Join query
SELECT products.name, orders.order_time FROM orders
INNER JOIN products ON orders.product_id = products.id;
-- another way to write the query above using aliases
SELECT p.name, o.order_time FROM orders AS o
JOIN products p ON o.product_id = p.id;

-- ORDER and WHERE clause with a JOIN query
SELECT p.name, o.order_time FROM orders AS o
JOIN products p ON o.product_id = p.id
WHERE o.product_id = 5 ORDER BY o.order_time;

/*
-- Inner join syntax
SELECT <table name>.<column name>, ... FROM <table 1>
JOIN <table 2> ON <table 1>.<column name> = <table 2>.<column name>
WHERE clause, if needed
ORDER BY clause, if needed;
*/

UPDATE orders
SET customer_id = Null WHERE id IN (1, 3, 5);

-- Left Join query
-- <tableName>.* means you want all the columns in the table
SELECT o.*, c.* FROM orders o
LEFT JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_time;

SELECT o.*, c.* FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
ORDER BY c.id;

-- Right Join query
SELECT o.*, c.* FROM customers c
RIGHT JOIN orders o ON o.customer_id = c.id
ORDER BY o.id;

SELECT o.*, c.* FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_time;

-- note that Left Join is better to use 'cause a left and right join
-- are mirror opposites and switching things can make them
-- give the same results. Some DBs do not offer right join and 
-- inner join are the most popular type of join

-- joining more than two tables
SELECT p.name, p.price, c.first_name, c.last_name, o.order_time FROM products p
JOIN orders o ON p.id = o.product_id
JOIN customers c ON c.id = o.customer_id
WHERE c.last_name = 'Martin'
ORDER BY o.order_time;


