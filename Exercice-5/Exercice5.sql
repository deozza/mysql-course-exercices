
1. display the last 10 meetings that took place in Mayotte

SELECT * FROM buildings 
WHERE location = 'Mayotte' 
ORDER BY date DESC 
LIMIT 10;


2. display the higher total salary (salary + bonus) of the month of April 2024, and the lastname and firstname of the corresponding worker

SELECT lastname, firstname, (salary + bonus) AS total_salary
FROM payrolls
WHERE MONTH(date) = 4 AND YEAR(date) = 2024
ORDER BY total_salary DESC
LIMIT 1;


3. display the number of meetings Cedrick Waters attended.

SELECT COUNT(*) AS meeting_count
FROM meeting 
WHERE worker_id = (SELECT id FROM workers WHERE lastname = 'Waters' AND firstname = 'Cedrick');


4. check if the room "quam" from the building "Bode, Blanda and Ebert" is reserved November 10th 2024 between 12:00 and 18:00

SELECT *
FROM room_reservations
WHERE room_name = 'quam'
  AND building_name = 'Bode, Blanda and Ebert'
  AND reservation_date = '2024-11-10'
  AND (
      (start_time <= '12:00' AND end_time > '12:00') OR 
      (start_time < '18:00' AND end_time >= '18:00') OR
      (start_time >= '12:00' AND end_time <= '18:00')
  );


5. display the lastname, firstname and email of the workers under Joey Crooks

SELECT lastname, firstname, email
FROM employees
WHERE manager_id = (SELECT id FROM workers WHERE lastname = 'Crooks' AND firstname = 'Joey');


6. display the lastname, firstname and birthday of any directors who are between 25 and 30 years old

SELECT lastname, firstname, birthday
FROM employees
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 25 AND 30;

7. display the name and the address of the building with the most of rooms at its 4th floor

SELECT name, address
FROM rooms
WHERE floor = 4
GROUP BY buildings, address
ORDER BY COUNT(*) DESC
LIMIT 1;


8. display the date, the name of the room, the floor number, the buildings address of the 2 meetings with the most attendants

SELECT meeting_date, room_name, floor, building_address, COUNT(attendance_id) AS participant_count
FROM meetings
JOIN rooms ON meetings.room_id = rooms.id
JOIN meeting_attendance ON meetings.id = meeting_attendance.meeting_id
GROUP BY meetings.id
ORDER BY participant_count DESC
LIMIT 2;


9. display the total expenses in salary in 2024 by countries

SELECT country, SUM(salary) AS total_salary
FROM workers
WHERE YEAR(payment_date) = 2024
GROUP BY country;

