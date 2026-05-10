

---------------------------------------
----******SQL Lecture 2 (Online)--------------
-----------07 May 26-------------------------
----------------------------------------
--COMMAND: CREATE, DROP, ALTER (DDL), DML: SELECT, INSERT, UDPATE, DELETE, TRUCATE

-- create DB, drop DB
--table create, drop Table, 
---insert data into table, 
---update data, 
--delete data, Truncate 
--alter table (change the strcutures of tables, eg: adding column)

-----Database-----------
-------------------------------
--Tournament Management System (tms)
--all tables
tournament(tournament_id, tournament_name, description, format, start_date, end_date, organizer_id(FK))
organizer(organizer_id, organizer_name, phone, email, address)
team(team_id, team_name, coach_name, captain_name, logo, tournament_id(FK))
player(player_id, player_name, date_of_birth, role, jersey_no, batting_style, bowling_style, team_id(FK))
Venue(venue_id, venue_name, location, capacity)
Match(match_id, tournament_id(FK), venue_id(FK), team1_id(FK), team2_id(FK), match_time, status)
Umpire(umpire_id, umpire_name, country, phone, experience)
Match_Umpire(match_id(FK), umpire_id(FK))

--NB: Complete the database and implement in mysql
-------------

---SQL Command
------------------
-- Create database 
CREATE DATABASE ctms;
--DROP DATABASE tms;
USE DATABASE ctms;

--creating table organizer

CREATE TABLE organizer(
    organizer_id INT PRIMARY KEY AUTO_INCREMENT, 
    organizer_name VARCHAR(200) NOT NULL, 
    phone VARCHAR(15) NOT NULL UNIQUE,
     email VARCHAR(200) NOT NULL UNIQUE, 
     address VARCHAR(200) NOT NULL
     );
--drop table command
--drop table organizer;

--create table tournament
CREATE TABLE tournament(
    tournament_id INT PRIMARY KEY AUTO_INCREMENT,
    tournament_name VARCHAR(200) NOT NULL,
    description VARCHAR(200) NOT NULL,
    format VARCHAR(200) NOT NULL, 
    start_date DATE,
     end_date DATE, 
     organizer_id INT,
     FOREIGN KEY(organizer_id) REFERENCES organizer(organizer_id)
     );


--INSERT DATA into organizertable
     
INSERT INTO organizer(organizer_id, organizer_name, phone, email, address)
VALUES(NULL, , '09876543', 'cse@gmail.com', 'BU');

-- insert multiple data into organizer table
INSERT INTO organizer(organizer_id, organizer_name, phone, email, address)
VALUES(NULL, 'BU Sports Club', '09876544', 'bu@gmail.com', 'BU'),
(NULL, 'ABC Sports Club', '09876545', 'abc@gmail.com', 'BU'),
(NULL, 'BCD Sports Club', '09876546', 'xyz@gmail.com', 'BU');

--insert data into tournament table
INSERT INTO tournament(tournament_id, tournament_name, description, format, start_date, end_date, organizer_id)
VALUES(NULL, 'Short CT', 'ABCD', 'SHORT', '2026-05-10','2026-05-20', 1);

--delete data
DELETE FROM organizer WHERE organizer_id = 4; ---delete any data using pk
DELETE FROM organizer WHERE phone='';

--update date in organizer
UPDATE organizer
 SET organizer_name = 'SKY Sports Club' 
 WHERE organizer_id = 3;
 
 UPDATE organizer
 SET organizer_name = 'SKY Sports Club' 
 WHERE address = 'BU';

--------------------
--SQL Query sample: Show the name and phone number of organizer who organized the ICDR tournament.
--retrieve-- command --> SELECT
SELECT organizer.organizer_name, organizer.phone FROM organizer, tournament
WHERE organizer.organizer_id=tournament.tournament_id and
tournament.tournament_name='IDCR';
----------------------

--Homeowrk----
-------------------
--practice creating db tms using SQL command
--study data types, constraints
--explore w3schools website

--------------------------------
------LAB3---------
------10May 26-------
-------------------------

--SELECT
------------------
SELECT tournament_name, start_date, end_date FROM Tournament;

--Q1: show the player name, jersey number and playing role. 
SELECT player_name AS 'PLayer Name', jersey_no AS JerseyNumber, role AS 'Playing Role' FROM Player;

--ALIAS --> RENAME
------------------------
--select all
SELECT * FROM PLayer;


--Q2: find the name, contact number and address of all organizers;
SELECT organizer_name, phone, address FROm Organizer;

---DISTINCT
--------------------
SELECT COUNT(DISTINCT address) FROM Organizer;

--Q3: Show the playing roles for players.

--Aggregate Function--> 
COUNT()
MIN()
MAX()
SUM()
AVG()

SELECT MAX(points) FROM Points_Table;

-----------
--WHERE--------
---------------------
--Q4: Find the list of all batsman;
SELECT * FROM Player 
WHERE role='Batsman';

--Q5: Find the list of all right handed batsman;
SELECT * FROM Player 
WHERE role='Batsman' AND batting_style='Right Hand';

---OPERATORS---
-----------------
--AND, OR, NOT
--LIKE OPERATORS
-- Assignment, comparison

--Practice--------
---------------
--Show the list of all organizer who are from dhaka or khulna.
SELECT * FROM Organizer WHERE address='Dhaka' OR address='Khulna';
--Show the list of all fast bowlers.
SELECT * FROM Player WHERE role='Bowler' AND bowling_style='Fast';
--Find the umpires who are from India having more than 5 years of experieces.
SELECT * FROM Umpire WHERE country='India' AND experience>=5;
--Find the team that name start with letter T.  
SELECT * FROM Team WHERE team_name LIKE 'T%';

---ORDER BY, LIMIT, OFFSET-----
----------------------------
--Show the team list in a sorted order according to their name in alaphabetically.
SELECT * FROM Team ORDER By team_name ASC;
--show the umpire list sorted according to their experience (max to min);
SELECT * FROM Umpire ORDER BY experience DESC LIMIT 3; 
--person having 3rd in experiences
SELECT * FROM Umpire ORDER BY experience DESC LIMIT 1 OFFSET 2; 

--GROUP BY, HAVING---
-------------------------
--Find the list number of players in each role;
SELECT role, COUNT(*) FROM Player
GROUP BY role;

SELECT role, COUNT(*) FROM Player GROUP BY role HAVING COUNT(role)>=3;

--