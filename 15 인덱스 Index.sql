SELECT *
FROM user_indexes;
---
SELECT *
FROM user_tables;
---
SELECT *
FROM user_views;
---
SELECT *
FROM user_indexes
WHERE table_name = 'EMPLOYEES';
---
SELECT *
FROM user_ind_columns;
---
SELECT *
FROM user_ind_columns
WHERE table_name = 'EMPLOYEES';
---
SELECT *
FROM employees;
---
SELECT *
FROM employees
WHERE employee_id = 100;
---
SELECT *
FROM employees
WHERE first_name = 'Steven';
---
CREATE TABLE customers (
    customer_id     number          NOT NULL    PRIMARY KEY,
    first_name      varchar2(20)    NOT NULL,
    last_name       varchar2(10)    NOT NULL,
    email           varchar2(10),
    phone_number    varchar2(20),
    regist_date     date  
);
---
INSERT INTO customers
VALUES (1, 'Suan', 'Lee', 'suan', '010-1234-5678', '21/01/01');
---
INSERT INTO customers
VALUES (2, 'Elon', 'Musk', 'elon', '010-567-5678', '21/02/01');
---
INSERT INTO customers
VALUES (3, 'Steve', 'Jobs', 'steve', '010-789-5678', '21/03/01');
---
INSERT INTO customers
VALUES (4, 'Bill', 'Gates', 'bill', '010-1011-5678', '21/04/01');
---
INSERT INTO customers
VALUES (5, 'Mark', 'Zuckerberg', 'mark', '010-1112-5678', '21/05/01');
---
SELECT *
FROM customers;
---
SELECT *
FROM user_indexes
WHERE table_name = 'CUSTOMERS';
---
SELECT *
FROM customers
WHERE customer_id = 5;
---
CREATE INDEX regist_data_idx
ON customers (regist_date);
---
SELECT *
FROM user_indexes
WHERE table_name = 'CUSTOMERS';
---
SELECT *
FROM customers
WHERE regist_date = '21/01/01';
---
CREATE INDEX name_idx
ON customers(first_name, last_name);
---
SELECT *
FROM user_indexes
WHERE table_name = 'CUSTOMERS';
---
SELECT *
FROM customers
WHERE first_name like 'Bill%' AND last_name like 'Gates%';
---
CREATE UNIQUE INDEX email_idx
ON customers (email);
---
SELECT *
FROM user_indexes
WHERE table_name =  'CUSTOMERS';
---
SELECT * 
FROM customers
WHERE email = 'suan';
---
CREATE UNIQUE INDEX phone_idx
ON customers (phone_number);
---
SELECT *
FROM user_indexes
WHERE table_name = 'CUSTOMERS';
---
SELECT *
FROM customers
WHERE phone_number =  '010-1234-5678';
---
SELECT *
FROM user_indexes
WHERE table_name = 'CUSTOMERS';
---
DROP INDEX regist_data_idx;
DROP INDEX name_idx;
DROP INDEX email_idx;
DROP INDEX phone_idx;
---
SELECT *
FROM user_indexes
WHERE table_name = 'CUSTOMERS';
---
DROP TABLE customers;