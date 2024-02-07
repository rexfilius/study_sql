
USE coffee_store;
SHOW TABLES;

DESCRIBE products;
DESCRIBE customers;
DESCRIBE orders;

SELECT*FROM products;
SELECT*FROM customers;
SELECT*FROM orders;

-- select a column/columns from a table
SELECT last_name FROM customers;
SELECT last_name, phone_number FROM customers;

-- using the where clause
SELECT*FROM products WHERE coffee_origin = 'Brazil';
SELECT*FROM products WHERE coffee_origin = 'Brazil' AND price = 3.00;
SELECT*FROM products WHERE coffee_origin = 'Brazil' OR price = 3.00;
SELECT*FROM products WHERE price != 3.00;
SELECT*FROM products WHERE name < 'D';

SELECT*FROM customers WHERE phone_number IS NULL;
SELECT*FROM customers WHERE phone_number IS NOT NULL;

SELECT*FROM customers WHERE last_name IN ('Taylor', 'Bluth', 'Armstrong');
SELECT*FROM customers WHERE last_name NOT IN ('Taylor', 'Bluth', 'Armstrong');

SELECT * FROM orders WHERE order_time BETWEEN '2023-01-01' AND '2023-01-31 23:59:59';
SELECT * FROM orders WHERE customer_id BETWEEN 5 AND 7;
SELECT * FROM customers WHERE last_name BETWEEN 'A' AND 'M';

/*
using the LIKE clause for pattern matching
'%' match any number of characters
'_' match just one character
*/
SELECT * FROM customers WHERE last_name LIKE 'W%';
SELECT * FROM customers WHERE last_name LIKE '%o%';
SELECT * FROM customers WHERE first_name LIKE '%o%';
SELECT * FROM customers WHERE first_name LIKE '_o_';
SELECT * FROM customers WHERE first_name LIKE '_o__';
-- since the search term is a number, it is more efficient using less than or equal to
SELECT * FROM products WHERE price LIKE '3%';

-- using ORDER BY clause
-- 'order by' clause always comes last in an sql query
SELECT * FROM products ORDER BY price DESC;
SELECT * FROM customers ORDER BY last_name DESC;
SELECT * FROM customers ORDER BY last_name, first_name;
SELECT * FROM customers WHERE last_name = 'Bluth' ORDER BY last_name, first_name;
SELECT * FROM orders ORDER BY order_time DESC;

-- using DISTINCT clause
SELECT coffee_origin FROM products;
SELECT DISTINCT coffee_origin FROM products;
SELECT DISTINCT coffee_origin, id FROM products;
SELECT DISTINCT coffee_origin, price FROM products;

SELECT DISTINCT customer_id FROM orders
WHERE order_time BETWEEN '2023-02-01' and '2023-02-28 23:59:59.999999'
ORDER BY customer_id;

SELECT DISTINCT customer_id, product_id FROM orders
WHERE order_time BETWEEN '2023-02-01' and '2023-02-28 23:59:59.999999'
ORDER BY customer_id;

-- using LIMIT
SELECT * FROM customers LIMIT 5;
SELECT * FROM customers LIMIT 5 OFFSET 5;

SELECT * FROM customers LIMIT 12, 3;
SELECT * FROM customers LIMIT 3 OFFSET 12;

SELECT * FROM customers LIMIT `row_count`;  -- only return row-count rows.
SELECT * FROM customers LIMIT `offset`, `row_count`;  -- return row_count rows, starting from row 5.
SELECT * FROM customers LIMIT `row_count` OFFSET `offset`;  -- same as above.

SELECT * FROM customers LIMIT 10 OFFSET 5;
SELECT * FROM customers ORDER BY last_name LIMIT 10;
