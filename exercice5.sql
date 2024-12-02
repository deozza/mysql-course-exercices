## 1 afficher les 10 dernières réunions qui ont eu lieu à Mayotte

SELECT meetings.date, rooms.name AS room_name, buildings.name AS building_name, buildings.address
FROM meetings
JOIN rooms ON meetings.room_id = rooms.id
JOIN buildings ON rooms.building_id = buildings.id
WHERE buildings.country = 'Mayotte'
ORDER BY meetings.date DESC
LIMIT 10;

## 2 afficher le salaire total plus élevé (salaire et bonus) du mois d'avril 2024, ainsi que le dernier nom et le prénom du travailleur correspondant

SELECT employees.lastname, employees.firstname, (payrolls.salary + payrolls.bonus) AS total_salary
FROM payrolls
JOIN employees ON payrolls.employee_id = employees.id
WHERE MONTH(payrolls.date) = 4 AND YEAR(payrolls.date) = 2024
ORDER BY total_salary DESC
LIMIT 1;

## 3 afficher le nombre de réunions à laquelle Cedrick Waters ont assisté

SELECT COUNT(attendees.id) AS meetings_attended
FROM attendees
JOIN employees ON attendees.employee_id = employees.id
WHERE employees.firstname = 'Cedrick'
AND employees.lastname = 'Waters';

## 4 Vérifiez si la salle "quam" du bâtiment "Bode, Blanda et Ebert" est réservée le 10 novembre 2024 entre 12h00 et 18h00


## 5 afficher le nom de famille, le prénom et l'e-mail des travailleurs sous Joey Crooks




## 6 afficher le nom de famille, le nom de prénom et l'anniversaire de tous les réalisateurs âgés de 25 à 30 ans

## 7 afficher le nom et l'adresse du bâtiment avec la plupart des pièces à son 4e étage
SELECT buildings.name, buildings.address
FROM buildings
JOIN rooms ON buildings.id = rooms.building_id
WHERE rooms.floor = 4
GROUP BY buildings.id
ORDER BY COUNT(rooms.id) DESC
LIMIT 1;


## 8 afficher la date, le nom de la salle, le numéro d'étage, l'adresse des 2 réunions avec le plus grand nombre d'accompagnateurs

SELECT meetings.date, rooms.name AS room_name, rooms.floor, buildings.address, COUNT(attendees.id) AS attendee_count
FROM meetings
JOIN rooms ON meetings.room_id = rooms.id
JOIN buildings ON rooms.building_id = buildings.id
JOIN attendees ON meetings.id = attendees.meeting_id
GROUP BY meetings.id, rooms.name, rooms.floor, buildings.address
ORDER BY attendee_count DESC
LIMIT 2;


## 9 afficher le total des dépenses de salaire en 2024 par pays

SELECT buildings.country, SUM(payrolls.salary + payrolls.bonus) AS total_expenses
FROM payrolls
JOIN employees ON payrolls.employee_id = employees.id
JOIN departments ON employees.department_id = departments.id
JOIN buildings ON departments.building_id = buildings.id
WHERE YEAR(payrolls.date) = 2024
GROUP BY buildings.country;
