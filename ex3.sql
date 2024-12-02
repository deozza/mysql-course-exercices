-- Création de la base de données
CREATE DATABASE Banque;

-- Utilisation de la base de données
USE Banque;

-- Table Clients
CREATE TABLE Clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(30),
    date_naissance DATE,
    adresse VARCHAR(100),
    email VARCHAR(60),
    telephone VARCHAR(20)
);

-- Table Comptes
CREATE TABLE Comptes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_compte VARCHAR(20) UNIQUE,
    solde DECIMAL(10, 2),
    date_ouverture DATE,
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES Clients(id)
);

-- Table Transactions
CREATE TABLE Transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    montant DECIMAL(10, 2),
    date_transaction DATE,
    description VARCHAR(200),
    id_compte INT,
    FOREIGN KEY (id_compte) REFERENCES Comptes(id)
);

-- Table Employés
CREATE TABLE Employes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    date_embauche DATE,
    poste VARCHAR(50),
    salaire DECIMAL(10, 2)
);

-- Table operations_bancaires
CREATE TABLE Operations_bancaires (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_operation VARCHAR(50),
    date_operation DATE,
    id_employe INT,
    FOREIGN KEY (id_employe) REFERENCES Employes(id)
);

-- Table Cartes
CREATE TABLE Cartes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_carte VARCHAR(20) UNIQUE,
    date_emission DATE,
    date_expiration DATE,
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES Clients(id)
);

-- Table Prêts
CREATE TABLE Prêts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    montant_pret DECIMAL(10, 2),
    taux_interet DECIMAL(5, 2),
    date_demande DATE,
    date_approbation DATE,
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES Clients(id)
);

-- Table Investissements
CREATE TABLE Investissements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_investissement VARCHAR(50),
    montant_investi DECIMAL(10, 2),
    date_investissement DATE,
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES Clients(id)
);