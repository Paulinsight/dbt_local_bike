WITH dates AS (
    SELECT 
        DATE_ADD(DATE(EXTRACT(YEAR FROM CURRENT_DATE()) - 10, 1, 1), INTERVAL seq DAY) AS Date
    FROM UNNEST(GENERATE_ARRAY(0, DATE_DIFF(DATE(EXTRACT(YEAR FROM CURRENT_DATE()), 12, 31), DATE(EXTRACT(YEAR FROM CURRENT_DATE()) - 5, 1, 1), DAY))) AS seq
)
SELECT 
    Date,
    EXTRACT(YEAR FROM Date) AS Annee,
    EXTRACT(MONTH FROM Date) AS Numero_Mois,
    EXTRACT(DAY FROM Date) AS Numero_Jour,
    FORMAT_DATE('%B', Date) AS Mois_Long,
    FORMAT_DATE('%b', Date) AS Mois_Court,
    FORMAT_DATE('%A', Date) AS Jour_Semaine,
    FORMAT_DATE('%a', Date) AS Jour_Semaine_Abrege,
    EXTRACT(DAYOFWEEK FROM Date) AS Numero_Jour_Semaine,
    EXTRACT(WEEK FROM Date) AS Semaine_Annee,
    CONCAT('S', FORMAT('%02d', EXTRACT(WEEK FROM Date))) AS Semaine,
    EXTRACT(DAY FROM Date) AS Numero_Jour_Semaine_Mois,
    EXTRACT(DAYOFYEAR FROM Date) AS Numero_Jour_Annee,
    CASE 
        WHEN EXTRACT(MONTH FROM Date) IN (1,2,3) THEN 'T1'
        WHEN EXTRACT(MONTH FROM Date) IN (4,5,6) THEN 'T2'
        WHEN EXTRACT(MONTH FROM Date) IN (7,8,9) THEN 'T3'
        ELSE 'T4'
    END AS Trimestre,
    CASE 
        WHEN EXTRACT(MONTH FROM Date) <= 6 THEN 'S1'
        ELSE 'S2'
    END AS Semestre,
    CONCAT(EXTRACT(YEAR FROM Date), '-', FORMAT('%02d', EXTRACT(WEEK FROM Date))) AS AnneeSemaine
FROM dates

order by date
