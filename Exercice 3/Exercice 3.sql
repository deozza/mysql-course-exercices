-- Script SQL pour l'Exercice 3

-- Table : clients
CREATE TABLE clients (
    email VARCHAR(255) PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

-- Table : account_types
CREATE TABLE account_types (
    label VARCHAR(50) PRIMARY KEY
);

-- Table : accounts
CREATE TABLE accounts (
    id VARCHAR(255) PRIMARY KEY,
    balance FLOAT(11,2) NOT NULL,
    type VARCHAR(50),
    client VARCHAR(255),
    FOREIGN KEY (type) REFERENCES account_types(label),
    FOREIGN KEY (client) REFERENCES clients(email)
);

-- Table : transactions
CREATE TABLE transactions (
    id VARCHAR(255) PRIMARY KEY,
    from_account VARCHAR(255),
    to_account VARCHAR(255),
    amount FLOAT(6,2) NOT NULL,
    date DATE NOT NULL,
    is_validated TINYINT(1) NOT NULL,
    FOREIGN KEY (from_account) REFERENCES accounts(id),
    FOREIGN KEY (to_account) REFERENCES accounts(id)
);
