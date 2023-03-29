use A2

SELECT c.CorName, COUNT(o.PlaneRegNo) AS NumberOfPlanes
FROM corporation c
INNER JOIN owns o ON c.owner_id = o.owner_id
INNER JOIN airplane a ON o.PlaneRegNo = a.RegNo
GROUP BY c.CorName
ORDER BY NumPlanes DESC;
