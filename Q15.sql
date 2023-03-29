use A2



SELECT p.PerName, SUM(s.hours) AS total_hours_worked
FROM corporation c
JOIN person p ON c.owner_id = p.owner_id
JOIN owns o ON c.owner_id = o.owner_id
JOIN airplane a ON o.PlaneRegNo = a.RegNo
JOIN service s ON a.RegNo = s.Plane_Serviced
JOIN maintain m ON s.work_code = m.WorkCode
JOIN employee e ON m.EmpID = e.EmployeeID
WHERE c.CorName = 'JetBlue'
GROUP BY p.PerName
ORDER BY total_hours_worked DESC;
