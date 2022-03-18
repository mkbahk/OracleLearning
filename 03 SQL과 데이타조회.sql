select * from departments;
select department_id, department_name from departments;
select department_id as 부서ID, department_name as 부서이름 from departments;
select location_id from departments;
select distinct location_id from departments;

select department_id, department_name
from departments;

select department_id || department_name
from departments;

select 'Department of ' || department_name
from departments;

select 'Department of ' || department_name as 부서이름
from departments;


select first_name, last_name, salary + 500
from employees;

select first_name, last_name, salary - 500
from employees;

select first_name, last_name, salary * 1.1 as 증가
from employees;

select first_name, last_name, salary / 1.2 as 감소
from employees;

select * 
from countries;

select  country_id, country_name
from countries;

select  country_id as 국가ID, country_name as 국가명
from countries;

select distinct region_id
from countries;

select country_name || country_id as 국가명
from countries;

select street_address, city
from locations;

select job_id as 직업id, job_title as 직업명 
from jobs;

select job_title, min_salary * 1.1 as 최소연봉, max_salary * 1.1 as 최대연봉
from jobs;

select first_name || ' ' || last_name as 이름
from employees;

select distinct job_id
from employees;


