/* 1. display the last 10 meetings that took place in Mayotte */

SELECT meetings.* FROM meetings
INNER JOIN rooms ON rooms.id = meetings.room_id
INNER JOIN buildings ON buildings.id = rooms.building_id
WHERE buildings.country = 'Mayotte'
ORDER BY meetings.date DESC
LIMIT 10;

/* 2. display the higher total salary (salary + bonus) of the month of April 2024, and the lastname and firstname of the corresponding worker */

SELECT employees.lastname, employees.firstname, (payrolls.salary + payrolls.bonus) AS total FROM payrolls
INNER JOIN employees ON payrolls.employee_id = employees.id
WHERE MONTH(payrolls.date) = 4 AND YEAR(payrolls.date) = 2024
ORDER BY total DESC
LIMIT 1;

/* 3. display the number of meetings Cedrick Waters attended. */

SELECT COUNT(*) FROM attendees
INNER JOIN employees ON attendees.employee_id = employees.id
WHERE employees.firstname = 'Cedrick' AND employees.lastname = 'Waters';

/* 4. check if the room "quam" from the building "Bode, Blanda and Ebert" is reserved November 10th 2024 between 12:00 and 18:00 */

SELECT * FROM rooms
INNER JOIN buildings ON buildings.id = rooms.building_id
INNER JOIN meetings ON meetings.room_id = rooms.id
WHERE buildings.name = 'Bode, Blanda and Ebert' AND rooms.name = 'quam' AND meetings.date BETWEEN '2024-11-10 12:00:00' AND '2024-11-10 18:00:00';

/* 5. display the lastname, firstname and email of the workers under Joey Crooks */

SELECT employees.lastname, employees.firstname, employees.email FROM employees
INNER JOIN employees ON employees.superior_id = superior.id
WHERE superior.lastname = 'Crooks' AND superior.firstname = 'Joey'; 


/* 6. display the lastname, firstname and birthday of any directors who are between 25 and 30 years old */

SELECT employees.lastname, employees.firstname, employees.date_of_birth
FROM employees
INNER JOIN departments ON employees.department_id = departments.id
WHERE departments.job LIKE '% Director %'
  AND TIMESTAMPDIFF(YEAR, employees.date_of_birth, CURDATE()) BETWEEN 25 AND 30;

/* 7. display the name and the address of the building with the most of rooms at its 4th floor */ 

SELECT buildings.* FROM buildings
INNER JOIN rooms ON rooms.building_id = buildings.id
WHERE rooms.floor = 4;


/* 8. display the date, the name of the room, the floor number, the building's address of the 2 meetings with the most attendants */

SELECT meetings.date, rooms.name,rooms.floor, buildings.address
FROM meetings
JOIN rooms ON meetings.room_id = rooms.id
JOIN buildings ON rooms.building_id = buildings.id
JOIN attendees ON meetings.id = attendees.meeting_id
GROUP BY meetings.id
ORDER BY COUNT(attendees.employee_id) DESC
LIMIT 2;

/* 9. display the total expenses in salary in 2024 by countries */

SELECT buildings.country, SUM(payrolls.salary) AS total
FROM payrolls
JOIN employees ON payrolls.employee_id = employees.id
JOIN departments ON employees.department_id = departments.id
JOIN buildings ON departments.building_id = buildings.id
WHERE YEAR(payrolls.date) = 2024
GROUP BY buildings.country;