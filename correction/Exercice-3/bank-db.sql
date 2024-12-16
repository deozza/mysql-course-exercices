CREATE DATABASE bank;

USE bank;

CREATE TABLE clients(
    email VARCHAR(255) PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    phone VARCHAR(13) NOT NULL
);

CREATE TABLE account_types (
    label VARCHAR(255) PRIMARY KEY
);

CREATE TABLE accounts(
    id VARCHAR(255) PRIMARY KEY,
    balance FLOAT(11,2) DEFAULT 0,
    client VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    FOREIGN KEY (client) REFERENCES clients(email),
    FOREIGN KEY (type) REFERENCES account_types(label)
);

CREATE TABLE transactions(
    id VARCHAR(255) PRIMARY KEY,
    from_account VARCHAR(255) NOT NULL,
    to_account VARCHAR(255) NOT NULL,
    amount FLOAT(6,2) NOT NULL,
    date DATE DEFAULT CURDATE()
);