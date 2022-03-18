SELECT first_name, LOWER(first_name), UPPER(first_name), INITCAP(first_name)
FROM employees;

SELECT job_id, SUBSTR(job_id, 1, 2), SUBSTR(job_id, 4)
FROM employees;

SELECT job_id, REPLACE(job_id, 'MGR', 'MANAGER')
FROM employees;

SELECT job_id, REPLACE(job_id, 'PROG', 'PROGRAMMER')
FROM employees;

SELECT CONCAT(first_name, CONCAT(' ', last_name))
FROM employees;

SELECT first_name, LENGTH(first_name)
FROM employees;

SELECT first_name, INSTR(first_name, 'a')
FROM employees;

SELECT LPAD(first_name, 10, '*'), RPAD(first_name, 10, '*')
FROM employees;

SELECT job_id, LTRIM(job_id, 'A'), RTRIM(job_id, 'T')
FROM employees;

SELECT TRIM('   Moon-Kee   '), TRIM(' Ba hk')
FROM dual;

SELECT * 
FROM dual;

SELECT LOWER(job_title), UPPER(job_title)
FROM jobs;

SELECT SUBSTR(first_name,1,1), last_name
FROM employees;


SELECT job_id, REPLACE(job_id, 'REP', 'REPRESENTATIVE')
FROM employees;

SELECT CONCAT(SUBSTR(first_name,1,1), CONCAT(' ', last_name))
FROM employees;

SELECT LENGTH(first_name) + LENGTH(last_name)
FROM employees;

SELECT job_id, INSTR(job_id, 'A')
FROM employees;

SELECT city, LPAD(city, 15, '.'), RPAD(city, 15, '.')
FROM locations;

SELECT city, LTRIM(city, 'S'), RTRIM(city, 'e')
FROM locations;

