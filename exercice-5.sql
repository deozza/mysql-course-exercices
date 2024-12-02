/* display the last 10 meetings that took place in Mayotte*/

SELECT date FROM meetings ORDER BY  DESC LIMIT 10;

/*display the higher total salary (salary + bonus) of the month of April 2024, and the lastname and firstname of the corresponding worker*/



/*display the number of meetings Cedrick Waters attended.*/

SELECT lastname, firstname, COUNT(date) FROM employees  INNER JOIN meetings ON lastname.id = meeting.date WHERE employees.firstname = 'Cedrick' AND employees.lastname = 'Waters';

/*check if the room "quam" from the building "Bode, Blanda and Ebert" is reserved November 10th 2024 between 12:00 and 18:00*/



/*display the lastname, firstname and email of the workers under Joey Crooks*/

SELECT lastname, firstname, email FROM employees WHERE employees.firstname = 'Joey' AND employees.lastname = 'Crooks';

/*display the lastname, firstname and birthday of any directors who are between 25 and 30 years old*/

SELECT lastname, firstname, date_of_birth FROM employees WHERE employees.date_of_birth between 25 and 30;

/*display the name and the address of the building with the most of rooms at its 4th floor*/

SELECT floor, name, adress FROM 

/*display the date, the name of the room, the floor number, the building's address of the 2 meetings with the most attendants*/



/*display the total expenses in salary in 2024 by countries*/

SELECT salary, date, COUNT(salary), as nb_salary
FROM payrolls
GROUP BY payrolls
ORDER BY nb_salary DESC
LIMIT 10;