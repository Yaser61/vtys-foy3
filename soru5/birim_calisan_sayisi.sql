SELECT 
    CASE birim.birim_id
        WHEN 1 THEN 'Yazılım'
        WHEN 2 THEN 'Donanım'
        WHEN 3 THEN 'Güvenlik'
    END AS birim_adi,
    COUNT(calisan.calisan_id) AS calisan_sayisi
FROM 
    birimler AS birim
JOIN 
    calisanlar AS calisan ON birim.birim_id = calisan.calisan_birim_id
GROUP BY 
    birim.birim_id;