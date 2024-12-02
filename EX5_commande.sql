-- afficher les 10 dernières réunions qui ont eu lieu à Mayotte
SELECT meetings.id, meetings.date, rooms.name, buildings.country
FROM meetings
JOIN rooms ON meetings.room_id = rooms.id
JOIN buildings ON rooms.building_id = buildings.id
WHERE buildings.country = 'Mayotte'
ORDER BY meetings.date DESC
LIMIT 10;

-- afficher le salaire total le plus élevé (salaire + prime) du mois d'avril 2024, ainsi que le nom et le prénom du travailleur correspondant
SELECT employees.firstname, employees.lastname, (payrolls.salary + payrolls.bonus) AS total_salary
FROM payrolls
JOIN employees ON payrolls.employee_id = employees.id
WHERE MONTH(payrolls.date) = 4 AND YEAR(payrolls.date) = 2024
ORDER BY total_salary DESC
LIMIT 1;

-- afficher le nombre de réunions auxquelles Cedrick Waters a participé.
SELECT COUNT(attendees.meeting_id) AS meeting_count
FROM attendees
JOIN employees ON attendees.employee_id = employees.id
WHERE employees.firstname = 'Cedrick' AND employees.lastname = 'Waters';

-- vérifiez si la chambre "quam" du bâtiment "Bode, Blanda et Ebert" est réservée le 10 novembre 2024 entre 12h00 et 18h00
SELECT COUNT(*) > 0 AS is_reserved
FROM meetings
JOIN rooms ON meetings.room_id = rooms.id
JOIN buildings ON rooms.building_id = buildings.id
WHERE rooms.name = 'quam' 
AND buildings.name = 'Bode, Blanda and Ebert'
AND meetings.date >= '2024-11-10 12:00:00' 
AND meetings.date <= '2024-11-10 18:00:00';

-- afficher le nom, le prénom et l'email des travailleurs sous Joey Crooks
SELECT employees.firstname, employees.lastname, employees.email
FROM employees
WHERE employees.superior_id = (SELECT id FROM employees WHERE firstname = 'Joey' AND lastname = 'Crooks');

-- afficher le nom, le prénom et la date de naissance de tous les administrateurs âgés de 25 à 30 ans
-- SOLUTIONS A
SELECT employees.firstname, employees.lastname, employees.date_of_birth
FROM employees
JOIN departments ON employees.department_id = departments.id
WHERE departments.name = 'directors' AND YEAR(CURDATE()) - YEAR(employees.date_of_birth) BETWEEN 25 AND 30;
-- SOLUTIONS B
SELECT employees.firstname, employees.lastname, employees.date_of_birth
FROM employees
JOIN departments ON employees.department_id = departments.id
WHERE departments.name = 'directors'
AND (DATEDIFF(CURDATE(), employees.date_of_birth) / 365) BETWEEN 25 AND 30;

-- afficher le nom et l'adresse de l'immeuble ayant le plus de pièces à son 4ème étage
SELECT buildings.name, buildings.address
FROM buildings
JOIN rooms ON buildings.id = rooms.building_id
WHERE rooms.floor = 4
GROUP BY buildings.id
ORDER BY COUNT(rooms.id) DESC
LIMIT 1;

-- afficher la date, le nom de la salle, le numéro d'étage, l'adresse du bâtiment des 2 réunions avec le plus de participants
SELECT meetings.date, rooms.name AS room_name, rooms.floor, buildings.address
FROM meetings
JOIN rooms ON meetings.room_id = rooms.id
JOIN buildings ON rooms.building_id = buildings.id
JOIN (SELECT meeting_id, COUNT(employee_id) AS participant_count
      FROM attendees
      GROUP BY meeting_id
      ORDER BY participant_count DESC
      LIMIT 2) AS top_meetings ON meetings.id = top_meetings.meeting_id;

-- afficher les dépenses totales en salaires en 2024 par pays
SELECT buildings.country, SUM(payrolls.salary + payrolls.bonus) AS total_expenses
FROM payrolls
JOIN employees ON payrolls.employee_id = employees.id
JOIN departments ON employees.department_id = departments.id
JOIN buildings ON departments.building_id = buildings.id
WHERE YEAR(payrolls.date) = 2024
GROUP BY buildings.country;