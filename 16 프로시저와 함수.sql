CREATE OR REPLACE PROCEDURE first_emp_proc
AS
    emp_name VARCHAR2(20);
BEGIN
    SELECT first_name || ' ' || last_name INTO emp_name
    FROM employees
    WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(emp_name);
END;
---
SET SERVEROUTPUT ON;
---
EXECUTE first_emp_proc();
---
CREATE OR REPLACE PROCEDURE print_emp_proc (
    emp_id IN EMPLOYEES.EMPLOYEE_ID%TYPE
)
AS
    emp_name VARCHAR2(20);
BEGIN
    SELECT first_name || ' ' || last_name INTO emp_name
    FROM employees 
    WHERE employee_id = emp_id;
    DBMS_OUTPUT.PUT_LINE(emp_name);
END;
---
EXECUTE print_emp_proc(200);
---
CREATE OR REPLACE PROCEDURE emp_avg_salary_proc(
    avg_salary OUT NUMBER
)
AS
BEGIN
    SELECT AVG(salary) INTO avg_salary
    FROM employees;
END;
---
DECLARE
    avg_salary NUMBER;
BEGIN
    emp_avg_salary_proc(avg_salary);
    DBMS_OUTPUT.PUT_LINE(avg_salary);
END;
---
CREATE OR REPLACE PROCEDURE if_salary_proc ( salary IN NUMBER )
AS
    avg_salary NUMBER;
BEGIN
    SELECT AVG(salary) INTO avg_salary 
    FROM employees;
    
    IF salary >= avg_salary THEN
        DBMS_OUTPUT.PUT_LINE('��� �̻�');
    ELSE
        DBMS_OUTPUT.PUT_LINE('��� �̸�');
    END IF;
END;
---
EXECUTE if_salary_proc(7000);
---
CREATE OR REPLACE PROCEDURE case_hire_date_proc ( emp_email IN EMPLOYEES.EMAIL%TYPE )
AS
    hire_year NCHAR(20);
    text_msg VARCHAR2(20);
BEGIN
    SELECT TO_CHAR(hire_date, 'YY') INTO hire_year
    FROM employees
    WHERE email = emp_email;
    
    CASE
        WHEN (hire_year = '01') THEN text_msg := '01�⵵�� �Ի�';
        WHEN (hire_year = '02') THEN text_msg := '02�⵵�� �Ի�';
        WHEN (hire_year = '03') THEN text_msg := '03�⵵�� �Ի�';
        WHEN (hire_year = '04') THEN text_msg := '04�⵵�� �Ի�';
        WHEN (hire_year = '05') THEN text_msg := '05�⵵�� �Ի�';
        WHEN (hire_year = '06') THEN text_msg := '06�⵵�� �Ի�';                
        WHEN (hire_year = '07') THEN text_msg := '07�⵵�� �Ի�';
        WHEN (hire_year = '08') THEN text_msg := '08�⵵�� �Ի�';
        WHEN (hire_year = '09') THEN text_msg := '09�⵵�� �Ի�';
        ELSE text_msg := '01~09�⵵ �̿ܿ� �Ի�';
    END CASE;
    DBMS_OUTPUT.PUT_LINE(text_msg);
END;
---
EXECUTE case_hire_date_proc('SKING');
---
CREATE OR REPLACE PROCEDURE while_print_proc 
AS
    str VARCHAR(100);
    i   NUMBER;
BEGIN
    i := 1;
    WHILE ( i <= 100) LOOP
        str := '�ݺ� Ƚ��:' || '(' || i || ')';
        DBMS_OUTPUT.PUT_LINE(str);
        i := i + 1;
    END LOOP;
END;
---
EXECUTE while_print_proc();
---
CREATE OR REPLACE PROCEDURE out_emp_proc ( emp_id IN EMPLOYEES.EMPLOYEE_ID%TYPE, out_str OUT VARCHAR2 )
AS
    emp_name VARCHAR2(20);
BEGIN
    SELECT first_name || ' ' || last_name INTO emp_name
    FROM employees
    WHERE employee_id = emp_id;
    
    IF emp_id = NULL THEN
        out_str := '����: ����';
    ELSE
        out_str := '����: ' || emp_name;
    END IF;
END;
---
DECLARE
    out_str VARCHAR2(30);
BEGIN
    out_emp_proc(100, out_str);
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
---
DECLARE
    out_str VARCHAR2(30);
BEGIN
    out_emp_proc(300, out_str);
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
---
---
CREATE OR REPLACE PROCEDURE out_emp_proc ( emp_id IN EMPLOYEES.EMPLOYEE_ID%TYPE, out_str OUT VARCHAR2 )
AS
    emp_name VARCHAR2(20);
BEGIN
    SELECT first_name || ' ' || last_name INTO emp_name
    FROM employees
    WHERE employee_id = emp_id;
    
    out_str := '����: ' || emp_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            out_str := '����: ����';
END;
---
DECLARE
    out_str VARCHAR2(30);
BEGIN
    out_emp_proc(300, out_str);
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
---
DECLARE
    out_str VARCHAR2(30);
BEGIN
    out_emp_proc(100, out_str);
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
---
CREATE OR REPLACE PROCEDURE in_out_emp_proc ( emp_name IN OUT VARCHAR2 )
AS
BEGIN
    SELECT first_name || ' ' || last_name INTO emp_name
    FROM employees
    WHERE first_name = emp_name OR last_name = emp_name;
    
    emp_name := '����: ' || emp_name;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            emp_name := '����: ����';
