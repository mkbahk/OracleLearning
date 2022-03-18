SELECT COUNT(*)
FROM commerce;
---
SELECT DISTINCT COUNT(상권_코드_명)
FROM COMMERCE;
--
SELECT DISTINCT 상권_구분_코드_명
FROM COMMERCE;
---
SELECT DISTINCT 서비스_업종_코드_명
FROM COMMERCE;
---
SELECT *
FROM COMMERCE;
---
SELECT 상권_구분_코드_명, '점포수', SUM(점포수)
FROM COMMERCE
GROUP BY 상권_구분_코드_명;
---
SELECT 서비스_업종_코드_명, SUM(점포수)
FROM COMMERCE
GROUP BY 서비스_업종_코드_명
ORDER BY SUM(점포수) DESC;
---
SELECT 서비스_업종_코드_명, SUM(주중_매출_금액), SUM(주말_매출_금액)
FROM COMMERCE
GROUP BY 서비스_업종_코드_명
ORDER BY SUM(주중_매출_금액) DESC, SUM(주말_매출_금액) DESC;
---
SELECT  서비스_업종_코드_명,
        SUM(월요일_매출_금액), 
        SUM(화요일_매출_금액),
        SUM(수요일_매출_금액), 
        SUM(목요일_매출_금액),
        SUM(금요일_매출_금액), 
        SUM(토요일_매출_금액),
        SUM(일요일_매출_금액)
FROM COMMERCE
GROUP BY 서비스_업종_코드_명
ORDER BY 
        SUM(월요일_매출_금액) DESC, 
        SUM(화요일_매출_금액) DESC,
        SUM(수요일_매출_금액) DESC, 
        SUM(목요일_매출_금액) DESC,
        SUM(금요일_매출_금액) DESC, 
        SUM(토요일_매출_금액) DESC,
        SUM(일요일_매출_금액) DESC;
---
SELECT  서비스_업종_코드_명,
        AVG(월요일_매출_금액), 
        AVG(화요일_매출_금액),
        AVG(수요일_매출_금액), 
        AVG(목요일_매출_금액),
        AVG(금요일_매출_금액), 
        AVG(토요일_매출_금액),
        AVG(일요일_매출_금액)
FROM COMMERCE
GROUP BY 서비스_업종_코드_명
ORDER BY 
        AVG(월요일_매출_금액) DESC, 
        AVG(화요일_매출_금액) DESC,
        AVG(수요일_매출_금액) DESC, 
        AVG(목요일_매출_금액) DESC,
        AVG(금요일_매출_금액) DESC, 
        AVG(토요일_매출_금액) DESC,
        AVG(일요일_매출_금액) DESC;
---
SELECT  서비스_업종_코드_명,
        AVG(남성_매출_금액), 
        AVG(여성_매출_금액)
FROM COMMERCE
GROUP BY 서비스_업종_코드_명
ORDER BY 
        AVG(남성_매출_금액) DESC, 
        AVG(여성_매출_금액) DESC;
---
SELECT  서비스_업종_코드_명,
        AVG(연령대_10_매출_금액), 
        AVG(연령대_20_매출_금액),
        AVG(연령대_30_매출_금액), 
        AVG(연령대_40_매출_금액),
        AVG(연령대_50_매출_금액), 
        AVG(연령대_60_이상_매출_금액)
FROM COMMERCE
GROUP BY 서비스_업종_코드_명
ORDER BY 
        AVG(연령대_10_매출_금액) DESC, 
        AVG(연령대_20_매출_금액) DESC,
        AVG(연령대_30_매출_금액) DESC, 
        AVG(연령대_40_매출_금액) DESC,
        AVG(연령대_50_매출_금액) DESC, 
        AVG(연령대_60_이상_매출_금액) DESC;
---

