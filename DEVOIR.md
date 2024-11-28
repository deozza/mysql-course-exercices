# MySQL exercices <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Requirements](#requirements)
- [How to submit](#how-to-submit)
- [Exercice 1 /2.5](#exercice-1-25)
- [Exercice 2 /2.5](#exercice-2-25)
- [Exercice 3 /2](#exercice-3-2)
- [Exercice 4 /4](#exercice-4-4)
- [Exercice 5 /9](#exercice-5-9)

## Requirements

- what is a database
- how to convert a specification into a data dictionnary, then into a MCD, then into a sql script to program the database
- how to make request in sql

## How to submit

1. Fork this project by clicking on this button :

![fork button](assets/fork.png)

Github will clone this repository on your account so you won't modify this template.

2. For each exercise you will create a folder with the exercice name as the folder name.

For example, for the exercice 3, you will create `/Exercice-3`.

3. You will put in these folders the necessary files to complete the exercices (data dictionnaries, pictures of MCD, `.txt` files for answering questions, `.sql` file for programming exercices)

For example, for the exercice 3, you would have a `/Exercice-3/bank.sql` file. For the exercice 4, you would have a `/Exercice-4/mcd.jpg` file.

4. Once your work is done, you will do a Pull Request from the github page of your repository :

![pull request](assets/PR.png)

The pull request title should have your lastname, your name and your class.

## Exercice 1 /2.5

From this sql [file](mysql/ecommerce.sql), write the corresponding data dictionnary.

## Exercice 2 /2.5

A guitar manufacturer needs to manage all the modeles they can build.

A guitar is identified by a SKU code. It has a modele name and a price.

Every type of characteristic of a guitar is stored in a dedicated table. A characteristic is identified by a code. It could be "string_number", "fret_number", "body_wood", "neck_pickup", ... It also has a label that could be displayed on their website. For example "Number of string".

In order to reduce issues, the guitar characteristics are not free to fill. All the possible values are stored in a dedicated table. This table is composed of an identifier, the characteristic code and a possible value. A characteristic could have multiple possible values.

When a guitar is built, its characteristics are stored in a dedicated table. This table is structured as follow : an id, a guitar SKU code and a characteristic value. A guitar will have multiple characteristics values.

Write the MCD of this database.

## Exercice 3 /2

From this data dictionnary, program the SQL database for a bank :

| Property     | Comment     | Entity        | Type        | Identifier |
| ------------ | ----------- | ------------- | ----------- | ---------- |
| firstname    |             | clients       | VARCHAR     |            |
| lastname     |             | clients       | VARCHAR     |            |
| phone        |             | clients       | VARCHAR     |            |
| email        |             | clients       | VARCHAR     | X          |
| id           |             | accounts      | VARCHAR     | X          |
| balance      |             | accounts      | FLOAT(11,2) |            |
| type         | FOREIGN KEY | accounts      | VARCHAR     |            |
| client       | FOREIGN KEY | accounts      | VARCHAR     |            |
| id           |             | transactions  | VARCHAR     | x          |
| from_account | FOREIGN KEY | transactions  | VARCHAR     |            |
| to_account   | FOREIGN KEY | transactions  | VARCHAR     |            |
| amount       |             | transactions  | FLOAT(6,2)  |            |
| date         |             | transactions  | DATE        |            |
| is_validated |             | transactions  | TINYINT(1)  |            |
| label        |             | account_types | VARCHAR     | x          |

## Exercice 4 /4

A company's business is to check whether the ID documents of banks and insurances clients are valid. Each time there is a new client, they must send to the company their IDs and fill a form with their personal informations. Then, a program is ran by the company to extract data from the documents and compare them with the informations the client filled.

Each process creates a new row in a user_files table. A user_files is identified by an id, a date of creation and the motive of the process creation (new bank account, new insurance policy, etc).

A client is identified by an email. A client is always attached to a user_files row. Multiple clients could be attached to the same user_files (for example if one client needs a guarantor for its process).

The informations a client sends in the form is stored in a separate table called forms_data. A form_data is identified by an id and stores the date the form was filled, if the form is completed, the firstnames, the lastname, the date of birth, the address and the genre of the client. A client_form is always attached to one client. The form is filled only once by a client.

A document is identified by an id, a date of upload and a document type. It is attached to one client. A document is always attached to one client. The same client can upload multiple documents.

A document type is a list of all the possible documents a client could upload. It is identified by a label.

Once the program is ran, the data extracted is stored in a document_data table.

From these specifications, write the corresponding MCD.

## Exercice 5 /9

Import the database [company-with-data](mysql/company-with-data.sql) in your DBMS. You can use either phpmyadmin or the command line interface.

1. display the last 10 meetings that took place in Mayotte
2. display the higher total salary (salary + bonus) of the month of April 2024, and the lastname and firstname of the corresponding worker
3. display the number of meetings Cedrick Waters attended.
4. check if the room "quam" from the building "Bode, Blanda and Ebert" is reserved November 10th 2024 between 12:00 and 18:00
5. display the lastname, firstname and email of the workers under Joey Crooks
6. display the lastname, firstname and birthday of any directors who are between 25 and 30 years old
7. display the name and the address of the building with the most of rooms at its 4th floor
8. display the date, the name of the room, the floor number, the building's address of the 2 meetings with the most attendants
9. display the total expenses in salary in 2024 by countries
