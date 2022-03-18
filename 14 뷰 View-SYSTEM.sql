CREATE MATERIALIZED VIEW country_location_view
    BUILD DEFERRED
    AS
        SELECT C.country_name, L.state_province, L.street_address
        FROM HR.countries C, HR.locations L
        WHERE C.country_id = L.country_id;
---
SELECT *
FROM country_location_view;
---������ ���� ����, �ʱ� �������, view����Ÿ�� ä������ ����
EXECUTE DBMS_MVIEW.REFRESH(LIST => 'country_location_view');
---
CREATE MATERIALIZED VIEW country_location_view2
    BUILD IMMEDIATE
    REFRESH ON COMMIT FAST 
    AS
        SELECT C.country_name, L.state_province, L.street_address
        FROM HR.countries C, HR.locations L
        WHERE C.country_id = L.country_id;
---���Ѿ���
DROP MATERIALIZED VIEW country_location_view;
---
CREATE MATERIALIZED VIEW country_location_view
    BUILD IMMEDIATE
    REFRESH ON DEMAND COMPLETE
AS
    SELECT C.country_name, L.state_province, L.street_address
    FROM HR.countries C, HR.locations L
    WHERE C.country_id = L.country_id;
---
SELECT *
FROM country_location_view;
---
INSERT INTO HR.countries
VALUES ('KR', 'Republic of Korea', 3);
---
INSERT INTO HR.locations
VALUES (3300, '1 Cheongwadae-Ro', 03048, 'Seoul', 'Jongro-Gu', 'KR');
---
SELECT *
FROM HR.countries;
---
SELECT *
FROM HR.locations;
---
SELECT *
FROM country_location_view;
---
EXECUTE DBMS_MVIEW.REFRESH(LIST => 'country_location_view');
---
SELECT *
FROM country_location_view;
---
DELETE HR.locations
WHERE location_id = 3300;
---
DELETE HR.countries
WHERE country_id = 'KR';
---
SELECT *
FROM country_location_view;
---����� ��������
---
EXECUTE DBMS_MVIEW.REFRESH(LIST => 'country_location_view');
---
SELECT *
FROM country_location_view;
---���� ������
DROP MATERIALIZED VIEW country_location_view;
---
---�ӵ����ϸ� Materialized View�� �Ϲ� Select & Join���� ����
SELECT C.country_name, L.state_province, L.street_address
FROM HR.countries C, HR.locations L
WHERE C.country_id = L.country_id;
---
SELECT 
    E.first_name, 
    E.last_name, 
    D.department_name, 
    J.job_title, L.city
FROM 
    HR.employees E, 
    HR.departments D, 
    HR.jobs J, 
    HR.locations L
WHERE 
    E.department_id = D.department_id 
    AND E.job_id = J.job_id
    AND D.location_id = L.location_id;
---
CREATE MATERIALIZED VIEW company_view
    BUILD IMMEDIATE
    REFRESH ON DEMAND COMPLETE
    AS
        SELECT 
            E.first_name, 
            E.last_name, 
            D.department_name, 
            J.job_title, L.city
        FROM 
            HR.employees E, 
            HR.departments D, 
            HR.jobs J, 
            HR.locations L
        WHERE 
            E.department_id = D.department_id 
            AND E.job_id = J.job_id
            AND D.location_id = L.location_id;
---
SELECT *
FROM company_view;