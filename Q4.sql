use A2


SELECT c.CorName, c.CorAddress
FROM airplane a
JOIN owns o ON a.RegNo = o.PlaneRegNo
JOIN plane_type p ON a.of_type = p.model
JOIN corporation c ON o.owner_id = c.owner_id
WHERE p.capacity > 0;
