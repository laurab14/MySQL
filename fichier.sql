oem@oem-Latitude-E5430-non-vPro:~$ sudo mysql
[sudo] Mot de passe de oem :
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.7.26-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

/*Début partie 1*/
mysql> CREATE DATABASE languages;
Query OK, 1 row affected (0.01 sec)

mysql> CREATE DATABASE webDevelopment SET 'utf8';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SET 'utf8'' at line 1
mysql> CREATE DATABASE webDevelopment SET 'utf8';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SET 'utf8'' at line 1
mysql> CREATE DATABASE webDevelopment CHARACTER SET 'utf8';
Query OK, 1 row affected (0.00 sec)

mysql> CREATE DATABASE frameworks CHARACTER SET 'utf8';
Query OK, 1 row affected (0.00 sec)

mysql> CREATE DATABASE languages CHARACTER SET 'utf8';
ERROR 1007 (HY000): Can't' create database 'languages'; database exists
mysql> DROP DATABASE IF EXISTS languages;
Query OK, 0 rows affected (0.04 sec)

mysql> DROP DATABASE IF EXISTS frameworks;
Query OK, 0 rows affected (0.00 sec)----------------------------------

mysql> DROP DATABASE IF EXISTS languages;
Query OK, 0 rows affected, 1 warning (0.00 sec)

/*--------------------------------------Fin partie 1-------------------------------------------- */

/*-------------------------------------Début partie 2--------------------------------------------*/

/*utiliser la base de donnée 'webDevelopment' pour créer un tableau*/
mysql> use webDevelopment
Database changed


/*Dans la base de données webDevelopment, créer la table languages avec les colonnes :

    id (type INT, auto-incrémenté, clé primaire)
    language (type VARCHAR)
*/
mysql> CREATE TABLE tools (id int primary key auto_increment, tool varchar(50));
Query OK, 0 rows affected (0.93 sec)


/*Dans la base de données webDevelopment, créer la table tools avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    tool (type VARCHAR)
*/
mysql> use webDevelopment                                             Database changed
mysql> CREATE TABLE frameworks (id int primary key auto_increment, name varchar(50));
Query OK, 0 rows affected (0.42 sec)


/*Dans la base de données webDevelopment, créer la table libraries avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    library (type VARCHAR)
*/
mysql> use webDevelopment                                             Database changed
mysql> CREATE TABLE libraries (id int primary key auto_increment, library varchar(50));
Query OK, 0 rows affected (0.74 sec)


/*Dans la base de données webDevelopment, créer la table ide avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    ideName (type VARCHAR)
*/
mysql> use webDevelopment                                             Database changed
mysql> CREATE TABLE ide (id int primary key auto_increment, ideName varchar(50));
Query OK, 0 rows affected (0.48 sec)


/*Dans la base de données webDevelopment, créer, si elle n'existe pas, la table frameworks avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    name (type VARCHAR)
*/
mysql> use webDevelopment
  Database changed
/*Permet de vérifier sur la table 'frameworks' exist  dans ce cas précis elle exister déjà*/
mysql> SHOW TABLES LIKE 'frameworks';
+---------------------------------------+
| Tables_in_webDevelopment (frameworks) |
+---------------------------------------+
| frameworks                            |
+---------------------------------------+
1 row in set (0.03 sec)


/*Supprimer la table tools si elle existe.*/
mysql> DROP TABLE tools;
Query OK, 0 rows affected (0.37 sec)

/*Supprimer la table libraries*/
mysql> DROP TABLE ide;
Query OK, 0 rows affected (0.25 sec)

/*Supprimer la table ide*/
mysql> CREATE DATABASE codex;
Query OK, 1 row affected (0.10 sec)

/*Créer la base codex. Y créer une table clients qui aura comme colonnes :
Colonnes 	            Type 	    Attributs
id 	INT 	                      Auto-incrémenté, clé primaire
lastname 	            VARCHAR
firstname 	          VARCHAR
birthDate 	          DATE
address 	            VARCHAR
firstPhoneNumber 	    INT
secondPhoneNumber 	  INT
mail 	                VARCHAR
*/
mysql> use codex
Database changed
mysql> CREATE TABLE clients (id int primary key auto_increment, lastname varchar(50), firstname varchar(50), birthDate DATETIME, address varchar(50),firstPhoneNumber int, secondPhoneNumber int, mail varchar(50));
Query OK, 0 rows affected (0.57 sec)

mysql> SHOW TABLES 'codex';
mysql> use codex                                                      Database changed
mysql> SHOW TABLES;
+-----------------+
| Tables_in_codex |
+-----------------+
| clients         |
+-----------------+
1 row in set (0.00 sec)

mysql> SHOW TABLES LIKE 'clients';
+---------------------------+
| Tables_in_codex (clients) |
+---------------------------+
| clients                   |
+---------------------------+
1 row in set (0.01 sec)

mysql> SHOW TABLES LIKE 'codex';
Empty set (0.00 sec)

