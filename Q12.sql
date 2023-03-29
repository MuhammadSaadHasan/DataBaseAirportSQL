use A2

SELECT p.model, AVG(s.hours) AS Avg
FROM plane_type AS p
JOIN airplane AS a ON p.model = a.of_type
JOIN service AS s ON a.RegNo = s.Plane_Serviced
JOIN maintain AS m ON s.work_code = m.WorkCode
GROUP BY p.model;
