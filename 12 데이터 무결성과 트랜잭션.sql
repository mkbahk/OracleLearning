SELECT * 
FROM regions;
---
INSERT INTO regions
VALUES (3, 'Asia');
---
SELECT *
FROM countries;
---
INSERT INTO countries
VALUES ('AR', 'Argentina', 2);
---
SELECT *
FROM locations;
---
INSERT INTO locations
VALUES (1000, 'Street', 12345, 'Seoul', null, 'KR');
---
SELECT *
FROM departments;
---
INSERT INTO departments
VALUES (10, 'Admin', 200, 1700);
---
SELECT *
FROM employees;
---
INSERT INTO employees
VALUES (207, 'Moon-Kee', 'Bahk','mkbahk@megazone.com','+82-10-5367-5614', '2020/08/01','IT_PROG', 10000, NULL, NULL, NULL);
---
COMMIT;
---
SELECT *
FROM countries;
---
INSERT INTO countries
VALUES ('KR', 'South Korea', 5);
---
SELECT *
FROM locations;
---
INSERT INTO locations
VALUES (3300, 'Street', 12345, 'Seoul', null, 'KR');
---
INSERT INTO departments
VALUES (280, 'Testing', null, 3300);
---
SELECT * 
FROM employees;
---
INSERT INTO employees
VALUES (207, 'Moon-Kee', 'Bahk', 'mkbahk','010-3567-5614', '20/08/01',
'IT_QA', 10000, null, null, null);
---
SELECT *
FROM job_history;
---
INSERT INTO job_history
VALUES (300, '21/01/01', '21/10/01', 'IT_PROG', 300);
---
---유일키 제약사항
---
INSERT INTO employees
VALUES (207, 'Suan', 'Lee', 'SKING', '010-5367-5614', '21/01/01', 'IT_PROG', 1000, null, null, null);
---
INSERT INTO locations
VALUES (3300, 'Street', 12345, null, null, 'US');
---
SELECT *
FROM departments;
---
INSERT INTO departments
VALUES (280, null, null, 3300);
---
INSERT INTO employees
VALUES (207, 'Suan', 'Lee', null, '010-5367-5614', '21/01/01', 'IT_PROG', 1000, null, null, null);
---
INSERT INTO job_history
VALUES (200, null, '21/10,01', 'IT_PROG', 200);
---
INSERT INTO job_history
VALUES (200, '21/01/01', null, 'IT_PROG', 200);
---
INSERT INTO job_history
VALUES (200, '21/10/01', '21/01/01', 'IT_PROG', 200);
---
INSERT INTO employees
VALUES (400, 'Moon-Kee', 'Bahk', 'mkbahk', '010-5367-5614', '21/01/01', 'IT_PROG', 0, null, null, null);
---
--- Transaction ---
---

