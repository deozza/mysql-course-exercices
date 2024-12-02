CREATE DATABASE bank_database;
USE bank_database;

CREATE TABLE types_de_compte (
    etiquette VARCHAR(255) PRIMARY KEY
);

CREATE TABLE clients (
    identifiant VARCHAR(255) PRIMARY KEY,
    prenom VARCHAR(255) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    telephone VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE comptes (
    identifiant VARCHAR(255) PRIMARY KEY,
    equilibre FLOAT(11,2) NOT NULL DEFAULT 0,
    type VARCHAR(255),
    client VARCHAR(255),
    FOREIGN KEY (type) REFERENCES types_de_compte(etiquette),
    FOREIGN KEY (client) REFERENCES clients(identifiant)
);

CREATE TABLE transactions (
    identifiant VARCHAR(255) PRIMARY KEY,
    de_compte VARCHAR(255),
    a_compte VARCHAR(255),
    montant FLOAT(6,2) NOT NULL,
    date_transaction DATE NOT NULL,
    est_valide TINYINT(1) DEFAULT 1,
    FOREIGN KEY (de_compte) REFERENCES comptes(identifiant),
    FOREIGN KEY (a_compte) REFERENCES comptes(identifiant)
);