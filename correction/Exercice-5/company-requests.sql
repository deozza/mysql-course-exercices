SELECT meetings.*
FROM meetings
INNER JOIN rooms ON meetings.room_id = rooms.id
INNER JOIN buildings ON rooms.building_id = buildings.id
WHERE buildings.country = 'Mayotte'
ORDER BY meetings.date DESC
LIMIT 10;

SELECT payrolls.salary + payrolls.bonus AS total_pay, employees.firstname, employees.lastname
FROM payrolls
INNER JOIN employees ON payrolls.employee_id = employees.id
WHERE payrolls.date BETWEEN '2024-04-01' AND '2024-04-30'
ORDER BY total_pay DESC
LIMIT 1;

SELECT COUNT(meetings.id)
FROM meetings
INNER JOIN attendees ON meetings.id = attendees.meeting_id
INNER JOIN employees ON attendees.employee_id = employees.id
WHERE employees.firstname = 'Cedrick' AND employees.lastname = 'Waters';

SELECT meetings.id
FROM meetings
INNER JOIN rooms ON meetings.room_id = rooms.id
INNER JOIN buildings ON rooms.building_id = buildings.id
WHERE buildings.name = 'Bode, Blanda and Ebert'
AND rooms.name = 'quam'
AND meetings.date >= '2024-11-10 12:00' AND meetings.date <= '2024-11-10 18:00';

SELECT employees.firstname, employees.lastname, employees.email
FROM employees
INNER JOIN employees AS manager ON employees.superior_id = manager.id
WHERE manager.firstname = 'Joey' AND manager.lastname = 'Crooks';

SELECT employees.firstname, employees.lastname, employees.email, employees.date_of_birth
FROM employees
INNER JOIN departments ON employees.department_id = departments.id
WHERE departments.job LIKE '%director%'
AND employees.date_of_birth BETWEEN CURDATE() - INTERVAL 30 YEAR AND CURDATE() - INTERVAL 25 YEAR;

SELECT buildings.name, buildings.address, COUNT(rooms.id) AS rooms_count
FROM buildings
INNER JOIN rooms ON buildings.id = rooms.building_id
WHERE rooms.floor = 4
GROUP BY buildings.id
ORDER BY rooms_count DESC
LIMIT 1;

SELECT meetings.id, COUNT(attendees.employee_id) AS attendees_count, meetings.date, rooms.name, rooms.floor, buildings.address
FROM meetings
INNER JOIN attendees ON meetings.id = attendees.meeting_id
INNER JOIN rooms ON meetings.room_id = rooms.id
INNER JOIN buildings ON rooms.building_id = buildings.id
GROUP BY meetings.id
ORDER BY attendees_count DESC
LIMIT 2;

SELECT buildings.country, SUM(payrolls.salary + payrolls.bonus) AS total_pay
FROM payrolls
INNER JOIN employees ON payrolls.employee_id = employees.id
INNER JOIN departments ON employees.department_id = departments.id
INNER JOIN buildings ON departments.building_id = buildings.id
WHERE payrolls.date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY buildings.country
ORDER BY total_pay DESC;