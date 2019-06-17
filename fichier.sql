/*Pour ouvrir mySQL faire un sudo mySQL*/
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

/*----------------------------------------------Début partie 1------------------------------------------------*/
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
Query OK, 0 rows affected (0.00 sec)

mysql> DROP DATABASE IF EXISTS languages;
Query OK, 0 rows affected, 1 warning (0.00 sec)

/*--------------------------------------Fin partie 1-------------------------------------------- */

/*-------------------------------------Début partie 2--------------------------------------------*/

/*utiliser la base de donnée 'webDevelopment' pour créer un tableau*/
mysql> use webDevelopment
Database changed


/*Dans la base de données webDevelopment, créer la table languages avec les colonnes :

    id (type INT, auto-incrémenté, clé primaire)
    language (type VARCHAR) maximum d'un VARCHAR 8000

    le primary key permet de créer des valeurs unique
*/
mysql> CREATE TABLE tools (id int primary key auto_increment, tool varchar(50));
Query OK, 0 rows affected (0.93 sec)


/*Dans la base de données webDevelopment, créer la table tools avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    tool (type VARCHAR)
*/
mysql> use webDevelopment
Database changed

mysql> CREATE TABLE frameworks (id int primary key auto_increment, name varchar(50));
Query OK, 0 rows affected (0.42 sec)


/*Dans la base de données webDevelopment, créer la table libraries avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    library (type VARCHAR)
*/
mysql> use webDevelopment
Database changed

mysql> CREATE TABLE libraries (id int primary key auto_increment, library varchar(50));
Query OK, 0 rows affected (0.74 sec)


/*Dans la base de données webDevelopment, créer la table ide avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    ideName (type VARCHAR)
*/
mysql> use webDevelopment
Database changed

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
mysql> use codex
Database changed

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
mysql> DESCRIBE `frameworks`;
+-----------+-------------+------+-----+---------+----------------+
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

