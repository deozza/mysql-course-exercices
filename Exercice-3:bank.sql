//creer la base de donnée

CREATE DATABASE exercice3;

USE exercice3; 

CREATE TABLE clients (
    email VARCHAR PRIMARY KEY AUTO_INCREMENT, 
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR (255) NOT NULL,
    phone VARCHAR () NOT NULL,
);  

CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    balance FLOAT(11,2) NOT NULL,
    FOREIGN KEY (type) REFERENCES accounts_types(label),
    FOREIGN KEY (client) REFERENCES clients(email)
);  

CREATE TABLE transactions (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    FOREIGN KEY (from_account) REFERENCES accounts(id),
    FOREIGN KEY (to_account) REFERENCES clients(email),
    amount FLOAT(6,2) NOT NULL,
    date DATE NOT NULL,
    is_validated TINYINT(1)

);  

CREATE TABLE transactions (
    label VARCHAR PRIMARY KEY AUTO_INCREMENT
);  

