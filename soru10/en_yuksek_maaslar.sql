WITH RankedEmployees AS (
    SELECT 
        c.ad, 
        c.soyad, 
        c.maas, 
        b.birim_ad,
        ROW_NUMBER() OVER(PARTITION BY c.calisan_birim_id ORDER BY c.maas DESC) AS rank
    FROM calisanlar c
    INNER JOIN birimler b ON c.calisan_birim_id = b.birim_id
)
SELECT ad, soyad, maas, birim_ad
FROM RankedEmployees
WHERE rank = 1;