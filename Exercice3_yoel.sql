
DROP DATABASE IF EXISTS bank;


CREATE DATABASE bank;
USE bank;


CREATE TABLE clients (
    email VARCHAR(255) PRIMARY KEY, -- 
    firstname VARCHAR(255) NOT NULL, -- Prénom client
    lastname VARCHAR(255) NOT NULL, -- Nom client
    phone VARCHAR(255) -- Numéro de téléphone client
);


CREATE TABLE account_types (
    label VARCHAR(255) PRIMARY KEY -- Identifiant unique pour chaque type de compte
);


CREATE TABLE accounts (
    id VARCHAR(255) PRIMARY KEY, -- 
    balance FLOAT(11,2) NOT NULL, -- 
    type VARCHAR(255), -- Type de compte
    client VARCHAR(255), -- cela corespond Référence au client propriétaire du compte
    FOREIGN KEY (type) REFERENCES account_types(label), --  c'est la  Clé étrangère vers account_types
    FOREIGN KEY (client) REFERENCES clients(email) --  c'est la  Clé étrangère vers clients
);

CREATE TABLE transactions (
    id VARCHAR(255) PRIMARY KEY, -- 
    from_account VARCHAR(255), -- 
    to_account VARCHAR(255), -- 
    amount FLOAT(6,2) NOT NULL, -- 
    date DATE NOT NULL, -- 
    is_validated TINYINT(1) NOT NULL, -- corespond a la transaction si elle est validée ou pas (0 ou 1)
    FOREIGN KEY (from_account) REFERENCES accounts(id), -- c'est la clé étrangère qui va vers accounts 
    FOREIGN KEY (to_account) REFERENCES accounts(id) --  c'est la Clé étrangère vers accounts (destinataire)
);
