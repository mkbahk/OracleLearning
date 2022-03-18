SELECT 1
FROM dual;

SELECT phone_number
FROM employees
WHERE employee_id = '100';
    
SELECT * 
FROM employees
WHERE phone_number = (
    SELECT phone_number
    FROM employees
    WHERE employee_id = 100);

SELECT hire_date
FROM employees
WHERE email = 'SKING';
    
SELECT *
FROM employees
WHERE hire_date = (
    SELECT hire_date
    FROM employees
    WHERE email = 'SKING' );

SELECT hire_date
FROM employees
WHERE email = 'SKING';

SELECT *
FROM employees
WHERE hire_date < (
    SELECT hire_date
    FROM employees
    WHERE email = 'SKING'
    )
ORDER BY hire_date;

SELECT *
FROM employees
WHERE salary  >= (
    SELECT salary
    FROM employees
    WHERE hire_date = '06/01/03');

---���� �� ��������
-- IN / NOT IN ������
SELECT MAX(salary)
FROM employees
GROUP BY department_id;

---�� ������ ����� �Ʒ��� ���� ��ĥ �� �ִ�.
SELECT *
FROM employees
WHERE salary IN ( 8200, 6500, 12008, 24000, 11000, 10000, 7000, 4400, 13000, 9000, 12008, 14000 );

---���������� ����� �������κ�ȭ�� �� �ִٴ� ������ ����.
SELECT *
FROM employees
WHERE salary IN (
    SELECT MAX(salary)
    FROM employees
    GROUP BY department_id );



SELECT *
FROM employees
WHERE salary NOT IN (
    SELECT MAX(salary)
    FROM employees
    GROUP BY department_id );    

---EXISTS ������
SELECT *
FROM employees
WHERE EXISTS ( TRUE);

---���ǽ��� �����ϴ� ���� �ϳ��� ������ �����ϴ� ����.
SELECT *
FROM employees
WHERE EXISTS ( SELECT 1 FROM dual );


SELECT *
FROM employees
WHERE EXISTS ( 
    SELECT * 
    FROM employees
    WHERE employee_id = 100 );
    
    
---ANY
SELECT *
FROM employees
WHERE salary = ANY(6000, 10000, 12000);

---�������� ���� 6000�� �ƴ� ��� 10000, 12000�� �ǰ�, �׿ܵ� �ǰ�, �׷��� ��ü�� ����ϴ� �Ͱ� ���� ����� ��
SELECT *
FROM employees
WHERE salary != ANY(6000, 10000, 12000);

--- 6000���� ���� ��, 10000���� ���� ��, 12000���� ���� ��� ���� ����������� 12000�� ����
SELECT *
FROM employees
WHERE salary < ANY(6000, 10000, 12000)
ORDER BY salary;

---6000�� ����, 6000���� ū ���ǵ鸸 ���
SELECT *
FROM employees
WHERE salary > ANY(6000, 10000, 12000)
ORDER BY salary;

--- 12000�� ����
SELECT *
FROM employees
WHERE salary <= ANY(6000, 10000, 12000)
ORDER BY salary;

---��� ������ �����ؾ� ������ 6000���ϰ� ����
SELECT *
FROM employees
WHERE salary <= ALL (6000, 10000, 12000)
ORDER BY salary;

---6000��, 10000��, 12000�� �ƴ� �͵鸸 ���
SELECT *
FROM employees
WHERE salary <> ALL (6000, 10000, 12000)
ORDER BY salary;

---15000���ϰ� �� ��
SELECT *
FROM employees
WHERE salary < ANY (
    SELECT salary
    FROM employees
    WHERE hire_date > '08/01/01');

---
SELECT *
FROM employees
WHERE salary < ALL (
    SELECT salary
    FROM employees
    WHERE hire_date > '08/01/01');


---
SELECT *
FROM employees
WHERE salary > ANY (
    SELECT MAX(salary)
    FROM employees
    GROUP BY department_id );
    
SELECT *
FROM employees
WHERE salary > ALL (
    SELECT MAX(salary)
    FROM employees
    GROUP BY department_id );  
    
    
--- �ζ��� ��, ��ü���̺��� �ƴ϶� ������ ����� ���ؼ� �����ϴ� ȿ���� ��
SELECT *
FROM employees E, ( SELECT department_id
                    FROM departments
                    WHERE department_name = 'IT') D
WHERE E.department_id = D.department_id;


--- departments D���� avg_sal�� ��� �ζ��� �並 �����
SELECT department_id, AVG(salary) AS avg_sal
FROM employees
GROUP BY department_id;

SELECT E.last_name, E.salary, D.avg_sal
FROM employees E, ( SELECT department_id, AVG(salary) AS avg_sal
                    FROM employees
                    GROUP BY department_id ) D
WHERE E.department_id = D.department_id AND E.salary > D.avg_sal;


---SELECT �� �߰��� ���� ���� ����
SELECT department_name, (SELECT AVG(salary) FROM employees GROUP BY department_name)
FROM departments;

---WHERE������ sub-query��밡��

---FROM������ ����
SELECT ROWNUM, salary
FROM ( SELECT salary
       FROM employees
       ORDER BY salary DESC )
WHERE ROWNUM <= 10;
---
SELECT first_name, last_name, job_id, salary
FROM employees
WHERE department_id = ( SELECT department_id 
                        FROM departments
                        WHERE department_name = 'IT');

---
SELECT department_id, department_name
FROM departments
WHERE location_id = (SELECT location_id
                     FROM locations
                     WHERE state_province = 'California');
---
SELECT city, state_province, street_address
FROM locations
WHERE country_id IN (SELECT country_id
                    FROM countries
                    WHERE region_id = 3 );
---
SELECT first_name, last_name, job_id, salary
FROM employees
WHERE department_id IN ( SELECT department_id
                        FROM departments 
                        WHERE manager_Id IS NOT NULL );
---
SELECT department_id, department_name
FROM departments
WHERE location_id NOT IN ( SELECT location_id
                            FROM locations
                            WHERE city = 'Seattle');
---
SELECT city, state_province, street_address
FROM locations
WHERE country_id IN (SELECT country_id
                    FROM countries
                    WHERE region_id = ( SELECT region_id
                                        FROM regions
                                        WHERE region_name = 'Europe'));
