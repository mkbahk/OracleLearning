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

---다중 행 서브쿼리
-- IN / NOT IN 연산자
SELECT MAX(salary)
FROM employees
GROUP BY department_id;

---위 쿼리의 결과를 아래와 같이 펼칠 수 있다.
SELECT *
FROM employees
WHERE salary IN ( 8200, 6500, 12008, 24000, 11000, 10000, 7000, 4400, 13000, 9000, 12008, 14000 );

---서브쿼리의 결과는 동적으로변화할 수 있다눈 장점이 있음.
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

---EXISTS 연산자
SELECT *
FROM employees
WHERE EXISTS ( TRUE);

---조건식을 만족하는 것이 하나라도 있으면 만족하는 것임.
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

---같지않을 경우는 6000이 아닐 경우 10000, 12000도 되고, 그외도 되고, 그래서 전체를 출력하는 것과 같은 결과가 됨
SELECT *
FROM employees
WHERE salary != ANY(6000, 10000, 12000);

--- 6000보다 작은 것, 10000보다 작은 것, 12000보다 작은 모든 것을 출력했음으로 12000만 없음
SELECT *
FROM employees
WHERE salary < ANY(6000, 10000, 12000)
ORDER BY salary;

---6000은 없고, 6000보다 큰 조건들만 출력
SELECT *
FROM employees
WHERE salary > ANY(6000, 10000, 12000)
ORDER BY salary;

--- 12000도 보임
SELECT *
FROM employees
WHERE salary <= ANY(6000, 10000, 12000)
ORDER BY salary;

---모든 조건을 만족해야 함으로 6000이하가 나옴
SELECT *
FROM employees
WHERE salary <= ALL (6000, 10000, 12000)
ORDER BY salary;

---6000도, 10000도, 12000이 아닌 것들만 출력
SELECT *
FROM employees
WHERE salary <> ALL (6000, 10000, 12000)
ORDER BY salary;

---15000이하가 다 뜸
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
    
    
--- 인라인 뷰, 전체테이블이 아니라 선택의 결과에 대해서 조인하는 효과가 남
SELECT *
FROM employees E, ( SELECT department_id
                    FROM departments
                    WHERE department_name = 'IT') D
WHERE E.department_id = D.department_id;


--- departments D에는 avg_sal이 없어서 인라인 뷰를 사용함
SELECT department_id, AVG(salary) AS avg_sal
FROM employees
GROUP BY department_id;

SELECT E.last_name, E.salary, D.avg_sal
FROM employees E, ( SELECT department_id, AVG(salary) AS avg_sal
                    FROM employees
                    GROUP BY department_id ) D
WHERE E.department_id = D.department_id AND E.salary > D.avg_sal;


---SELECT 문 중간에 넣을 수도 있음
SELECT department_name, (SELECT AVG(salary) FROM employees GROUP BY department_name)
FROM departments;

---WHERE절에도 sub-query사용가능

---FROM절에도 들어가고
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
