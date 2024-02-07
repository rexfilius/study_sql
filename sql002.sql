
CREATE DATABASE example;
USE example;
SHOW TABLES;

CREATE TABLE test (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
age INT
);

DESCRIBE test;

-- deleting a table from a database
DROP TABLE test;

INSERT INTO test (name, age) VALUES('Ben', 19), ('Claire', 23), ('Simon', 28);

SELECT*FROM test;

-- delete the content of a table withouht having to drop it
TRUNCATE TABLE test;