mysql> ALTER TABLE `clients` MODIFY `phoneNumber` `phoneNumber` varchar(50);
Query OK, 0 rows affected (0.98 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE `clients` ADD COLUMN `zipCode` varchar(50);
Query OK, 0 rows affected (0.71 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE `clients` ADD COLUMN `city` varchar(50);
Query OK, 0 rows affected (0.79 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE `clients`;
+-------------+-------------+------+-----+---------+----------------+
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
/*-------------------------------------------------Fin Partie 3 --------------------------------------------------*/

/*-----------------------------------------------Début Partie 4 -------------------------------------------------*/
/*rentrer dans la base de donnée webDevelopment*/
mysql> use webDevelopment
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

/*inserer dans le tableau languages les valeurs suivantes pour les colonnes (id,language,versions)*/
mysql> INSERT INTO `languages` VALUES (1,'JavaScript','5');
Query OK, 1 row affected (0.08 sec)

mysql> INSERT INTO `languages` VALUES (2,'PHP','5.2');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO `languages` VALUES (3,'PHP','5.4');
Query OK, 1 row affected (0.06 sec)

mysql> INSERT INTO `languages` VALUES (4,'HTML','5.1');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO `languages` VALUES (5,'JavaScript','6');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO `languages` VALUES (6,'JavaScript','7');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO `languages` VALUES (7,'JavaScript','8');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO `languages` VALUES (8,'PHP','7');
Query OK, 1 row affected (0.06 sec)

mysql> DESCRIBE `languages`;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int(11)     | NO   | PRI | NULL    | auto_increment |
| language | varchar(50) | YES  |     | NULL    |                |
| versions | int(11)     | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

/*Commande pour voir les différentes valeurs inserer dans les colonnes*/
mysql> SELECT * FROM `languages`;
+----+------------+----------+
| id | language   | versions |
+----+------------+----------+
|  1 | JavaScript | 5        |
|  2 | PHP        | 5.2      |
|  3 | PHP        | 5.4      |
|  4 | HTML       | 5.1      |
|  5 | JavaScript | 6        |
|  6 | JavaScript | 7        |
|  7 | JavaScript | 8        |
|  8 | PHP        | 7        |
+----+------------+----------+
8 rows in set (0.00 sec)

/*inserer dans le tableau frameworks les valeurs suivantes pour les colonnes (id,framework,version)*/
mysql> INSERT INTO `frameworks` VALUES ('1','Symfony','2.8');
Query OK, 1 row affected (0.06 sec)

mysql> INSERT INTO `frameworks` VALUES ('2','Symfony','3');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO `frameworks` VALUES ('3','Jquery','1.6');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO `frameworks` VALUES ('4','Jquery','2.10');
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM `frameworks`;
+----+-----------+---------+
| id | framework | version |
+----+-----------+---------+
|  1 | Symfony   | 2.8     |
|  2 | Symfony   | 3       |
|  3 | Jquery    | 1.6     |
|  4 | Jquery    | 2.10    |
+----+-----------+---------+
4 rows in set (0.00 sec)

/*Supprimer du tableau languages la ligne ayant l'id 1 */
mysql> DELETE FROM `languages` WHERE `id`=1;
Query OK, 1 row affected (0.05 sec)

/*---------------------------------------------------Fin Partie 4 ------------------------------------------*/

/*-------------------------------------------------Début Partie 5 -----------------------------------------*/

/*Dans la table languages, afficher toutes les données de la table.*/
mysql> SELECT * FROM `languages`;
+----+------------+----------+
| id | language   | versions |
+----+------------+----------+
|  1 | JavaScript | 5        |
|  2 | PHP        | 5.2      |
|  3 | PHP        | 5.4      |
|  4 | HTML       | 5.1      |
|  5 | JavaScript | 6        |
|  6 | JavaScript | 7        |
|  7 | JavaScript | 8        |
|  8 | PHP        | 7        |
+----+------------+----------+
8 rows in set (0.00 sec)

/*Dans la table languages, afficher toutes les versions de PHP.*/
mysql> SELECT `language`
    -> FROM `languages`
    -> WHERE `language`='PHP';
+----------+
| language |
+----------+
| PHP      |
| PHP      |
| PHP      |
+----------+
3 rows in set (0.01 sec)

mysql> SELECT `versions` FROM `languages` WHERE `language`='PHP';
+----------+
| versions |
+----------+
| 5.2      |
| 5.4      |
| 7        |
+----------+
3 rows in set (0.00 sec)


mysql> SELECT * FROM `languages` WHERE `language`='PHP';
+----+----------+----------+
| id | language | versions |
+----+----------+----------+
|  2 | PHP      | 5.2      |
|  3 | PHP      | 5.4      |
|  8 | PHP      | 7        |
+----+----------+----------+
3 rows in set (0.00 sec)

/*Dans la table languages, afficher toutes les versions de PHP et de JavaScript.*/
mysql> SELECT * FROM `languages` WHERE `language`='PHP' || `language`='JavaScript' ;
+----+------------+----------+
| id | language   | versions |
+----+------------+----------+
|  1 | JavaScript | 5        |
|  2 | PHP        | 5.2      |
|  3 | PHP        | 5.4      |
|  5 | JavaScript | 6        |
|  6 | JavaScript | 7        |
|  7 | JavaScript | 8        |
|  8 | PHP        | 7        |
+----+------------+----------+
7 rows in set (0.00 sec)

/*Dans la table languages, afficher toutes les lignes ayant pour id 3,5,7.*/
mysql> SELECT * FROM `languages` WHERE `id`=3 || `id`=5 || `id`=7 ;
+----+------------+----------+
| id | language   | versions |
+----+------------+----------+
|  3 | PHP        | 5.4      |
|  5 | JavaScript | 6        |
|  7 | JavaScript | 8        |
+----+------------+----------+
3 rows in set (0.00 sec)

/*Dans la table languages,afficher les deux première entrées de JavaScript.*/
mysql> SELECT * FROM `languages` WHERE `language`='JavaScript' LIMIT 2;
+----+------------+----------+
| id | language   | versions |
+----+------------+----------+
|  1 | JavaScript | 5        |
|  5 | JavaScript | 6        |
+----+------------+----------+
2 rows in set (0.00 sec)

/*Dans la table languages, afficher toutes les lignes qui ne sont pas du PHP*/
mysql> SELECT * FROM `languages` WHERE `language` <> 'PHP';
+----+------------+----------+
| id | language   | versions |
+----+------------+----------+
|  1 | JavaScript | 5        |
|  4 | HTML       | 5.1      |
|  5 | JavaScript | 6        |
|  6 | JavaScript | 7        |
|  7 | JavaScript | 8        |
+----+------------+----------+
5 rows in set (0.00 sec)

/*Dans la table languages,afficher toutes les données par ordre alphabétique.
SELECT * FROM `languages`ORDER BY DESC `language`; pour l'inverse de l'ordre alphabetique*/
mysql> SELECT * FROM `languages` ORDER BY `language`;
+----+------------+----------+
| id | language   | versions |
+----+------------+----------+
|  4 | HTML       | 5.1      |
|  1 | JavaScript | 5        |
|  5 | JavaScript | 6        |
|  6 | JavaScript | 7        |
|  7 | JavaScript | 8        |
|  2 | PHP        | 5.2      |
|  3 | PHP        | 5.4      |
|  8 | PHP        | 7        |
+----+------------+----------+
8 rows in set (0.00 sec)

/*------------------------------------------------------Fin Partie 5 ----------------------------------------- */

/*----------------------------------------------------Début Partie 6 -----------------------------------------*/

/*Pour ouvrir un fichier mySQL sauvegarder sur l'ordinateur et pouvoir s'en servir il faut donner le chemin du fichier*/
mysql> source /home/oem/mySQL/ajout.sql
Query OK, 0 rows affected (0.34 sec)

Query OK, 1 row affected (0.05 sec)

Query OK, 1 row affected (0.04 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.09 sec)

Query OK, 1 row affected (0.04 sec)

Query OK, 1 row affected (0.04 sec)

Query OK, 1 row affected (0.04 sec)

/*Dans la table frameworks, afficher toutes les données de la table ayant une version 2.x (x étant un numéro quelconque).*/
mysql> SELECT * FROM `frameworks` WHERE `version` < 3 && `version` >2;
/* aussi possible (le pourcentage représente la recherche floue)*/
mysql> SELECT * FROM `frameworks` WHERE `version` LIKE '2.%';
+----+-----------+---------+
| id | framework | version |
+----+-----------+---------+
|  1 | Symfony   | 2.8     |
|  4 | Jquery    | 2.10    |
+----+-----------+---------+
2 rows in set (0.00 sec)

/*Dans la table frameworks, afficher toutes les lignes ayant pour id 1 et 3.*/
mysql> SELECT * FROM `frameworks` WHERE `id`=1 || `id`=3;
+----+-----------+---------+
| id | framework | version |
+----+-----------+---------+
|  1 | Symfony   | 2.8     |
|  3 | Jquery    | 1.6     |
+----+-----------+---------+
2 rows in set (0.00 sec)

/*Dans la table ide, afficher toutes les lignes ayant une date comprise entre le premier janvier 2010 et le 31 decembre 2011.*/
mysql> SELECT * FROM `ide` WHERE `date` <= '2011-12-31' && `date` >= '2010-01-01';
+----+----------+---------+------------+
| id | name     | version | date       |
+----+----------+---------+------------+
|  3 | Eclipse  | 3.6     | 2010-06-01 |
|  4 | Eclipse  | 3.7     | 2011-06-01 |
|  6 | NetBeans | 7       | 2011-04-01 |
+----+----------+---------+------------+
3 rows in set (0.00 sec)

/*--------------------------------------------------Fin Partie 6 ------------------------------------------*/

/*------------------------------------------------Début Partie 7 -----------------------------------------*/

mysql> use webDevelopment
Database changed

/*Dans la table languages, supprimer toutes les lignes parlant de HTML.*/
mysql> DELETE FROM `languages`
    -> WHERE `language`='HTML';
Query OK, 1 row affected (0.07 sec)

mysql> SELECT * FROM `languages`;
+----+------------+----------+
| id | language   | versions |
+----+------------+----------+
|  1 | JavaScript | 5        |
|  2 | PHP        | 5.2      |
|  3 | PHP        | 5.4      |
|  5 | JavaScript | 6        |
|  6 | JavaScript | 7        |
|  7 | JavaScript | 8        |
|  8 | PHP        | 7        |
+----+------------+----------+
7 rows in set (0.00 sec)

/*Dans la table frameworks, modifier toutes les lignes ayant le framework Symfony par Symfony2.*/
mysql> UPDATE frameworks
    -> SET framework='Symfony 2'
    -> WHERE framework='Symfony';
Query OK, 2 rows affected (0.13 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM frameworks;
+----+-----------+---------+
| id | framework | version |
+----+-----------+---------+
|  1 | Symfony 2 | 2.8     |
|  2 | Symfony 2 | 3       |
|  3 | Jquery    | 1.6     |
|  4 | Jquery    | 2.10    |
+----+-----------+---------+
4 rows in set (0.00 sec)

/*Dans la table languages, modifier la ligne du langage JavaScript version 5 par la version 5.1*/
mysql> UPDATE `languages` SET `language`='JavaScript', `versions`='5.1' WHERE `versions`='5';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM `languages`;
| id | language   | versions |
+----+------------+----------+
|  1 | JavaScript | 5.1      |
|  2 | PHP        | 5.2      |
|  3 | PHP        | 5.4      |
|  5 | JavaScript | 6        |
|  6 | JavaScript | 7        |
|  7 | JavaScript | 8        |
|  8 | PHP        | 7        |
+----+------------+----------+
7 rows in set (0.00 sec)

/*-----------------------------------------------------------Fin Partie 7-------------------------------------*/

/*-------------------------------------------------Début Partie 8----------------------------------------------*/

mysql> source /home/oem/mySQL/bdd.sql
Query OK, 1 row affected, 1 warning (0.00 sec)

Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

mysql> SELECT * FROM `languages`;
+----+------------+
| id | name       |
+----+------------+
|  1 | Assembleur |
|  2 | C          |
|  3 | C++        |
|  4 | Java       |
|  5 | HTML       |
|  6 | CSS        |
|  7 | JavaScript |
|  8 | PHP        |
|  9 | C#         |
| 10 | VB         |
| 11 | Python     |
| 12 | Ruby       |
| 13 | Swift      |
+----+------------+
13 rows in set (0.15 sec)

mysql> SELECT * FROM `frameworks`;
+----+---------------+-------------+
| id | name          | languagesId |
+----+---------------+-------------+
|  1 | Qt            |           3 |
|  2 | SDK Android   |           4 |
|  3 | Bootstrap     |           6 |
|  4 | Foundation    |           6 |
|  5 | KNACSS        |           6 |
|  6 | Avalanche     |           6 |
|  7 | Miligram      |           6 |
|  8 | Skeleton      |           6 |
|  9 | Hoisin        |           6 |
| 10 | Inuit         |           6 |
| 11 | Mimic         |           6 |
| 12 | Ministrap     |           6 |
| 13 | Lotus         |           6 |
| 14 | Jquery        |           7 |
| 15 | Angular       |           7 |
| 16 | ReactJS       |           7 |
| 17 | Vue.js        |           7 |
| 18 | Ember.js      |           7 |
| 19 | Meteor.js     |           7 |
| 20 | Laravel       |           8 |
| 21 | Symfony       |           8 |
| 22 | CodeIgniter   |           8 |
| 23 | Yii           |           8 |
| 24 | Phalcon       |           8 |
| 25 | Lumen         |           8 |
| 26 | Silex         |           8 |
| 27 | Slim          |           8 |
| 28 | .NET          |           9 |
| 29 | .NET          |          10 |
| 30 | Django        |          11 |
| 31 | Ruby On Rails |          12 |
+----+---------------+-------------+
31 rows in set (0.01 sec)


/*Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework l'afficher aussi.*/
mysql> SELECT languages.name,frameworks.name FROM `languages` LEFT JOIN `frameworks` ON languages.id = frameworks.languagesId;
+------------+---------------+
| name       | name          |
+------------+---------------+
| C++        | Qt            |
| Java       | SDK Android   |
| CSS        | Bootstrap     |
| CSS        | Foundation    |
| CSS        | KNACSS        |
| CSS        | Avalanche     |
| CSS        | Miligram      |
| CSS        | Skeleton      |
| CSS        | Hoisin        |
| CSS        | Inuit         |
| CSS        | Mimic         |
| CSS        | Ministrap     |
| CSS        | Lotus         |
| JavaScript | Jquery        |
| JavaScript | Angular       |
| JavaScript | ReactJS       |
| JavaScript | Vue.js        |
| JavaScript | Ember.js      |
| JavaScript | Meteor.js     |
| PHP        | Laravel       |
| PHP        | Symfony       |
| PHP        | CodeIgniter   |
| PHP        | Yii           |
| PHP        | Phalcon       |
| PHP        | Lumen         |
| PHP        | Silex         |
| PHP        | Slim          |
| C#         | .NET          |
| VB         | .NET          |
| Python     | Django        |
| Ruby       | Ruby On Rails |
| Assembleur | NULL          |
| C          | NULL          |
| HTML       | NULL          |
| Swift      | NULL          |
+------------+---------------+
35 rows in set (0.00 sec)

/*Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework ne pas l'afficher.*/
mysql> SELECT languages.name,frameworks.name FROM `languages` INNER JOIN `frameworks` ON languages.id = frameworks.languagesId;
+------------+---------------+
| name       | name          |
+------------+---------------+
| C++        | Qt            |
| Java       | SDK Android   |
| CSS        | Bootstrap     |
| CSS        | Foundation    |
| CSS        | KNACSS        |
| CSS        | Avalanche     |
| CSS        | Miligram      |
| CSS        | Skeleton      |
| CSS        | Hoisin        |
| CSS        | Inuit         |
| CSS        | Mimic         |
| CSS        | Ministrap     |
| CSS        | Lotus         |
| JavaScript | Jquery        |
| JavaScript | Angular       |
| JavaScript | ReactJS       |
| JavaScript | Vue.js        |
| JavaScript | Ember.js      |
| JavaScript | Meteor.js     |
| PHP        | Laravel       |
| PHP        | Symfony       |
| PHP        | CodeIgniter   |
| PHP        | Yii           |
| PHP        | Phalcon       |
| PHP        | Lumen         |
| PHP        | Silex         |
| PHP        | Slim          |
| C#         | .NET          |
| VB         | .NET          |
| Python     | Django        |
| Ruby       | Ruby On Rails |
+------------+---------------+
31 rows in set (0.03 sec)

/*Afficher le nombre de framework qu'a un langage.*/
mysql> SELECT languages.name, COUNT(frameworks.name) FROM languages LEFT JOIN frameworks ON languages.id = frameworks.languagesId GROUP BY languages.name;
+------------+------------------------+
| name       | COUNT(frameworks.name) |
+------------+------------------------+
| Assembleur |                      0 |
| C          |                      0 |
| C#         |                      1 |
| C++        |                      1 |
| CSS        |                     11 |
| HTML       |                      0 |
| Java       |                      1 |
| JavaScript |                      6 |
| PHP        |                      8 |
| Python     |                      1 |
| Ruby       |                      1 |
| Swift      |                      0 |
| VB         |                      1 |
+------------+------------------------+
13 rows in set (0.13 sec)

/*Afficher les langages ayant plus de 3 frameworks.*/
mysql> SELECT languages.name, COUNT(frameworks.name) FROM languages LEFT JOIN frameworks ON languages.id = frameworks.languagesId GROUP BY languages.name HAVING COUNT(frameworks.name) > 3;
+------------+------------------------+
| name       | COUNT(frameworks.name) |
+------------+------------------------+
| CSS        |                     11 |
| JavaScript |                      6 |
| PHP        |                      8 |
+------------+------------------------+
3 rows in set (0.02 sec)

mysql> SELECT languages.name, COUNT(frameworks.name) AS `number` FROM languages LEFT JOIN frameworks ON languages.id = frameworks.languagesId GROUP BY languages.name HAVING `number` > 3;
+------------+--------+
| name       | number |
+------------+--------+
| CSS        |     11 |
| JavaScript |      6 |
| PHP        |      8 |
+------------+--------+
3 rows in set (0.00 sec)
