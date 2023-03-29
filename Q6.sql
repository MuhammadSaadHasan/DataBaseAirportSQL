use A2


SELECT top 5 m.EmpID, SUM(s.hours) AS TotalHours
FROM maintain m
JOIN service s ON m.WorkCode = s.work_code
GROUP BY m.EmpID
ORDER BY TotalHours DESC;

SELECT TOP 5 hours
FROM service
ORDER BY hours DESC;

