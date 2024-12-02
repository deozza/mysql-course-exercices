
DROP DATABASE IF EXISTS Bank;
CREATE DATABASE Bank;

USE Bank;

CREATE TABLE clients ( 
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL, PRIMARY KEY
);

CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    balance float(11,2) NOT NULL,
    type VARCHAR(255) NOT NULL
    client VARCHAR(255) NOT NULL
    FOREIGN KEY (client) REFERENCES clients(id)
    FOREIGN KEY (type) REFERENCES type(id)
);

CREATE TABLE transactions (
    id VARCHAR(255) AUTO_INCREMENT PRIMARY KEY,
    from_account VARCHAR NOT NULL,
    to_account VARCHAR NOT NULL,
    amount Float(6,2) NOT NULL,
    date date NOT NULL,
    is_validated TINYINT(1)	 NOT NULL,
    FOREIGN KEY (from_account) REFERENCES from_account(id)
    FOREIGN KEY (to_account) REFERENCES to_account(id)
);

CREATE TABLE account_types (
    label VARCHAR(255) AUTO_INCREMENT PRIMARY KEY,

);
