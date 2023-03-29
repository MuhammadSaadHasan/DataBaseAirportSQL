use A2

SELECT shift, AVG(salary) AS AverageSalary
FROM employee
WHERE shift IN ('Day', 'Night')
GROUP BY shift;
