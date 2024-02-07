
CREATE DATABASE test;
USE test;
SHOW TABLES;

CREATE TABLE addresses (
id INT,
house_number INT,
city VARCHAR(20),
postcode VARCHAR(7)
);

CREATE TABLE people (
id INT,
first_name VARCHAR(20),
last_name VARCHAR(20),
address_id INT
);

CREATE TABLE pets (
id INT,
name VARCHAR(20),
species VARCHAR(20),
owner_id INT
);


DESCRIBE addresses;

-- add primary key to a table
ALTER TABLE addresses
ADD PRIMARY KEY (id);

-- remove primary key in a table
ALTER TABLE addresses
DROP PRIMARY KEY;

-- removing the primary key in a column still keeps the 'null' value at 'NO'
-- you have to modify it so the column can have null values
ALTER TABLE addresses
MODIFY id INT;


DESCRIBE people;

-- add a foreign key to a table
ALTER TABLE people
ADD CONSTRAINT FK_PeopleAddress
FOREIGN KEY (address_id) REFERENCES addresses(id);

-- remove a foreign key in a table
ALTER TABLE people
DROP FOREIGN KEY FK_PeopleAddress,
DROP INDEX FK_PeopleAddress;


DESCRIBE pets;

-- add a unique constraint to a column in a table
-- adding a unique constraint is a way to prevent duplicate values in a column
ALTER TABLE pets
ADD CONSTRAINT u_species UNIQUE (species);

-- remove a unique constraint
ALTER TABLE pets
DROP INDEX u_species;

-- renaming a column with specifying data type
ALTER TABLE pets
CHANGE species animal_type VARCHAR(20);

-- renaming a column
ALTER TABLE pets
RENAME COLUMN animal_type TO species;

-- changing the data type of a column
ALTER TABLE pets
MODIFY COLUMN species CHAR(15);







