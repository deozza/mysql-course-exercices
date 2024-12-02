CREATE DATABASE bank;
USE bank;

CREATE TABLE clients (
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255) PRIMARY KEY,
);

CREATE TABLE account_types (
    label VARCHAR(255) PRIMARY KEY,
);

CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    balance FLOAT(11,2),
    type VARCHAR(255),
    client VARCHAR(255),
    FOREIGN KEY (type) REFERENCES account_types(label),
    FOREIGN KEY (client) REFERENCES clients(email)
);

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    from_account VARCHAR(255),
    to_account VARCHAR(255),
    amount FLOAT(6,2),
    date DATE,
    is_validated TINYINT(1),
    FOREIGN KEY (from_account) REFERENCES accounts(id),
    FOREIGN KEY (to_account) REFERENCES accounts(id)
);