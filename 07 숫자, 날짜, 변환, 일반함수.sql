SELECT * 
FROM employees;

SELECT salary, salary/21, CEIL(salary/21), FLOOR(salary/21)
FROM employees;

SELECT  salary, salary/21, 
        ROUND(salary/21), ROUND(salary/21, 2), ROUND(salary/21, -1), 
        TRUNC(salary/21), TRUNC(salary/21, 2), TRUNC(salary/21, -1)
FROM employees;

SELECT salary, salary/21, MOD(salary, 21)
FROM employees;

SELECT SIGN(-123), SIGN(0), SIGN(123)
FROM dual;

SELECT POWER(2, 3), SQRT(4)
FROM dual;

SELECT SYSDATE, SYSDATE + 1, SYSDATE -1
FROM dual;

SELECT SYSDATE, hire_date, MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees;

SELECT hire_date, ADD_MONTHS(hire_date, 2), ADD_MONTHS(hire_date, -2)
FROM employees;

SELECT  hire_date, NEXT_DAY(hire_date, 3), NEXT_DAY(hire_date, '수요일'), LAST_DAY(hire_date)
FROM employees;

SELECT  hire_date, 
        ROUND(hire_date, 'YEAR'), 
        ROUND(hire_date, 'MONTH'), 
        TRUNC(hire_date, 'YEAR'),
        TRUNC(hire_date, 'MONTH')
FROM employees;

SELECT 1 + 2
FROM dual;

SELECT 1 + '2'
FROM dual;

#CC-세기, AD-서기, Q-분기
SELECT TO_CHAR(SYSDATE, 'CC AD Q')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD W DAY Q')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" HH24:MI:SS PM')
FROM dual;

SELECT TO_CHAR(salary, '9999999')
FROM employees;

SELECT TO_CHAR(salary, '09999999')
FROM employees;

SELECT TO_CHAR(salary, '$9999999')
FROM employees;

SELECT TO_CHAR(salary, '0$9999999')
FROM employees;

SELECT TO_CHAR(salary, '$09999999')
FROM employees;

SELECT TO_CHAR(salary, 'L9999999')
FROM employees;

SELECT TO_CHAR(salary, '$999,999,999.99')
FROM employees;

SELECT TO_NUMBER('123')
FROM dual;

SELECT TO_NUMBER('123.456')
FROM dual;

SELECT TO_NUMBER('ABC')
FROM dual;

SELECT TO_DATE('20210909', 'YYMMDD')
FROM dual;

SELECT department_name, manager_id
FROM departments;

SELECT  department_name, 
        NVL(manager_id, 100)
FROM departments;

SELECT state_province
FROM locations
ORDER BY state_province;

SELECT NVL(state_province, 'None')
FROM locations
ORDER BY state_province;

SELECT department_name,
        NVL2(manager_id, '관리자없음', '관리자 있음')
FROM departments;

SELECT city, NVL2(state_province, '주소있음', '주소없음')
FROM locations
ORDER BY state_province;

SELECT job_title, min_salary,
        DECODE(min_salary, 2500, min_salary * 1.1, min_salary)
FROM jobs;

SELECT job_title, max_salary,
        DECODE(max_salary, 40000, max_salary * 0.9, max_salary)
FROM jobs;

SELECT job_title,
        min_salary,
        CASE
            WHEN min_salary < 4000 THEN min_salary * 1.2
            WHEN min_salary BETWEEN 4000 AND 6000 THEN min_salary * 1.1
            ELSE min_salary
        END AS 최소급여변경
FROM jobs;

SELECT first_name AS 이름, salary AS 월급,
    RANK() OVER (ORDER BY salary DESC) AS 랭크,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS 덴스랭크,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS 로넘버
FROM employees;

SELECT first_name 이름, salary 월급,
    RANK() OVER (ORDER BY salary DESC)  랭크,
    DENSE_RANK() OVER (ORDER BY salary DESC)  덴스랭크,
    ROW_NUMBER() OVER (ORDER BY salary DESC)  로넘버
FROM employees;

SELECT min_salary,
    CEIL(min_salary / 30),
    FLOOR(min_salary / 30)
FROM jobs;

#AS문의 이름은 숫자로 시작하면 않되나봐?
#AS문은 '' 대신 "" 써야 하나본다.

SELECT min_salary AS '봉급',
    CEIL(min_salary / 30) AS '30으로나누고올림',
    FLOOR(min_salary / 30) AS '30으로나우고올림'
FROM jobs;

#AS문에서 띄어쓰기 할때는 ""표를 사용하면 됨
SELECT min_salary AS "봉급",
    CEIL(min_salary / 30) AS "삼십으로 나누고 올림",
    FLOOR(min_salary / 30) AS "삼십으로 나우고 올림"
FROM jobs;

SELECT min_salary AS "봉급",
    CEIL(min_salary / 30) AS "30으로 나누고 올림",
    FLOOR(min_salary / 30) AS "30으로 나우고 올림"
FROM jobs;

SELECT ROUND(min_salary/30, 1), ROUND(min_salary/30, -1)
FROM jobs;

SELECT TRUNC(min_salary/30, 2), TRUNC(min_salary/30, -2)
FROM jobs;

SELECT SYSDATE, 
    ADD_MONTHS(SYSDATE, 1)
FROM dual;


SELECT SYSDATE, 
    NEXT_DAY(SYSDATE, 2), 
    NEXT_DAY(SYSDATE, 6)
FROM dual;

SELECT TO_CHAR(SYSDATE, 'MM/DD DAY')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'AM HH:MI')
FROM dual;

SELECT TO_CHAR(TO_DATE('20210101', 'YYMMDD'), 'DAY')
FROM dual;

SELECT salary, commission_pct, salary + salary * NVL(commission_pct, 0)
FROM employees
ORDER BY commission_pct;

SELECT first_name, last_name, department_id, salary, 
    DECODE(department_id, 50, salary * 1.1, salary) AS 급여인상,
    DECODE(department_id, 100, salary * 0.9, salary) AS 급여감소 
FROM employees;

SELECT job_title, max_salary,
    CASE
        WHEN max_salary >= 20000 THEN '상위'
        WHEN max_salary BETWEEN 10000 AND 20000 THEN '중위'
        ELSE '하위'
    END AS 급여등급
FROM jobs
WHERE job_title LIKE '%Manager';
