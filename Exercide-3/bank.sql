CREATE TABLE clients (
    email VARCHAR(255) PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE account_types (
    label VARCHAR(50) PRIMARY KEY
);

CREATE TABLE accounts (
    id VARCHAR(36) PRIMARY KEY,
    balance FLOAT(11,2) DEFAULT 0.00,
    type VARCHAR(50),
    client VARCHAR(255),
    FOREIGN KEY (type) REFERENCES account_types(label),
    FOREIGN KEY (client) REFERENCES clients(email)
);

CREATE TABLE transactions (
    id VARCHAR(36) PRIMARY KEY,
    from_account VARCHAR(36),
    to_account VARCHAR(36),
    amount FLOAT(6,2) NOT NULL,
    date DATE NOT NULL,
    is_validated TINYINT(1) DEFAULT 0,
    FOREIGN KEY (from_account) REFERENCES accounts(id),
    FOREIGN KEY (to_account) REFERENCES accounts(id)
);
