--- 107 �� ---
SELECT COUNT(*)
FROM employees;

--- 27�� ---
SELECT COUNT(*) 
FROM departments;

SELECT 107 * 27 
FROM dual;

---
--- Cartian Product(������ �Ǵ� ��ī��Ʈ �� 
---

SELECT * 
FROM employees, departments
ORDER BY employees.employee_id;

SELECT COUNT(*) 
FROM employees, departments;
---
--- Equi Join �Ǵ� Inner Join 
---
SELECT * 
FROM jobs, job_history
WHERE jobs.job_id = job_history.job_id;

SELECT * 
FROM countries;

SELECT * 
FROM locations;

SELECT *
FROM countries, locations
WHERE countries.country_id = locations.country_id;

SELECT *
FROM countries C, locations L
WHERE C.country_id = L.country_id;

--- �̸� ���� 
SELECT *
FROM countries AS C, locations AS L
WHERE C.country_id = L.country_id;

SELECT *
FROM employees E, departments D
WHERE E.department_id = D.department_id;

--- �񵿵� ����(Non Equi Join) 
SELECT * 
FROM employees E, jobs J
WHERE E.salary BETWEEN J.min_salary AND J.max_salary;

SELECT COUNT(*) 
FROM employees E, jobs J
WHERE E.salary BETWEEN J.min_salary AND J.max_salary;

SELECT E.first_name, E.hire_date, H.start_date, H.end_date
FROM employees E, job_history H
WHERE E.hire_date BETWEEN h.start_date AND H.end_date;

--- ORA-00904: "H"."end_date": �������� �ĺ���, �����޼��������� ""�� �ٿ���
--- ��𼱰� �� �� ������ 
SELECT "E"."first_name", "E"."hire_date", "H"."start_date", "H"."end_date"
FROM employees E, job_history H
WHERE E.hire_date BETWEEN h.start_date AND H.end_date;


--- �ܺ� ����(Outer Join)
SELECT *
FROM jobs J, job_history H
WHERE J.job_id = H.job_id;

--- (+)�� ������ �κ��� �����޶�� �ǹ�
SELECT *
FROM jobs J, job_history H
WHERE J.job_id = H.job_id(+);

--- ���� ������ ����
SELECT *
FROM jobs J, job_history H
WHERE J.job_id(+) AND H.job_id;

SELECT *
FROM countries C, locations L
WHERE C.country_id = L.country_id(+);

SELECT *
FROM employees E, departments D
WHERE E.department_id(+) = D.department_id
ORDER BY employee_id;

--- Self Join
SELECT *
FROM employees;

---employee_id�� manager_id�� ���� ��������
SELECT E.first_name, E.last_name, M.first_name, M.last_name
FROM employees E, employees M
WHERE E.manager_id = M.employee_id;

---�ǽ�
SELECT C.country_name, L.state_province, L.street_address
FROM countries C, locations L
WHERE C.country_id = L.country_id;

--- ORA-00918: ���� ���ǰ� �ָ��մϴ�
--- 00918. 00000 -  "column ambiguously defined"
SELECT job_id, job_title, start_date, end_date
FROM jobs J, job_history H
WHERE J.job_id = H.job_id;

SELECT J.job_id, J.job_title, H.start_date, H.end_date
FROM jobs J, job_history H
WHERE J.job_id = H.job_id;

---3�� ���̺� ����
SELECT E.first_name, E.last_name, D.department_name, J.job_title
FROM employees E, departments D, jobs J
WHERE E.department_id = D.department_id AND E.job_id = J.job_id;

SELECT C.country_id, C.country_name, L.city
FROM countries C, locations L
WHERE C.country_id = L.country_id(+);

SELECT E.employee_id, E.first_name, E.last_name, D.department_name
FROM employees E, departments D
WHERE E.department_id = D.department_id(+)
ORDER BY E.employee_id;

SELECT E.first_name || ' ' || E.last_name employeee,
    M.first_name || ' ' || M.last_name manager
FROM employees E, employees M
WHERE E.manager_id = M.employee_id
ORDER BY E.employee_id;

