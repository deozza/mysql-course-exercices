# MySQL exercices <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Requirements](#requirements)
- [How to install](#how-to-install)
- [How to initialize a database](#how-to-initialize-a-database)

## Requirements

- `docker` and `docker compose` must be installed to use this template
- you must have basic knowledge of SQL and databases

## How to install

1. `git clone https://github.com/deozza/mysql-course`
2. `cd mysql-course-exercices`
3. `docker compose up -d --build`
4. `docker compose exec mysql-course-faker composer install`

## How to initialize a database

Exemple with the library database :

1. `docker compose exec mysql-course-db mysql -u root -p`
2. copy the content of `/mysql/library.sql` and paste it in the mysql console
3. exit the console and the container
4. `docker compose exec mysql-course-faker php -f ./src/generateForLibrary.php`
