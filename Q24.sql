use A2

SELECT p.lic_num, COUNT(DISTINCT f.model) AS PlanesAuthorized
FROM pilot p
JOIN flies f ON p.lic_num = f.licNum
GROUP BY p.lic_num;

