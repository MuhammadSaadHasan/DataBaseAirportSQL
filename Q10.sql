use A2


select h.location, h.capacity
from hangar h
JOIN airplane a ON h.number = a.stored_in
GROUP BY h.number;

SELECT stored_in AS HangarNumber, COUNT(*) AS UsageCount
FROM airplane
GROUP BY stored_in
ORDER BY UsageCount ASC;
