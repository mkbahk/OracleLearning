SELECT COUNT(salary)
FROM employees;

SELECT COUNT(manager_id)
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

SELECT salary, 
    manager_id, 
    commission_pct
FROM employees;

SELECT COUNT(*)
FROM employees;

SELECT COUNT(*), SUM(salary), AVG(salary)
FROM employees;

SELECT SUM(salary) / COUNT(*)
FROM employees;

SELECT first_name, salary,
    SUM(salary) OVER (ORDER BY first_name)
FROM employees;

SELECT first_name, salary,
    SUM(salary) OVER (ORDER BY first_name)
FROM employees;

SELECT MIN(salary), MAX(salary)
FROM employees;

SELECT MIN(first_name), MAX(first_name)
FROM employees;

SELECT STDDEV(salary), VARIANCE(salary)
FROM employees;

SELECT first_name, salary, 
    STDDEV(salary) OVER (ORDER BY first_name)
FROM employees
WHERE department_id = 50;

SELECT job_id, COUNT(salary), SUM(salary), AVG(salary)
FROM employees
GROUP BY job_id, department_id;

SELECT job_id, department_id, COUNT(salary), SUM(salary), AVG(salary)
FROM employees
WHERE department_id = 50
GROUP BY job_id, department_id;

SELECT job_id, department_id, COUNT(salary), SUM(salary), AVG(salary)
FROM employees
GROUP BY job_id, department_id;

SELECT department_id, COUNT(salary), MIN(salary), MAX(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(salary), MIN(salary), MAX(salary)
FROM employees
WHERE hire_date > '20070101'
GROUP BY department_id;

SELECT country_id, COUNT(country_id)
FROM locations
GROUP BY country_id
ORDER BY country_id;

SELECT job_id, department_id,
    SUM(salary), AVG(salary)
FROM employees
WHERE department_id BETWEEN 50 AND 100
GROUP BY job_id, department_id
ORDER BY job_id;

SELECT department_id, manager_id,
    COUNT(salary), SUM(salary), AVG(salary)
FROM employees
WHERE department_id = 50
GROUP BY department_id, manager_id
ORDER BY manager_id;


SELECT manager_id, department_id, job_id,
    COUNT(salary), SUM(salary), MIN(salary), MAX(salary)
FROM employees
WHERE manager_id IN (100, 101)
GROUP BY manager_id, department_id, job_id
ORDER BY manager_id; department_id;

# WHERE절은 GROUP화전, HAVING절은 GROUP화후 집계결과에 적용
# WHERE절은 그룹함수를 사욜할 수 없다.

SELECT job_id, SUM(salary), AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) > 10000;

SELECT department_id, MIN(salary), MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 7000;

SELECT country_id, COUNT(country_id)
FROM locations
GROUP BY country_id
HAVING COUNT(country_id) > 2 
ORDER BY country_id;

SELECT job_id, department_id, SUM(salary), AVG(salary)
FROM employees
WHERE department_id BETWEEN 50 AND 100
GROUP by job_id, department_id
HAVING AVG(salary) > 9000
ORDER BY job_id;

SELECT manager_id, department_id, job_id,
       SUM(salary), MIN(salary), MAX(salary)
FROM employees
WHERE manager_id IN (100, 101)
GROUP BY manager_id, department_id, job_id
HAVING SUM(salary) BETWEEN 10000 AND 40000
ORDER BY manager_id, department_id;

SELECT COUNT(*)
FROM employees
WHERE salary >= 8000;

SELECT COUNT(*)
FROM employees
WHERE hire_date > '20070101';

SELECT SUM(max_salary), AVG(max_salary)
FROM jobs;

SELECT SUM(salary), AVG(salary)
FROM employees
WHERE job_id = 'IT_PROG';

SELECT first_name, salary, 
    AVG(NVL(commission_pct,0)) OVER (ORDER BY first_name)
FROM employees
WHERE department_id BETWEEN 50 AND 80;

SELECT MIN(max_salary), MAX(max_salary)
FROM jobs;

SELECT MIN(max_salary), MAX(max_salary)
FROM jobs
WHERE job_title = 'Programmer';

SELECT MIN(hire_date), MAX(hire_date)
FROM employees
WHERE department_id = 50;

SELECT first_name, salary, VARIANCE(salary) OVER (ORDER BY hire_date)
FROM employees
WHERE department_id = 100;

SELECT job_id, MIN(salary), MAX(salary)
FROM employees
WHERE hire_date BETWEEN '20040101' AND '20061231'
GROUP BY job_id;


SELECT department_id, job_id, SUM(salary), MIN(salary), MAX(salary)
FROM employees
WHERE department_id IN (50, 80)
GROUP BY department_id, job_id
ORDER BY job_id;

SELECT department_id, job_id, MIN(salary), MAX(salary), AVG(salary)
FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) >= 12000
ORDER BY department_id;
