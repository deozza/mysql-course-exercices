<?php

require_once 'vendor/autoload.php';

/**
 * @return PDO
 * @throws PDOException
 */
function getDbConnexion(): PDO {
    $host = 'mysql-course-db';
    $db = 'company';
    $user = 'root';
    $password = 'password';

    $dsn = "mysql:host=$host;dbname=$db;charset=UTF8";

    return new PDO($dsn, $user, $password);
}

$pdo = getDbConnexion();

$faker = Faker\Factory::create();

$buildings = [];
$rooms = [];
$departments = [];
$employees = [];
$superiors = [];
$payrolls = [];
$meetings = [];
$attendees = [];
$days_off = [];

for($i = 0; $i < 25; $i++) {

    $building = [
        'name' => $faker->company,
        'address' => $faker->address,
        'city' => $faker->city,
        'country' => $faker->country,
    ];

    $query = $pdo->prepare('INSERT INTO buildings (name, address, city, country) VALUES (:name, :address, :city, :country)');
    $query->execute($building);

    $buildings[] = $building;
}

foreach($buildings as $id => $building) {
    for($i = 0; $i < 500; $i++) {
        $room = [
            'name' => $faker->word,
            'floor' => $faker->numberBetween(0, 10),
            'building_id' => $id + 1,
        ];

        $query = $pdo->prepare('INSERT INTO rooms (name, floor, building_id) VALUES (:name, :floor, :building_id)');
        $query->execute($room);

        $rooms[] = $room;
    }
}

foreach($buildings as $id => $building) {
    for($i = 0; $i < 10; $i++) {
        $department = [
            'name' => $faker->word,
            'building_id' => $id + 1,
        ];

        $query = $pdo->prepare('INSERT INTO departments (name, building_id) VALUES (:name, :building_id)');
        $query->execute($department);

        $departments[] = $department;
    }
}

foreach($departments as $id => $department) {
    for($i = 0; $i < 100; $i++) {
        $firstname = $faker->firstName;
        $lastname = $faker->lastName;
        $email = strtolower($firstname . '.' . $lastname . random_int(1, 99) .  '@' . $faker->freeEmailDomain);
        $employee = [
            'firstname' => $firstname,
            'lastname' => $lastname,
            'email' => $email,
            'date_of_birth' => $faker->dateTimeBetween('-60 years', '-18 years')->format('Y-m-d'),
            'department_id' => $id + 1,
            'superior_id' => null,
        ];

        if(random_int(1, 10) > 7 || count($superiors) === 0) {
            $superiors[] = $employee;
        }else{
            $superior = $superiors[random_int(0, count($superiors) - 1)];
            $superiorIdQuery = $pdo->prepare('SELECT id FROM employees WHERE email = :email');
            $superiorIdQuery->execute(['email' => $superior['email']]);
            $superiorId = $superiorIdQuery->fetchColumn();
            $employee['superior_id'] = $superiorId;
        }

        $query = $pdo->prepare('INSERT INTO employees (firstname, lastname, email, date_of_birth, department_id, superior_id) VALUES (:firstname, :lastname, :email, :date_of_birth, :department_id, :superior_id)');
        $query->execute($employee);

        $employees[] = $employee;
    }
}

foreach($employees as $id => $employee) {

    $payrollDate = $faker->dateTimeBetween('-1 years', 'now')->format('Y-m');
    $salary = $faker->numberBetween(2000, 5000);

    while($payrollDate < date('Y-m')) {
        $payroll = [
            'salary' => $salary,
            'bonus' => 0,
            'employee_id' => $id + 1,
            'date' => $payrollDate . '-27',
        ];

        if(random_int(1, 10) > 8) {
            $payroll['bonus'] = $faker->numberBetween(0, 1000);
        }

        $query = $pdo->prepare('INSERT INTO payrolls (salary, bonus, employee_id, date) VALUES (:salary, :bonus, :employee_id, :date)');
        $query->execute($payroll);

        $payrolls[] = $payroll;

        $payrollDate = date('Y-m', strtotime($payrollDate . ' +1 month'));
    }
}

// foreach($employees as $id => $employee) {
//     for($i = 0; $i < random_int(0, 10); $i++) {

//         $start_date = $faker->dateTimeBetween('-1 year', '+3 months')->format('Y-m-d');
//         $end_date = $faker->dateTimeBetween($start_date, '+21 days')->format('Y-m-d');

//         $day_off = [
//             'start_date' => $start_date,
//             'end_date' => $end_date,
//             'employee_id' => $id + 1,
//         ];

//         $query = $pdo->prepare('INSERT INTO days_off (start_date, end_date, employee_id) VALUES (:start_date, :end_date, :employee_id)');
//         $query->execute($day_off);
//         $days_off[] = $day_off;
//     } 
// }

foreach($rooms as $id => $room) {
    for($i = 0; $i < random_int(0, 10); $i++) {
        $meeting = [
            'date' => $faker->dateTimeBetween('-1 year', '+1 year')->format('Y-m-d H:i:s'),
            'room_id' => $id + 1,
        ];

        $query = $pdo->prepare('INSERT INTO meetings (date, room_id) VALUES (:date, :room_id)');
        $query->execute($meeting);

        $meetings[] = $meeting;
    }
}

foreach($meetings as $id => $meeting) {
    for($i = 0; $i < random_int(0, 10); $i++) {
        $attendee = [
            'employee_id' => $faker->numberBetween(1, count($employees)),
            'meeting_id' => $id + 1,
        ];

        $query = $pdo->prepare('INSERT INTO attendees (employee_id, meeting_id) VALUES (:employee_id, :meeting_id)');
        $query->execute($attendee);

        $attendees[] = $attendee;
    }
}