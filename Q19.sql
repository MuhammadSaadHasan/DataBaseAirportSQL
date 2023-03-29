use A2


SELECT h.number, COUNT(a.RegNo) AS TotalPlanes
FROM hangar h
LEFT JOIN airplane a ON h.number = a.stored_in
GROUP BY h.number;



