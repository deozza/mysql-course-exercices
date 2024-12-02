CREATE DATABASE IF NOT EXISTS bank;


USE banque;


CREATE TABLE clients (
    email VARCHAR(255) PRIMARY KEY,
    prenom VARCHAR(255) NOT NULL,
    nom_de_famille VARCHAR(255) NOT NULL,
    telephone VARCHAR(20) NOT NULL
);


CREATE TABLE comptes (
    id VARCHAR(255) PRIMARY KEY,
    solde FLOAT(11,2) NOT NULL,
    type VARCHAR(255),
    client VARCHAR(255),
    FOREIGN KEY (type) REFERENCES compte_types(etiquette),
    FOREIGN KEY (client) REFERENCES clients(email)
);




CREATE TABLE operations (
    id VARCHAR(255) PRIMARY KEY,
    de_la_part_de_l_compte VARCHAR(255),
    a_la_compte VARCHAR(255),
    montant FLOAT(6,2) NOT NULL,
    date DATE NOT NULL,
    est_valide TINYINT(1) NOT NULL,
    FOREIGN KEY (de_la_part_de_l_compte) REFERENCES comptes(id),
    FOREIGN KEY (a_la_compte) REFERENCES comptes(id)
);


CREATE TABLE compte_types (
    etiquette VARCHAR(255) PRIMARY KEY
);
