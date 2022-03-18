select *
from employees
where employee_id = 110;

select *
from employees
where employee_id <> 110;

select *
from employees
where employee_id != 110;

select *
from employees
where employee_id < 110;

select *
from employees
where employee_id > 110;

select *
from employees
where employee_id <= 110;


select *
from employees
where employee_id >= 110;


select *
from employees
where employee_id = 120 and employee_id <= 130;

select *
from employees
where salary >= 10000 and salary <= 12000;

select *
from employees
where manager_id = 100 or manager_id = 120;


select *
from employees
where last_name = 'King' or last_name = 'Smith';

select *
from employees
where not department_id = 50;

SELECT *
FROM employees
WHERE NOT department_id = 50 AND NOT department_id =80;

SELECT *
FROM employees
WHERE first_name = 'David';

SELECT *
FROM jobs
WHERE min_salary = 4000;

SELECT *
FROM jobs
WHERE min_salary > 8000;


SELECT *
FROM jobs
WHERE max_salary <= 10000;


SELECT *
FROM jobs
WHERE min_salary  >= 4000 AND max_salary <= 10000;

SELECT *
FROM employees
WHERE job_id = 'IT_PROG' AND salary > 5000;