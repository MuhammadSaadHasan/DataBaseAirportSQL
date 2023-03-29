use A2


SELECT DISTINCT p.PerName AS OwnerName
FROM airplane AS a
JOIN owns AS o ON o.PlaneRegNo = a.RegNo
JOIN maintain AS m ON m.WorkCode = s.WorkCode
JOIN employee AS e ON e.EmployeeID = m.EmpID
JOIN person AS p ON p.owner_id = o.owner_id
JOIN plane_type AS t ON t.model = a.of_type
WHERE t.model NOT IN (
    SELECT t2.model
    FROM WorksOn AS w
    JOIN employee AS e ON e.EmployeeID = w.EmpID
    JOIN plane_type AS t2 ON t2.model = w.model
    WHERE e.EmployeeID = m.EmpID
);

