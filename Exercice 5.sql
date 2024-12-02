-- EXERCICE 1

SELECT m.id, m.date, r.name AS room_name, b.name AS building_name
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
WHERE b.country = 'Mayotte'
ORDER BY m.date DESC
LIMIT 10;


-- EXERCICE 2

SELECT MAX(salary + bonus) AS total_salary, e.lastname, e.firstname
FROM payrolls p
JOIN employees e ON p.employee_id = e.id
WHERE MONTH(p.date) = 4
AND YEAR(p.date) = 2024
GROUP BY e.lastname, e.firstname
ORDER BY total_salary DESC
LIMIT 1;


-- EXERCICE 3

SELECT COUNT(m.id) AS meetings_count
FROM meetings m
JOIN attendees a ON m.id = a.meeting_id
JOIN employees e ON a.employee_id = e.id
WHERE e.firstname = 'Cedrick'
AND e.lastname = 'Waters';


-- EXERCICE 4

SELECT COUNT(*) AS is_reserved
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
WHERE b.name = 'Bode, Blanda and Ebert'
AND r.name = 'quam'
AND m.date = '2024-11-10'
AND m.date BETWEEN '2024-11-10 12:00:00' AND '2024-11-10 18:00:00';


-- EXERCICE 5

SELECT e.lastname, e.firstname, e.email
FROM employees e
JOIN employees s ON e.superior_id = s.id
WHERE s.lastname = 'Crooks'
AND s.firstname = 'Joey';


-- EXERCICE 6

SELECT e.lastname, e.firstname, e.date_of_birth
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE d.job LIKE '%Director%'
AND TIMESTAMPDIFF(YEAR, e.date_of_birth, CURDATE()) BETWEEN 25 AND 30;


-- EXERCICE 7

SELECT b.name, b.address
FROM buildings b
JOIN rooms r ON b.id = r.building_id
WHERE r.floor = 4
GROUP BY b.id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- EXERCICE 8

SELECT m.date, r.name, r.floor, b.address
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
JOIN (
	SELECT meeting_id, COUNT(*) AS count
	FROM attendees
	GROUP BY meeting_id
	ORDER BY count DESC
	LIMIT 2
) AS c ON c.meeting_id = m.id;


-- EXERCICE 9

SELECT b.country, SUM(p.salary) as total_salary_expenses
FROM payrolls p
JOIN employees e ON p.employee_id = e.id
JOIN departments d ON e.department_id = d.id
JOIN buildings b ON d.building_id = b.id
WHERE p.date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY b.country;