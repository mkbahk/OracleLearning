SELECT * 
FROM countries;
---
INSERT INTO countries
VALUES ('KR', 'South Korea',3);
---
SELECT *
FROM countries 
WHERE country_id = 'KR';
---
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('KP', 'North Korea', 3);
---
SELECT * 
FROM countries
WHERE country_name LIKE '%Korea';
---
SELECT * 
FROM departments;
---
INSERT INTO departments
VALUES (280, 'Testing', 200, 1700);
---
INSERT INTO departments (department_id, department_name, location_id)
VALUES (290, 'Data Analytics', 1700);
---
INSERT INTO jobs
VALUES ('IT DS', 'Data Scientist', 10000, 20000);
---
SELECT * 
FROM jobs;
---
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('IT DA', 'Data Analyst', 10000, 20000);
---
COMMIT;
---
UPDATE countries
SET country_name = 'Democratic People''s Republic of Korea'
WHERE country_id = 'KP';
---
SELECT *
FROM countries
WHERE country_id = 'KP';
---
COMMIT;
---
UPDATE countries
SET country_name = 'Republic of Korea'
WHERE country_id = 'KR';
---
SELECT * 
FROM countries;
WHERE country_id = 'KR';
---
COMMIT;
---
SELECT *
FROM departments;
---
UPDATE departments
SET department_name = 'IT Testing'
WHERE department_id = 280;
---
SELECT * 
FROM departments;
---
UPDATE departments
SET department_name = 'IT Quality Assurance'
WHERE department_id = 280;
---
SELECT * 
FROM departments;
---
SELECT *
FROM jobs;
---
UPDATE jobs
SET job_id = 'IT QA', job_title = 'Quality Assurance'
WHERE job_id = 'IT DS';
---
SELECT *
FROM jobs;
---
COMMIT;
---
DELETE
FROM countries
WHERE country_id = 'KP';
---
DELETE
FROM countries
WHERE country_id = 'KR';
---
SELECT *
FROM countries;
---
COMMIT;
---
SELECT * 
FROM departments;
---
DELETE
FROM departments
WHERE department_id BETWEEN 280 AND 290;
---
SELECT * 
FROM departments;
---
COMMIT;
---
SELECT *
FROM jobs
WHERE job_id LIKE 'IT%';
---
SELECT *
FROM jobs
WHERE job_id = 'IT DA' OR job_id = 'IT QA';
---
DELETE
FROM jobs
WHERE job_id = 'IT DA' OR job_id = 'IT QA';
---
SELECT *
FROM jobs
WHERE job_id = 'IT DA' OR job_id = 'IT QA';
---
COMMIT;
---
SELECT *
FROM countries;
---
INSERT INTO countries
VALUES ('AT', 'Austria', 1);
INSERT INTO countries
VALUES ('NO', 'Norway', 1);
INSERT INTO countries
VALUES ('ID', 'Indonesia', 3);
INSERT INTO countries
VALUES ('TR', 'Turkey', 4);
---
SELECT *
FROM countries;
---
rollback;
---
COMMIT;
---
SELECT *
FROM departments;
---
INSERT INTO departments
VALUES (280, 'ADvertising', 200, 1700);
---
INSERT INTO departments
VALUES (290, 'Sales Support', 145, 1700);
---
INSERT INTO departments (department_id, department_name, location_id)
VALUES (300, 'Education', 1700);
---
INSERT INTO departments
VALUES (310, 'ADvertising', NULL, 1700);
---
UPDATE departments
SET department_name = 'E-Commerce'
WHERE department_id = 310;
---
SELECT *
FROM departments;
---
COMMIT;
---
SELECT *
FROM jobs;
---
INSERT INTO jobs
VALUES ('ADV', 'Advisor', 10000, 20000);
---
INSERT INTO jobs
VALUES ('IT ENG', 'Engineer', 8000, 15000);
---
INSERT INTO jobs
VALUES ('IT RES', 'Researcher', 12000, 22000);
---
COMMIT;
---
UPDATE departments
SET location_id = 2000
WHERE department_id = 280;
---
SELECT *
FROM departments
WHERE department_id IN (280, 290, 300, 310);
---
UPDATE departments
SET location_id = 2000
WHERE department_id IN (280, 290, 300, 310);
---
UPDATE departments
SET manager_id = 102
WHERE department_id IN (300, 310);
---
SELECT * 
FROM departments
WHERE department_id IN (300, 310);
---
SELECT *
FROM jobs;
---
UPDATE jobs
SET min_salary=12000, max_salary=2200
WHERE job_id = 'ADV';
---
UPDATE jobs
SET max_salary=16000
WHERE job_id = 'IT ENG';
---
UPDATE jobs
SET job_title='Research Engineer', max_salary=24000
WHERE job_id = 'IT RES';
---
COMMIT;
---
SELECT * 
FROM countries
WHERE country_id IN ('AT', 'NO', 'ID', 'TR');
---
DELETE FROM countries
WHERE country_id IN ('AT', 'NO', 'ID', 'TR');
---
SELECT * 
FROM departments
WHERE department_id BETWEEN 280 AND 310;
---
DELETE FROM departments
WHERE department_id BETWEEN 280 AND 310;
---
SELECT * 
FROM jobs
WHERE job_id IN ('ADV', 'IT ENG', 'IT RES');
---
DELETE FROM jobs
WHERE job_id IN ('ADV', 'IT ENG', 'IT RES');
---
COMMIT;
