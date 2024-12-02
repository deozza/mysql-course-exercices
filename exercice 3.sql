CREATE DATABASE bank;
USE bank;

CREATE TABLE clients (
    id INT PRIMARY KEY AUTO_INCREMENT,  
    firstname VARCHAR(255) NOT NULL,    
    lastname VARCHAR(255) NOT NULL,     
    phone VARCHAR(20),                  
    email VARCHAR(255) NOT NULL UNIQUE  
);

CREATE TABLE account_types (
    label VARCHAR(255) PRIMARY KEY   
);

CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    account_type VARCHAR(255) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (account_type) REFERENCES account_types(label),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE transactions (
    id VARCHAR(255) PRIMARY KEY,
    from_account VARCHAR(255) NOT NULL,
    to_account VARCHAR(255) NOT NULL,
    amount FLOAT(6, 2) NOT NULL,
    date DATE NOT NULL,
    is_validated TINYINT(1) NOT NULL,      
    FOREIGN KEY (from_account) REFERENCES accounts(id),
    FOREIGN KEY (to_account) REFERENCES accounts(id) 
);








