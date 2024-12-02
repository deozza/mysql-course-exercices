SHOW DATABASES;


USE company;

SHOW tables; 

1- afficher les 10 dernières réunions qui ont eu lieu à Mayotte

SELECT m.id, m.date, r.name AS room_name, b.name AS building_name
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
WHERE b.country = 'Mayotte'
ORDER BY m.date DESC
LIMIT 10;

2-afficher le salaire total le plus élevé (salaire + prime) du mois davril 2024, ainsi que le nom et le prénom du travailleur correspondant

SELECT e.lastname, e.firstname, (p.salary + p.bonus) AS total_salary
FROM payrolls p
JOIN employees e ON p.employee_id = e.id
WHERE DATE_FORMAT(p.date, '%Y-%m') = '2024-04'
ORDER BY total_salary DESC
LIMIT 1;

3-afficher le nombre de réunions auxquelles Cedrick Waters a participé.

SELECT e.firstname, e.lastname, COUNT(a.meeting_id) AS total_meetings
FROM attendees a
JOIN employees e ON a.employee_id = e.id
WHERE e.firstname = 'Cedrick' AND e.lastname = 'Waters'
GROUP BY e.firstname, e.lastname;

4- vérifiez si la chambre "quam" du bâtiment "Bode, Blanda et Ebert" est réservée le 10 novembre 2024 entre 12h00 et 18h00

SELECT *
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
WHERE r.name = 'quam' AND b.name = 'Bode, Blanda and Ebert'
  AND DATE(m.date) = '2024-11-10'
  AND (TIME(m.date) BETWEEN '12:00:00' AND '18:00:00');


5-afficher le nom, le prénom et lemail des travailleurs sous Joey Crooks

SELECT e.lastname, e.firstname, e.email
FROM employees e
JOIN employees manager ON e.superior_id = manager.id
WHERE manager.firstname = 'Joey' AND manager.lastname = 'Crooks';


6- afficher le nom, le prénom et la date de naissance de tous les administrateurs âgés de 25 à 30 ans






7- afficher le nom et l'adresse de l'immeuble ayant le plus de pièces à son 4ème étage

SELECT b.name, b.address
FROM buildings b
JOIN rooms r ON b.id = r.building_id
WHERE r.floor = 4
GROUP BY b.id
ORDER BY COUNT(r.id) DESC
LIMIT 1;




8-afficher la date, le nom de la salle, le numéro d'étage, l'adresse du bâtiment des 2 réunions avec le plus de participants

SELECT m.date, r.name AS room_name, r.floor, b.address
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
JOIN attendees a ON m.id = a.meeting_id
GROUP BY m.id
ORDER BY COUNT(a.id) DESC
LIMIT 2;



9- afficher les dépenses totales en salaires en 2024 par pays

SELECT b.country, SUM(p.salary) AS total_salaries
FROM payrolls p
JOIN employees e ON p.employee_id = e.id
JOIN buildings b ON e.department_id = b.id
WHERE YEAR(p.date) = 2024
GROUP BY b.country;






