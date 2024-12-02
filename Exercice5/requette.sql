1-
SELECT meetings.id, meetings.date
FROM meetings
INNER JOIN rooms ON meetings.room_id = rooms.id
INNER JOIN buildings ON rooms.building_id = buildings.id
WHERE buildings.country = 'Mayotte'
ORDER BY meetings.date DESC
LIMIT 10;

2-
SELECT employees.firstname, employees.lastname, (payrolls.salary + payrolls.bonus) AS total_salary
FROM payrolls
INNER JOIN employees ON payrolls.employee_id = employees.id
WHERE payrolls.date LIKE '2024-04%'
ORDER BY total_salary DESC
LIMIT 1;

3-
SELECT COUNT(*) AS total_meetings
FROM attendees
INNER JOIN employees ON attendees.employee_id = employees.id
WHERE employees.firstname = 'Cedrick' AND employees.lastname = 'Waters';

4-
SELECT meetings.date
FROM rooms
INNER JOIN buildings ON rooms.building_id = buildings.id
JOIN meetings ON meetings.room_id = rooms.id
WHERE rooms.name = 'quam'
  AND buildings.name = 'Bode, Blanda and Ebert'
  AND meetings.date BETWEEN '2024-11-10 12:00:00' AND '2024-11-10 18:00:00';

5-
SELECT employees.lastname, employees.firstname, employees.email
FROM employes
INNER JOIN employees AS superiors ON employees.superior_id = superiors.id
WHERE superiors.firstname = 'Joey' AND superiors.lastname = 'Crooks';

6-

7-
SELECT buildings.name, buildings.address
FROM buildings
INNER JOIN rooms ON buildings.id = rooms.building_id
WHERE rooms.floor = 4
GROUP BY buildings.id
ORDER BY COUNT(rooms.id) DESC
LIMIT 1;

8-
SELECT meetings.date, rooms.name AS room_name, rooms.floor, buildings.address
FROM meetings
INNER JOIN rooms ON meetings.room_id = rooms.id
INNER JOIN buildings ON rooms.building_id = buildings.id
INNER JOIN attendees ON meetings.id = attendees.meeting_id
GROUP BY meetings.id
LIMIT 2;

9-

