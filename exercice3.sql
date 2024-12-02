
CREATE DATABASE bank;


USE bank;


CREATE TABLE clients(
    email VARCHAR(255) PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    phone VARCHAR(255)
);

s
CREATE TABLE accounts(
    id VARCHAR(255) PRIMARY KEY,
    balance FLOAT(11,2),
    type VARCHAR(255),
    client_email VARCHAR(255),
    
    FOREIGN KEY (type) REFERENCES account_types(label),
    FOREIGN KEY (client_email) REFERENCES clients(email)
);

CREATE TABLE transactions(
    id VARCHAR(255) PRIMARY KEY,
    amount FLOAT(6,2),
    from_account VARCHAR(255),
    to_account VARCHAR(255),
    date DATE,
    is_validated TINYINT(1),
    FOREIGN KEY (from_account) REFERENCES accounts(id),
    FOREIGN KEY (to_account) REFERENCES accounts(id)
);

CREATE TABLE account_types (
    label VARCHAR(255) PRIMARY KEY
);
