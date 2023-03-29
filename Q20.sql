use A2


SELECT p.model, COUNT(*) as TotalPlanes
FROM airplane AS a
JOIN plane_type AS p ON a.of_type = p.model
GROUP BY p.model;
