SELECT COUNT(*)
FROM commerce;
---
SELECT DISTINCT COUNT(���_�ڵ�_��)
FROM COMMERCE;
--
SELECT DISTINCT ���_����_�ڵ�_��
FROM COMMERCE;
---
SELECT DISTINCT ����_����_�ڵ�_��
FROM COMMERCE;
---
SELECT *
FROM COMMERCE;
---
SELECT ���_����_�ڵ�_��, '������', SUM(������)
FROM COMMERCE
GROUP BY ���_����_�ڵ�_��;
---
SELECT ����_����_�ڵ�_��, SUM(������)
FROM COMMERCE
GROUP BY ����_����_�ڵ�_��
ORDER BY SUM(������) DESC;
---
SELECT ����_����_�ڵ�_��, SUM(����_����_�ݾ�), SUM(�ָ�_����_�ݾ�)
FROM COMMERCE
GROUP BY ����_����_�ڵ�_��
ORDER BY SUM(����_����_�ݾ�) DESC, SUM(�ָ�_����_�ݾ�) DESC;
---
SELECT  ����_����_�ڵ�_��,
        SUM(������_����_�ݾ�), 
        SUM(ȭ����_����_�ݾ�),
        SUM(������_����_�ݾ�), 
        SUM(�����_����_�ݾ�),
        SUM(�ݿ���_����_�ݾ�), 
        SUM(�����_����_�ݾ�),
        SUM(�Ͽ���_����_�ݾ�)
FROM COMMERCE
GROUP BY ����_����_�ڵ�_��
ORDER BY 
        SUM(������_����_�ݾ�) DESC, 
        SUM(ȭ����_����_�ݾ�) DESC,
        SUM(������_����_�ݾ�) DESC, 
        SUM(�����_����_�ݾ�) DESC,
        SUM(�ݿ���_����_�ݾ�) DESC, 
        SUM(�����_����_�ݾ�) DESC,
        SUM(�Ͽ���_����_�ݾ�) DESC;
---
SELECT  ����_����_�ڵ�_��,
        AVG(������_����_�ݾ�), 
        AVG(ȭ����_����_�ݾ�),
        AVG(������_����_�ݾ�), 
        AVG(�����_����_�ݾ�),
        AVG(�ݿ���_����_�ݾ�), 
        AVG(�����_����_�ݾ�),
        AVG(�Ͽ���_����_�ݾ�)
FROM COMMERCE
GROUP BY ����_����_�ڵ�_��
ORDER BY 
        AVG(������_����_�ݾ�) DESC, 
        AVG(ȭ����_����_�ݾ�) DESC,
        AVG(������_����_�ݾ�) DESC, 
        AVG(�����_����_�ݾ�) DESC,
        AVG(�ݿ���_����_�ݾ�) DESC, 
        AVG(�����_����_�ݾ�) DESC,
        AVG(�Ͽ���_����_�ݾ�) DESC;
---
SELECT  ����_����_�ڵ�_��,
        AVG(����_����_�ݾ�), 
        AVG(����_����_�ݾ�)
FROM COMMERCE
GROUP BY ����_����_�ڵ�_��
ORDER BY 
        AVG(����_����_�ݾ�) DESC, 
        AVG(����_����_�ݾ�) DESC;
---
SELECT  ����_����_�ڵ�_��,
        AVG(���ɴ�_10_����_�ݾ�), 
        AVG(���ɴ�_20_����_�ݾ�),
        AVG(���ɴ�_30_����_�ݾ�), 
        AVG(���ɴ�_40_����_�ݾ�),
        AVG(���ɴ�_50_����_�ݾ�), 
        AVG(���ɴ�_60_�̻�_����_�ݾ�)
FROM COMMERCE
GROUP BY ����_����_�ڵ�_��
ORDER BY 
        AVG(���ɴ�_10_����_�ݾ�) DESC, 
        AVG(���ɴ�_20_����_�ݾ�) DESC,
        AVG(���ɴ�_30_����_�ݾ�) DESC, 
        AVG(���ɴ�_40_����_�ݾ�) DESC,
        AVG(���ɴ�_50_����_�ݾ�) DESC, 
        AVG(���ɴ�_60_�̻�_����_�ݾ�) DESC;
---