mysql> DESCRIBE `clients`;
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id                | int(11)     | NO   | PRI | NULL    | auto_increment |
| lastname          | varchar(50) | YES  |     | NULL    |                |
| firstname         | varchar(50) | YES  |     | NULL    |                |
| birthDate         | datetime    | YES  |     | NULL    |                |
| address           | varchar(50) | YES  |     | NULL    |                |
| firstPhoneNumber  | int(11)     | YES  |     | NULL    |                |
| secondPhoneNumber | int(11)     | YES  |     | NULL    |                |
| mail              | varchar(50) | YES  |     | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
8 rows in set (0.10 sec)
/*--------------------------------------------------Fin partie 2---------------------------------------------*/

/*-------------------------------------------------Début partie 3-------------------------------------------*/

/*Dans la base de données webDevelopment, ajouter à la table languages une colonne version (VARCHAR).*/
mysql> use webDevelopment
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A
Database changed

mysql> ALTER TABLE `languages` ADD COLUMN version varchar(50);
Query OK, 0 rows affected (1.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

/*Vérification que la colonne à été créée*/
mysql> DESCRIBE `languages`;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int(11)     | NO   | PRI | NULL    | auto_increment |
| language | varchar(50) | YES  |     | NULL    |                |
| version  | varchar(50) | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

/*Dans la base de données webDevelopment, ajouter à la table frameworks une colonne version (INT).*/
mysql> ALTER TABLE `frameworks` ADD COLUMN version INT;
Query OK, 0 rows affected (0.72 sec)
Records: 0  Duplicates: 0  Warnings: 0

/*Vérification que la colonne à été créée*/
mysql> DESCRIBE `frameworks`;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int(11)     | NO   | PRI | NULL    | auto_increment |
| name    | varchar(50) | YES  |     | NULL    |                |
| version | int(11)     | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

/*Dans la base de données webDevelopment, dans la table languages renommer la colonne version en versions.*/
mysql> ALTER TABLE `languages` CHANGE `version` `versions` INT;
Query OK, 0 rows affected (1.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

/*Vérification que la colonne version à changé de nom*/
mysql> DESCRIBE `languages`;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int(11)     | NO   | PRI | NULL    | auto_increment |
| language | varchar(50) | YES  |     | NULL    |                |
| versions | int(11)     | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

/*Dans la base de données webDevelopment, dans la table frameworks, renommer la colonne name en framework.*/
mysql> ALTER TABLE `frameworks` CHANGE `name` `framework` varchar(50);
Query OK, 0 rows affected (0.16 sec)
Records: 0  Duplicates: 0  Warnings: 0

/*Vérification que la colonne name à changé de nom*/
mysql> DESCRIBE `frameworks`;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| framework | varchar(50) | YES  |     | NULL    |                |
| version   | int(11)     | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

/*Dans la base de données webDevelopment, dans la table frameworks changer le type de la colonne version en VARCHAR de taille 10.*/
mysql> ALTER TABLE `frameworks` CHANGE `version` `version` varchar(10);
Query OK, 0 rows affected (0.87 sec)
Records: 0  Duplicates: 0  Warnings: 0

/*Vérification que la colonne version à changé de nombre de CHARACTER*/
mysql> DESCRIBE `frameworks`;                                         +-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| framework | varchar(50) | YES  |     | NULL    |                |
| version   | varchar(10) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

/*Dans la base codex, dans la table clients :

    supprimer la colonne secondPhoneNumber
    renommer la colonne firstPhoneNumber en phoneNumber
    changer le type de la colonne phoneNumber en VARCHAR
    ajouter les colonnes zipCode(VARCHAR) et city(VARCHAR)
*/
mysql> use codex
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A
Database changed

mysql> ALTER TABLE `clients` DROP COLUMN `secondPhoneNumber`;
Query OK, 0 rows affected (0.80 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE `clients` CHANGE `firstPhoneNumber` `phoneNumber` int;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE `clients` CHANGE `phoneNumber` `phoneNumber` varchar(50);
Query OK, 0 rows affected (0.98 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE `clients` ADD COLUMN `zipCode` varchar(50);
Query OK, 0 rows affected (0.71 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE `clients` ADD COLUMN `city` varchar(50);
Query OK, 0 rows affected (0.79 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE `clients`;                                            +-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int(11)     | NO   | PRI | NULL    | auto_increment |
| lastname    | varchar(50) | YES  |     | NULL    |                |
| firstname   | varchar(50) | YES  |     | NULL    |                |
| birthDate   | datetime    | YES  |     | NULL    |                |
| address     | varchar(50) | YES  |     | NULL    |                |
| phoneNumber | varchar(50) | YES  |     | NULL    |                |
| mail        | varchar(50) | YES  |     | NULL    |                |
| zipCode     | varchar(50) | YES  |     | NULL    |                |
| city        | varchar(50) | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
9 rows in set (0.00 sec)
