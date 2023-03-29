use A2

SELECT p.PerName, p.PerPhone
FROM person p
JOIN owns o ON p.owner_id = o.owner_id
JOIN airplane a ON o.PlaneRegNo = a.RegNo
JOIN service s ON a.RegNo = s.Plane_Serviced
where o.Pdate >= '2023-03-26';



