# MySQL exercices <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Requirements](#requirements)
- [How to install](#how-to-install)
- [How to initialize a database](#how-to-initialize-a-database)
- [Exercices](#exercices)
  - [Library.sql](#librarysql)

## Requirements

- `docker` and `docker compose` must be installed to use this template
- you must have basic knowledge of SQL and databases

## How to install

1. `git clone https://github.com/deozza/mysql-course`
2. `cd mysql-course`
3. `docker compose up -d --build`
4. `docker compose exec mysql-course-faker composer install`

## How to initialize a database

Exemple with the library database :

1. `docker compose exec mysql-course-db mysql -u root -p`
2. copy the content of `/mysql/library.sql` and paste it in the mysql console
3. exit the console and the container
4. `docker compose exec mysql-course-faker php -f ./src/generateForLibrary.php`

## Exercices

### Library.sql

1. afficher le nom et le prénom de tous les auteurs
2. afficher les auteurs qui viennent de France
3. afficher les auteurs dont le prénom commence par Jo
4. afficher le titre des livres dont le titre comporte moins de 50 caractères
5. afficher la liste des éditeurs qui ont une virgule dans leur nom
6. afficher la liste des 10 derniers livres écrits
7. afficher le nom et le prénom des membres en une seule colonne
8. afficher la liste des emprunts qui sont en retards de retour
9. afficher la liste des livres ecrits par Mario Will
10. afficher le titre du livre, le nom de l'auteur, le nom de l'édition, l'email, en une colonne le nom et prénom des membres qui n'ont pas rendu leur livre
11. afficher le nombre de livres écrits par chaque auteur avec en une seule colonne son nom et son prénom, trié par ordre alphabétique
12. afficher l'isbn des 10 éditions les plus empruntés
13. pour le livre le plus réédité, afficher son titre, son année d'écriture, le nom, le prénom de son auteur, le nombre de fois qu'il a été édité
14. afficher l'age des auteurs morts après 50 ans
15. afficher le nombre de livre le plus écrit en une année, sans utiliser ORDER BY
16. afficher le nom de l'éditeur qui a fait le plus de rééditions de livres différents
