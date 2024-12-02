

1

SELECT *
FROM meetings
WHERE location = 'Mayotte'
ORDER BY meeting_date DESC
LIMIT 10;

2

SELECT employees.firstname, employees.lastname, (payrolls.salary + payrolls.bonus) AS total_salary
FROM payrolls
JOIN employees ON payrolls.employee_id = employees.id
WHERE MONTH(payrolls.date) = 4 AND YEAR(payrolls.date) = 2024
ORDER BY total_salary DESC
LIMIT 1;

3
SELECT COUNT(*) AS total_meetings
FROM attendees
JOIN employees ON attendees.employee_id = employees.id
WHERE employees.firstname = 'Cedrick' AND employees.lastname = 'Waters';

4 

SELECT *
FROM room_reservations rr
JOIN rooms r ON rr.room_id = r.id
JOIN buildings b ON r.building_id = b.id
WHERE r.name = 'quam'
  AND b.name = 'Bode, Blanda and Ebert'
  AND rr.date = '2024-11-10'
  AND rr.time BETWEEN '12:00:00' AND '18:00:00';

5

SELECT e.firstname, e.lastname, e.email
FROM employees e
JOIN employees m ON e.manager_id = m.id
WHERE m.firstname = 'Joey' AND m.lastname = 'Crooks';

6

SELECT firstname, lastname, birth_date
FROM employees
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 25 AND 30
  AND role = 'Director';

7

SELECT b.name, b.address, COUNT(r.id) AS room_count
FROM buildings b
JOIN rooms r ON b.id = r.building_id
WHERE r.floor = 4
GROUP BY b.name, b.address
ORDER BY room_count DESC
LIMIT 1;


8
SELECT m.date, r.name AS room_name, r.floor AS floor_number, b.address, COUNT(a.id) AS participant_count
FROM meetings m
JOIN attendees a ON m.id = a.meeting_id
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
GROUP BY m.date, r.name, r.floor, b.address
ORDER BY participant_count DESC
LIMIT 2;

9

SELECT e.country, SUM(p.salary) AS total_salary
FROM payrolls p
JOIN employees e ON p.employee_id = e.id
WHERE YEAR(p.date) = 2024
GROUP BY e.country;
