
SELECT *
FROM meetings
WHERE room_id = 'Mayotte'
ORDER BY date DESC
LIMIT 10;


--2 
SELECT employees.lastname, employees.firstname, (payrolls.salary + payrolls.bonus) AS total_salary
FROM payrolls
INNER JOIN employees ON payrolls.employee_id = employees.id
WHERE MONTH(payrolls.date) = 4 AND YEAR(payrolls.date) = 2024
ORDER BY total_salary DESC
LIMIT 1;

--3 
SELECT COUNT(*) AS number_of_meetings
FROM attendees
INNER JOIN employees ON attendees.employee_id = employees.id
WHERE employees.firstname = 'Cedrick' AND employees.lastname = 'Waters';


--4



SELECT employees.lastname, employees.firstname, employees.email
FROM employees
INNER JOIN employees AS manager ON employees.manager_id = manager.id
WHERE manager.firstname = 'Joey' AND manager.lastname = 'Crooks';



SELECT employees.lastname, employees.firstname, employees.birthday
FROM employees
WHERE employees.job_title = 'Director' 
  AND YEAR(CURDATE()) - YEAR(employees.birthday) BETWEEN 25 AND 30;


--7
SELECT buildings.name, buildings.address, COUNT(rooms.id) AS number_of_rooms
FROM buildings
INNER JOIN rooms ON buildings.id = rooms.building_id
WHERE rooms.floor = 4
GROUP BY buildings.id
ORDER BY number_of_rooms DESC
LIMIT 1;

--8
SELECT meetings.date, rooms.name AS room_name, rooms.floor, buildings.address, COUNT(attendees.id) AS number_of_attendees
FROM meetings
INNER JOIN rooms ON meetings.room_id = rooms.id
INNER JOIN buildings ON rooms.building_id = buildings.id
INNER JOIN attendees ON meetings.id = attendees.meeting_id
GROUP BY meetings.id
ORDER BY number_of_attendees DESC
LIMIT 2;

--9
SELECT buildings.country, SUM(payrolls.salary + payrolls.bonus) AS total_expenses
FROM payrolls
INNER JOIN employees ON payrolls.employee_id = employees.id
INNER JOIN departments ON employees.department_id = departments.id
INNER JOIN buildings ON departments.building_id = buildings.id
WHERE YEAR(payrolls.date) = 2024
GROUP BY buildings.country;
