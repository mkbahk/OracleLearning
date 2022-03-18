CREATE TABLE customers (
customer_id     number          NOT NULL    PRIMARY KEY,
first_name      varchar2(10)    NOT NULL,
last_name       varchar2(10)    NOT NULL,
email           varchar2(30),
phone_number    varchar2(20),
regist_date     date
);
---
DROP Table customers;
---
SELECT *
FROM customers;
---
INSERT INTO customers 
VALUES (1, 'Moon-Kee', 'Bahk', 'mkbahk@megazone.com', '010-5367-5614', '2022/03/11');
INSERT INTO customers 
VALUES (2, 'Doo-Woo', 'Ryu', 'dwryu@megazone.com', '010-5367-5615', '2022/03/12');
INSERT INTO customers 
VALUES (3, 'Kee-Berm', 'Bahk', 'kbbahk@megazone.com', '010-5367-5616', '2022/03/13');
INSERT INTO customers 
VALUES (4, 'Sang-Bong', 'Bahk', 'sbbahk@megazone.com', '010-5367-5617', '2022/03/14');
INSERT INTO customers 
VALUES (5, 'Young-Ja', 'Joo', 'yjjoo@megazone.com', '010-5367-5618', '2022/03/15');
---
ALTER TABLE customers
ADD ( gender varchar2(10));
---
ALTER TABLE customers
ADD (age number, dob date);
---
UPDATE customers
SET gender = 'male', age=20, dob='1968/02/15'
WHERE customer_id = 1;
---
UPDATE customers
SET gender = 'female', age=20, dob='1968/02/15'
WHERE customer_id = 3;
---
UPDATE customers
SET gender = 'female', age=30, dob='1968/02/15'
WHERE customer_id = 5;
---
ALTER TABLE customers
ADD CONSTRAINT UK_email
UNIQUE (email);
---
ALTER TABLE customers
ADD CONSTRAINT UK_phone
UNIQUE (phone_number);
---
ALTER TABLE customers
ADD CONSTRAINT CK_age
CHECK ( age > 0 AND age < 150);
---
COMMIT;
---
INSERT INTO customers 
VALUES (6, 'Young-Ja', 'Joo', 'yjjoo2@megazone.com', '010-5367-5619', '2022/03/15', 'female', 100, '1998/01/01');
---
ALTER TABLE customers
MODIFY (
first_name varchar2(30)
);
ALTER TABLE customers
MODIFY (
last_name varchar2(30)
);
ALTER TABLE customers
MODIFY (
email varchar2(30)
);
---
UPDATE customers
SET first_name = 'Steven Paul', gender = 'male', age = 50, dob = '50/10/01'
WHERE customer_id = 3;
---
ALTER TABLE customers
MODIFY (
age DEFAULT 1
);
---
UPDATE customers
SET first_name = 'william Henry', gender = 'male', age = 40, dob = '1989/01/01'
WHERE customer_id = 4;
---
INSERT INTO customers (customer_id, first_name, last_name, email)
VALUES (7, 'Lawrence Edward', 'Page', 'larry');
---
COMMIT;
---
SELECT *
FROM customers;
---
---열이름 변경
---
ALTER TABLE customers
RENAME COLUMN phone_number to phone;
---
ALTER TABLE customers
RENAME COLUMN gender to sex;
---
ALTER TABLE customers
RENAME COLUMN dob to date_of_birth;
---
ALTER TABLE customers
DROP COLUMN date_of_birth;
---
ALTER TABLE customers
DROP COLUMN age;
---
ALTER TABLE customers
DROP COLUMN sex;
---
ALTER TABLE customers
DROP CONStRAInt CK_age;
---
TRUNCATE TABLE customers;
---
DROP TABLE customers;