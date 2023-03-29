use A2

SELECT p.OwnerID, COUNT(o.PlaneRegNo) AS TotalPlanes
FROM owns o
JOIN PlaneOwner p ON o.owner_id = p.OwnerID
GROUP BY p.OwnerID;