END;
---
DECLARE
    emp_name VARCHAR2(30) := 'Lisa';
BEGIN
    in_out_emp_proc(emp_name);
    DBMS_OUTPUT.PUT_LINE(emp_name);
END;
---
DECLARE
    emp_name VARCHAR2(30) := 'King';
BEGIN
    in_out_emp_proc(emp_name);
    DBMS_OUTPUT.PUT_LINE(emp_name);
END;
---�������� ���� ��ȯ�ؼ� ����ó���� �ʵ�
---
CREATE OR REPLACE PROCEDURE rowtype_emp_proc (emp_id IN EMPLOYEES.EMPLOYEE_ID%TYPE )
AS
    emp_row EMPLOYEES%ROWTYPE;
BEGIN
    SELECT first_name, last_name, job_id 
    INTO emp_row.first_name, emp_row.last_name, emp_row.job_id
    FROM employees
    WHERE employee_id = emp_id;
    
    DBMS_OUTPUT.PUT_LINE ( emp_row.first_name || '|' || emp_row.last_name || '|' || emp_row.job_id );
END;
---
EXECUTE rowtype_emp_proc(100);
---
EXECUTE rowtype_emp_proc(200);
---
CREATE OR REPLACE PROCEDURE record_emp_proc ( emp_id IN EMPLOYEES.EMPLOYEE_ID%TYPE )
AS
    TYPE emp_type IS RECORD (first_name VARCHAR2(10), last_name VARCHAR2(10), job_id VARCHAR2(10));
    emp_record emp_type;
BEGIN
    SELECT first_name, last_name, job_id
    INTO emp_record.first_name, emp_record.last_name, emp_record.job_id
    FROM employees 
    WHERE employee_id = emp_id;
    
    DBMS_OUTPUT.PUT_LINE(emp_record.first_name || ' | ' ||
                         emp_record.last_name || ' | ' ||
                         emp_record.job_id);
END;
---
EXECUTE record_emp_proc(100);
---
EXECUTE record_emp_proc(200);
---
---Collection ��� ���ν���
CREATE OR REPLACE PROCEDURE collection_ex_proc 
AS
    TYPE v_array_type   IS VARRAY(5) OF NUMBER(10);
    TYPE nest_tbl_type  IS TABLE OF VARCHAR(20);
    TYPE a_array_type   IS TABLE OF NUMBER(10)  INDEX BY VARCHAR2(10);
    
    v_array     v_array_type;
    nest_tbl    nest_tbl_type;
    a_array     a_array_type;
    idx         VARCHAR2(10);
    
BEGIN
    v_array := v_array_type(1, 2, 3, 4, 5);
    nest_tbl := nest_tbl_type('A', 'B', 'C', 'D', 'E');

    a_array('A') := 1;
    a_array('B') := 2;
    a_array('C') := 3;
    a_array('D') := 4;
    a_array('E') := 5;
    
    FOR i IN 1 .. 5 LOOP
        DBMS_OUTPUT.PUT_LINE(v_array(i) || ' | ' || nest_tbl(i));
    END LOOP;
    
    idx := a_array.FIRST;
    
    WHILE idx IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(idx || ' | ' || a_array(idx));
        idx := a_array.NEXT(idx);
    END LOOP;
END;
---
EXECUTE collection_ex_proc();
---
CREATE OR REPLACE PROCEDURE cursor_salary_proc 
AS
    sal NUMBER := 0;
    cnt NUMBER := 0;
    total   NUMBER := 0;
    
    CURSOR emp_cursor IS SELECT salary FROM employees;

BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO sal;
        EXIT WHEN emp_cursor%NOTFOUND;
        total := total + sal;
        cnt := cnt + 1;
    END LOOP;
    CLOSE emp_cursor;
    DBMS_OUTPUT.PUT_LINE('��� SALARY: ' || (total / cnt));
END;
---
EXECUTE cursor_salary_proc();
---
---FUNCTION
---
CREATE OR REPLACE FUNCTION to_yyyymmdd(date Date)
    RETURN VARCHAR2
IS
    char_date VARCHAR2(20);
BEGIN
    char_date := TO_CHAR(date, 'YYYY-MM-DD');
    RETURN char_date;
END;
---
SELECT to_yyyymmdd(SYSDATE)
FROM dual;
----
CREATE OR REPLACE FUNCTION get_age(date DATE)
    RETURN NUMBER
IS
    age NUMBER;
BEGIN
    age := TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), to_yyyymmdd(date)) / 12);
    RETURN age;
END;
---
SELECT get_age('19680215')
FROM dual;
---
CREATE OR REPLACE TYPE ename_type AS OBJECT 
(
    first_name VARCHAR2(20),
    last_name VARCHAR2(20)
);
---
CREATE OR REPLACE TYPE ename_table
AS
    TABLE OF ename_type;
---
---Pipelined Table Function
---
CREATE OR REPLACE FUNCTION emp_table(emp_id NUMBER)
    RETURN ename_table
    PIPELINED
IS
    ename ename_type;
BEGIN
    FOR emp IN (    SELECT first_name, last_name
                    FROM employees
                    WHERE employee_id = emp_id  )
    LOOP
        ename := ename_type(emp.first_name, emp.last_name);
        PIPE ROW(ename);
    END LOOP;
    
    RETURN;
END;
---
SELECT *
FROM TABLE(emp_table(100));
---