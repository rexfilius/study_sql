SHOW DATABASES;

CREATE DATABASE coffee_store;
USE coffee_store;
SHOW TABLES;

CREATE TABLE products (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
price DECIMAL(3,2)
);

CREATE TABLE customers (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
gender ENUM('M','F'),
phone_number VARCHAR(11)
);

CREATE TABLE orders (
id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
customer_id INT,
order_time DATETIME,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- DESCRIBE command is used to examine the columns of a table
DESCRIBE products;

-- adding a column to an existing table
ALTER TABLE products
ADD COLUMN coffee_origin VARCHAR(30);

-- removing a column in an existing table
ALTER TABLE products
DROP COLUMN coffee_origin;



