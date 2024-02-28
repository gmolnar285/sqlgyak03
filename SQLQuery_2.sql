--feladat1

SELECT *,
       -- új oszlop
       IIF(MONTH(METTOL) >= 6 AND MONTH(METTOL) <= 8, 'IGen', 'Nem') AS 'Nyári-e'
FROM foglalas
WHERE ugyfel_fk = 'laszlo2' AND gyermek_szam = 0

--- feladat2

SELECT szh.TIPUS, 
       YEAR(f.METTOL) AS 'Év', 
       MONTH(f.METTOL) AS 'Hónap', 
       --
       COUNT(*)
FROM Foglalas f JOIN Szoba sz ON f.SZOBA_FK = sz.SZOBA_ID 
                JOIN Szallashely szh ON sz.SZALLAS_FK = szh.SZALLAS_ID
WHERE DATEDIFF(day, f.METTOL, f.MEDDIG) >=5 
GROUP BY szh.TIPUS, YEAR(f.METTOL), MONTH(f.METTOL)

---feladat3