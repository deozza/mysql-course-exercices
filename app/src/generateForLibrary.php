<?php

require_once 'vendor/autoload.php';

/**
 * @return PDO
 * @throws PDOException
 */
function getDbConnexion(): PDO {
    $host = 'mysql-course-db';
    $db = 'library';
    $user = 'root';
    $password = 'password';

    $dsn = "mysql:host=$host;dbname=$db;charset=UTF8";

    return new PDO($dsn, $user, $password);
}

$pdo = getDbConnexion();

$faker = Faker\Factory::create();

$authors = [];
$editors = [];
$members = [];
$books = [];
$book_editions = [];

# create authors
for($i = 0; $i < 5000; $i++) {
    $firstname = $faker->firstName;
    $lastname = $faker->lastName;
    $country = $faker->country;
    $dateOfBirth = $faker->dateTimeBetween('-2000 years', '-15 years')->format('Y-m-d');

    $authors[] = [
        'firstname' => $firstname,
        'lastname' => $lastname,
        'country' => $country,
        'date_of_birth' => $dateOfBirth
    ];

    $dateOfDeath = date_add(date_create($dateOfBirth), date_interval_create_from_date_string(mt_rand(30, 100) . ' years'))->format('Y-m-d');

    if($dateOfDeath > date('Y-m-d')) {
        $dateOfDeath = null;
    }

    $authors[$i]['date_of_death'] = $dateOfDeath;

    $query = $pdo->prepare('INSERT INTO authors (firstname, lastname, country, date_of_birth, date_of_death) VALUES (:firstname, :lastname, :country, :date_of_birth, :date_of_death)');
    $query->execute([
        'firstname' => $firstname,
        'lastname' => $lastname,
        'country' => $country,
        'date_of_birth' => $dateOfBirth,
        'date_of_death' => $dateOfDeath ?? null
    ]);
}

#create editors
for($i = 0; $i < 30; $i++) {
    $editor = $faker->company;

    $editors[] = [
        'name' => $editor
    ];

    $query = $pdo->prepare('INSERT INTO editors (name) VALUES (:name)');
    $query->execute([
        'name' => $editor
    ]);
}

#create members
for($i = 0; $i < 1000; $i++) {
    $firstname = $faker->firstName;
    $lastname = $faker->lastName;
    $email = $firstname . '.' . $lastname . random_int(1, 2000) . '@' . $faker->freeEmailDomain;
    $dateOfBirth = $faker->date('Y-m-d');
    $registered = mt_rand(0, 100) > 50 ? 1 : 0;

    $members[] = [
        'firstname' => $firstname,
        'lastname' => $lastname,
        'email' => $email,
        'date_of_birth' => $dateOfBirth,
        'registered' => $registered
    ];

    $query = $pdo->prepare('INSERT INTO members (firstname, lastname, email, date_of_birth, registered) VALUES (:firstname, :lastname, :email, :date_of_birth, :registered)');
    $query->execute([
        'firstname' => $firstname,
        'lastname' => $lastname,
        'email' => $email,
        'date_of_birth' => $dateOfBirth,
        'registered' => $registered
    ]);
}

#create books
foreach($authors as $author_id => $author) {

    for($i = 0; $i < mt_rand(1, 5); $i++) {
        $title = $faker->sentence(6);
        $year = $faker->dateTimeBetween($author['date_of_birth'], $author['date_of_death'] ?? 'now')->format('Y');
    
        $query = $pdo->prepare('INSERT INTO books (title, author_id, year) VALUES (:title, :author_id, :year)');
        $query->execute([
            'title' => $title,
            'author_id' => $author_id+1,
            'year' => $year,
        ]);

        $books[] = [
            'title' => $title,
            'author_id' => $author_id,
            'year' => $year
        ];
    }
}

#create editions
foreach($books as $book_id=>$book) {
    for($i = 0; $i < mt_rand(0, 10); $i++) {
        $isbn = $faker->isbn13;
        $publication_date = $faker->dateTimeBetween($book['year'] . '-01-01', 'now')->format('Y-m-d');
        $editor_id = mt_rand(0, count($editors) - 1);

        $query = $pdo->prepare('INSERT INTO book_editions (isbn, book_id, editor_id, publication_date) VALUES (:isbn, :book_id, :editor_id, :publication_date)');
        $query->execute([
            'isbn' => $isbn,
            'book_id' => $book_id+1,
            'editor_id' => $editor_id+1,
            'publication_date' => $publication_date
        ]);

        $book_editions[] = [
            'isbn' => $isbn,
            'book_id' => $book_id,
            'editor_id' => $editor_id,
            'publication_date' => $publication_date
        ];
    }
}


$editionBookNotReturned = [];

#create loans
foreach($book_editions as $book_edition) {
    for($i = 0; $i < mt_rand(0, 25); $i++) {

        if(in_array([$book_edition['isbn']], $editionBookNotReturned)) {
            continue;
        }

        if(mt_rand(0, 100) > 50) {
            continue;
        }

        $member_id = mt_rand(0, count($members) - 1);


        if($members[$member_id]['registered'] === 0) {
            continue;
        }

        $loan_date = $faker->dateTimeBetween('-10 years', 'now')->format('Y-m-d');
        $return_date = $faker->dateTimeBetween($loan_date, date_add(date_create($loan_date), date_interval_create_from_date_string('30 days')))->format('Y-m-d');

        $returned = mt_rand(0, 100) > 75 ? 0 : 1;

        if($returned === 0 && $return_date < date('Y-m-d')) {
            $editionBookNotReturned[] = [
                $book_edition['isbn'],
            ];
        }

        $query = $pdo->prepare('INSERT INTO loans (member_id, book_edition_isbn, loan_date, return_date, is_returned) VALUES (:member_id, :book_edition_isbn, :loan_date, :return_date, :is_returned)');
        $query->execute([
            'member_id' => $member_id+1,
            'book_edition_isbn' => $book_edition['isbn'],
            'loan_date' => $loan_date,
            'return_date' => $return_date,
            'is_returned' => $returned
        ]);
    }
}