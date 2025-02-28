WITH dates AS (
    SELECT 
        DATE_ADD(DATE(EXTRACT(YEAR FROM CURRENT_DATE()) - 10 /*years from current date*/, 1, 1), 
            INTERVAL seq DAY) AS Date --date de début
    FROM UNNEST(GENERATE_ARRAY(0, DATE_DIFF(DATE(EXTRACT(YEAR FROM CURRENT_DATE()), 12, 31), 
        DATE(EXTRACT(YEAR FROM CURRENT_DATE()) - 3 /*nb years */, 1, 1), DAY))) AS seq
)
SELECT 
    Date,
    EXTRACT(YEAR FROM Date) AS Annee,
    EXTRACT(MONTH FROM Date) AS Numero_Mois,
    EXTRACT(DAY FROM Date) AS Numero_Jour,
    CASE FORMAT_DATE('%B', Date)
        WHEN 'January' THEN 'janvier'
        WHEN 'February' THEN 'février'
        WHEN 'March' THEN 'mars'
        WHEN 'April' THEN 'avril'
        WHEN 'May' THEN 'mai'
        WHEN 'June' THEN 'juin'
        WHEN 'July' THEN 'juillet'
        WHEN 'August' THEN 'août'
        WHEN 'September' THEN 'septembre'
        WHEN 'October' THEN 'octobre'
        WHEN 'November' THEN 'novembre'
        WHEN 'December' THEN 'décembre'
    END AS Mois_Long,

    CASE FORMAT_DATE('%b', Date)
        WHEN 'Jan' THEN 'janv'
        WHEN 'Feb' THEN 'févr'
        WHEN 'Mar' THEN 'mars'
        WHEN 'Apr' THEN 'avr'
        WHEN 'May' THEN 'mai'
        WHEN 'Jun' THEN 'juin'
        WHEN 'Jul' THEN 'juil'
        WHEN 'Aug' THEN 'août'
        WHEN 'Sep' THEN 'sept'
        WHEN 'Oct' THEN 'oct'
        WHEN 'Nov' THEN 'nov'
        WHEN 'Dec' THEN 'déc'
    END AS Mois_court,

    CASE FORMAT_DATE('%A', Date)
        WHEN 'Sunday' THEN 'dimanche'
        WHEN 'Monday' THEN 'lundi'
        WHEN 'Tuesday' THEN 'mardi'
        WHEN 'Wednesday' THEN 'mercredi'
        WHEN 'Thursday' THEN 'jeudi'
        WHEN 'Friday' THEN 'vendredi'
        WHEN 'Saturday' THEN 'samedi'
    END AS Jour_Semaine,

    CASE FORMAT_DATE('%A', Date)
        WHEN 'Sunday' THEN 'dim'
        WHEN 'Monday' THEN 'lun'
        WHEN 'Tuesday' THEN 'mar'
        WHEN 'Wednesday' THEN 'mer'
        WHEN 'Thursday' THEN 'jeu'
        WHEN 'Friday' THEN 'ven'
        WHEN 'Saturday' THEN 'sam'
    END AS Jour_Semaine_Abrege,

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
    CONCAT(EXTRACT(YEAR FROM Date), '-', FORMAT('%02d', EXTRACT(WEEK FROM Date))) AS AnneeSemaine,
    CAST(CONCAT(EXTRACT(YEAR FROM Date), FORMAT('%02d', EXTRACT(MONTH FROM Date))) as int64) AS annee_Mois_numero,
    CONCAT(EXTRACT(YEAR FROM Date), '-', FORMAT('%02d', EXTRACT(MONTH FROM Date))) AS annee_mois
FROM dates

order by date
