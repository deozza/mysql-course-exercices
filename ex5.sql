-- Commande numero 1

SELECT m.id, m.date, r.name AS room_name, b.name AS building_name, b.country
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
WHERE b.country = 'Mayotte'
ORDER BY m.date DESC
LIMIT 10;

-- Commande numero 2

SELECT e.lastname, e.firstname, (p.salary + p.bonus) AS total_salary
FROM payrolls p
JOIN employees e ON p.employee_id = e.id
WHERE MONTH(p.date) = 4 AND YEAR(p.date) = 2024
ORDER BY total_salary DESC
LIMIT 1;

-- Commande numero 3

SELECT COUNT(*) AS meetings_attended
FROM attendees a
JOIN employees e ON a.employee_id = e.id
WHERE e.firstname = 'Cedrick' AND e.lastname = 'Waters';

-- Commande numero 4

SELECT m.id, m.date, r.name AS room_name, b.name AS building_name
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
WHERE r.name = 'quam'
  AND b.name = 'Bode, Blanda and Ebert'
  AND DATE(m.date) = '2024-11-10'
  AND TIME(m.date) BETWEEN '12:00:00' AND '18:00:00';

-- Commande numero 5

SELECT e.lastname, e.firstname, e.email
FROM employees e
JOIN employees s ON e.superior_id = s.id
WHERE s.firstname = 'Joey' AND s.lastname = 'Crooks';

-- Commande numero 6 

SELECT e.lastname, e.firstname, e.date_of_birth
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE d.job LIKE '% Director %'
  AND TIMESTAMPDIFF(YEAR, e.date_of_birth, CURDATE()) BETWEEN 25 AND 30;

-- Commande numero 7 

SELECT b.name AS building_name, b.address
FROM buildings b
JOIN rooms r ON b.id = r.building_id
WHERE r.floor = 4
GROUP BY b.id
ORDER BY COUNT(r.id) DESC
LIMIT 1;

-- Commande numero 8

SELECT m.date, r.name AS room_name, r.floor, b.address
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
JOIN attendees a ON m.id = a.meeting_id
GROUP BY m.id
ORDER BY COUNT(a.employee_id) DESC
LIMIT 2;

-- Commande numero9

SELECT b.country, SUM(p.salary) AS total_expenses
FROM payrolls p
JOIN employees e ON p.employee_id = e.id
JOIN departments d ON e.department_id = d.id
JOIN buildings b ON d.building_id = b.id
WHERE YEAR(p.date) = 2024
GROUP BY b.country;
