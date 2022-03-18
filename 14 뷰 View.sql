SELECT *
FROM emp_details_view;
---
SELECT first_name, last_name, salary, department_name, job_title
FROM emp_details_view;
---
SELECT * 
FROM employees;
---
CREATE OR REPLACE VIEW emp_view
AS
    SELECT employee_id, first_name, last_name, email
    FROM employees;
---
SELECT *
FROM emp_view;
---
CREATE OR REPLACE VIEW new_employee_view
AS
    SELECT employee_id, first_name, last_name, email, hire_date, job_id
    FROM employees
    WHERE employee_id > 206;
---
SELECT *
FROM new_employee_view;
---
INSERT INTO new_employee_view
VALUES (208, 'Jeesoo', 'Youn', 'jsyoun@megazone.com', '21/01/01', 'IT_PROG');
---
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."NEW_EMPLOYEE_VIEW" ("EMPLOYEE_ID", "FIRST_NAME", "LAST_NAME", "EMAIL", "HIRE_DATE", "JOB_ID") AS 
SELECT employee_id, first_name, last_name, email, hire_date, job_id
  FROM employees
  WHERE employee_id > 206;
---
DELETE new_employee_view
WHERE employee_id = 208;
---
SELECT * 
FROM new_employee_view;
---
DROP VIEW emp_view;
---
DROP VIEW new_employee_view;
---
CREATE OR REPLACE VIEW salary_order_view
AS
    SELECT first_name, last_name, job_id, salary
    FROM employees
    ORDER BY salary DESC
    WITH READ ONLY;
---
SELECT *
FROM salary_order_view;
---
INSERT INTO salary_order_view
VALUES ('Jeesoo', 'Youn', 'IT_PROG', 10000);
---
CREATE OR REPLACE VIEW job_salary_view
AS
    SELECT job_id, AVG(salary) sum_salary, MIN(salary) min_salary, MAX(salary) max_salary
    FROM employees
    GROUP BY job_id
    ORDER BY AVG(salary)
    WITH READ ONLY;
---
SELECT *
FROM job_salary_view;
---에러발생, 권한없음->SYSTEM 계정에서 수행
CREATE MATERIALIZED VIEW country_location_view
    BUILD DEFERRED
    AS
        SELECT C.country_name, L.state_province, L.street_address
        FROM HR.countries C, HR.locations L
        WHERE C.country_id = L.country_id;
---
---십습
SELECT employee_id, first_name, last_name, email, hire_date, job_id
FROM employees
WHERE hire_date BETWEEN '07/01/01' AND '07/12/31';
---
CREATE OR REPLACE VIEW employee_07_view
AS
    SELECT employee_id, first_name, last_name, email, hire_date, job_id
    FROM employees
    WHERE hire_date BETWEEN '07/01/01' AND '07/12/31';
---
SELECT *
FROM employee_07_view;
---
SELECT department_id, job_id, AVG(salary) salary_avg
FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) > 9000
ORDER BY salary_avg DESC;
---
CREATE OR REPLACE VIEW high_salary_view
AS
    SELECT department_id, job_id, AVG(salary) salary_avg
    FROM employees
    GROUP BY department_id, job_id
    HAVING AVG(salary) > 9000
    ORDER BY salary_avg DESC
WITH READ ONLY;
---
SELECT * 
FROM high_salary_view;
---
SELECT  E.department_id,
        E.first_name || ' ' || E.last_name employee,
        M.first_name || ' ' || M.last_name manager
FROM employees E, employees M
WHERE E.manager_id = M.employee_id
ORDER BY E.department_id;
---
CREATE OR REPLACE VIEW employee_manager_view
AS
    SELECT  E.department_id,
            E.first_name || ' ' || E.last_name employee,
            M.first_name || ' ' || M.last_name manager
    FROM employees E, employees M
    WHERE E.manager_id = M.employee_id
    ORDER BY E.department_id
WITH READ ONLY;
---
SELECT *
FROM employee_manager_view;
---

