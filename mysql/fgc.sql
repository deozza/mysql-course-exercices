DROP DATABASE IF EXISTS fgc;

CREATE DATABASE fgc;
USE fgc;

CREATE TABLE teams (
    name VARCHAR(255) NOT NULL PRIMARY KEY
);

CREATE TABLE characters (
    name VARCHAR(255) NOT NULL PRIMARY KEY
);

CREATE TABLE players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    team_name VARCHAR(255),
    FOREIGN KEY (team_name) REFERENCES teams(name)
);

CREATE TABLE tournaments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date DATETIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    prize_pool int(10) NOT NULL
);

CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT NOT NULL,
    left_side_player_id INT NOT NULL,
    left_side_character VARCHAR(255) NOT NULL,
    right_side_player_id INT NOT NULL,
    right_side_character VARCHAR(255) NOT NULL,
    match_position INT NOT NULL,
    FOREIGN KEY (tournament_id) REFERENCES tournaments(id),
    FOREIGN KEY (left_side_player_id) REFERENCES players(id),
    FOREIGN KEY (right_side_player_id) REFERENCES players(id),
    FOREIGN KEY (left_side_character) REFERENCES characters(name),
    FOREIGN KEY (right_side_character) REFERENCES characters(name)
);

CREATE TABLE results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT NOT NULL,
    left_side_score INT NOT NULL,
    right_side_score INT NOT NULL,
    FOREIGN KEY (match_id) REFERENCES matches(id)
);