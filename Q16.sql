use A2


SELECT airplane.RegNo, plane_type.model 
FROM airplane 
JOIN plane_type ON airplane.of_type=plane_type.model
WHERE airplane.RegNo NOT IN (
    SELECT service.Plane_Serviced 
    FROM service 
    JOIN maintain ON service.work_code=maintain.WorkCode 
    JOIN employee ON employee.EmployeeID=maintain.EmpID
    WHERE employee.shift='Day'
)
AND airplane.RegNo NOT IN (
    SELECT owns.PlaneRegNo 
    FROM owns 
    JOIN corporation ON owns.owner_id=corporation.owner_id
)
