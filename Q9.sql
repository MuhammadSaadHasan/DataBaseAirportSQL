use A2


SELECT pilot.lic_num, COUNT(DISTINCT flies.model) AS AuthorizedToFly
FROM pilot
INNER JOIN flies ON pilot.lic_num = flies.licNum
GROUP BY pilot.lic_num;
