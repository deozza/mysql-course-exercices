DROP DATABASE IF EXISTS library;

CREATE DATABASE library;
USE library;

CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    date_of_death DATE
);

CREATE TABLE editors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    registered BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE book_editions (
    isbn VARCHAR(255) NOT NULL PRIMARY KEY,
    book_id INT NOT NULL,
    editor_id INT NOT NULL,
    publication_date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (editor_id) REFERENCES editors(id)
);

CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_edition_isbn VARCHAR(255) NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE NOT NULL,
    is_returned BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (book_edition_isbn) REFERENCES book_editions(isbn),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

