select * from departments;
select department_id, department_name from departments;
select department_id as �μ�ID, department_name as �μ��̸� from departments;
select location_id from departments;
select distinct location_id from departments;

select department_id, department_name
from departments;

select department_id || department_name
from departments;

select 'Department of ' || department_name
from departments;

select 'Department of ' || department_name as �μ��̸�
from departments;


select first_name, last_name, salary + 500
from employees;

select first_name, last_name, salary - 500
from employees;

select first_name, last_name, salary * 1.1 as ����
from employees;

select first_name, last_name, salary / 1.2 as ����
from employees;

select * 
from countries;

select  country_id, country_name
from countries;

select  country_id as ����ID, country_name as ������
from countries;

select distinct region_id
from countries;

select country_name || country_id as ������
from countries;

select street_address, city
from locations;

select job_id as ����id, job_title as ������ 
from jobs;

select job_title, min_salary * 1.1 as �ּҿ���, max_salary * 1.1 as �ִ뿬��
from jobs;

select first_name || ' ' || last_name as �̸�
from employees;

select distinct job_id
from employees;


