-- https://gist.github.com/fabinou/5294ae21ac462659eb9e9f7de6b75d91
-- In case it does not suits your needs, let's add 'engine' => 'InnoDB', to config/database.php (mysql array)
-- (probleme ERROR 1071 (42000): La clé est trop longue. Longueur maximale: 1000)

CREATE DATABASE Exercice_3;

USE Exercice_3;

CREATE TABLE clients (
    id VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    email VARCHAR(255),
    CONSTRAINT pk_clients PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE account_types (
    label VARCHAR(255) NOT NULL,
    CONSTRAINT pk_account_types PRIMARY KEY (label)
) ENGINE=InnoDB;

CREATE TABLE accounts (
    id VARCHAR(255) NOT NULL,
    balance FLOAT(11,2) DEFAULT 0,
    type VARCHAR(255),
    client VARCHAR(255),
    CONSTRAINT pk_accounts PRIMARY KEY (id),
    CONSTRAINT fk_accounts_type FOREIGN KEY (type) REFERENCES account_types(label),
    CONSTRAINT fk_accounts_client FOREIGN KEY (client) REFERENCES clients(id)
) ENGINE=InnoDB;

CREATE TABLE transactions (
    id VARCHAR(255) NOT NULL,
    from_account VARCHAR(255),
    to_account VARCHAR(255),
    amount FLOAT(6,2),
    date DATE,
    is_validated TINYINT(1) DEFAULT 0,
    CONSTRAINT pk_transactions PRIMARY KEY (id),
    CONSTRAINT fk_transactions_from FOREIGN KEY (from_account) REFERENCES accounts(id),
    CONSTRAINT fk_transactions_to FOREIGN KEY (to_account) REFERENCES accounts(id)
) ENGINE=InnoDB;