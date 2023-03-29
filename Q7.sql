use A2

SELECT  airplane.of_type, airplane.RegNo
FROM maintain
JOIN service ON maintain.WorkCode = service.work_code
JOIN airplane ON service.Plane_Serviced = airplane.RegNo
WHERE service.SerDate >= '2023-03-26'		--past week date however you can also use getdate()
