

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

--------------------
-----Practice------
---Write SQL query for the following questions----
----------------------------------
/*
1. Show only player name and role.
2.  Show matches that are completed.
3. Show players whose role is Batsman.
4. Show venues by capacity (highest first).
5. Show players by jersey number;
6. Count total players.
7. Find maximum stadium capacity.
8. Find the details of stadium that has maximum capacity (***).

    SELECT * FROM venue
    WHERE capacity = (SELECT MAX(capacity) FROM venue);


    SELECT MAX(capacity) FROM venue;

9. Average umpire experience.
10. Count players by role (Group By).
11. Count teams in each tournament (Group By).
12. Show roles having at least 2 players (Group by, having).
13. Show players from team Tigers (***).
14. Find which team played most matches (***).
15. Find total runs scored by each player (***).
*/

--------------------------
---Last Lecture----------
---12 May 26-----
---------------------
--joins

--INNER JOIN
SELECT Tournament.*, Organizer.* FROM Tournament INNER JOIN Organizer
ON Tournament.organizer_id=Organizer.organizer_id;

SELECT Tournament.tournament_name, Tournament.description, Tournament.format,
 Organizer.organizer_name, Organizer.phone 
 FROM Tournament INNER JOIN Organizer
ON Tournament.organizer_id=Organizer.organizer_id;

--traditional join
SELECT Tournament.tournament_name, Tournament.description, Tournament.format,
 Organizer.organizer_name, Organizer.phone FROM Tournament, Organizer
WHERE Tournament.organizer_id=Organizer.organizer_id;

--LEFT JOIN
SELECT Tournament.*, Organizer.* FROM Tournament LEFT JOIN Organizer
ON Tournament.organizer_id=Organizer.organizer_id;

--RIGHT
SELECT  Tournament.*, Organizer.* FROM  Tournament RIGHT JOIN Organizer
ON Tournament.organizer_id=Organizer.organizer_id;


--Q: write sql to join the tables team and player.
SELECT Team.*, Player.*
FROM Team INNER JOIN Player
ON Team.team_id=Player.team_id;
/*Q: Show the following info of a player: player name, jersey number, playing role, 
team name, coach name. */

SELECT Player.player_name, Player.jersey_no, Player.role, Team.team_name, Team.coach_name
FROM Team INNER JOIN Player
ON Team.team_id=Player.team_id;

SELECT P.player_name, P.jersey_no, P.role, T.team_name, T.coach_name
FROM Team as T INNER JOIN Player P
ON T.team_id=P.team_id;

--Find the name of coach of Player4;
SELECT Player.player_name, Team.coach_name
FROM Team INNER JOIN Player
ON Team.team_id=Player.team_id
WHERE Player.player_name='Player4';

---
SELECT Player.player_name, Team.coach_name
FROM Team, Player
WHERE Team.team_id=Player.team_id
AND Player.player_name='Player4';

--views

CREATE VIEW Player_info AS
SELECT Player.player_name, Player.jersey_no, Player.role, Team.team_name, Team.coach_name
FROM Team INNER JOIN Player
ON Team.team_id=Player.team_id;

--Todays topic--
--------------
--joins
--views
--IN, BETWEEN

--Sub queries
--Find the details of stadium that has maximum capacity (***).

    SELECT * FROM venue
    WHERE capacity = (SELECT MAX(capacity) FROM venue);

    --find the details of players whose bowling style is same as Player2;
    SELECt * FROM Player
    WHERE bowling_style=(SELECT bowling_style FROM PLayer WHERE player_name='Player2');

 --find the details of players whose playing role is same as Player2 or Player3;
    SELECT * FROM Player
    WHERE role IN (SELECT role FROM player WHERE player_name='Player2' OR player_name='Player3');

--------------------------------------------------------------------------
--Practice Query on tms database for all topics (Basic to Advanced)-------
--------------------------------------------------------------------------
---Basic Level
1. Write an SQL query to display all records from the Team table.
2. Write an SQL query to display player name, role, and jersey number from the Player table.
3.Write an SQL query to display all tournaments.
4.Write an SQL query to display all players whose role is Batsman.
5.Write an SQL query to display all matches whose status is Completed.
6.Write an SQL query to display venues having capacity greater than 20,000.
7. Write an SQL query to display umpires whose experience is greater than 5 years.
8. Write an SQL query to display players ordered by jersey number in ascending order.
9. Write an SQL query to display teams ordered alphabetically.
10. Write an SQL query to display the first 5 players from the Player table.

----Intermediate Level
11. Write an SQL query to count the total number of players.
12. Write an SQL query to count the total number of teams.
13. Write an SQL query to find the highest stadium capacity.
14. Write an SQL query to find the minimum umpire experience.
15. Write an SQL query to find the average umpire experience.
16. Write an SQL query to find the total runs scored in the Scorecard table.
17. Write an SQL query to display players whose jersey number is between 10 and 15.
18. Write an SQL query to display players whose name starts with P.
19. Write an SQL query to display tournaments of format T20.
20. Write an SQL query to display matches held after '2025-01-10'.

----Group By and Having
21. Write an SQL query to count the number of players in each role.
22. Write an SQL query to count the number of teams in each tournament.
23. Write an SQL query to display the total runs scored by each player.
24. Write an SQL query to display the average runs of each player.
25. Write an SQL query to display roles having at least 2 players.
26. Write an SQL query to display teams having more than one player.
27. Write an SQL query to display the number of matches played in each round type.
28. Write an SQL query to display tournaments having more than 5 teams.

---joins
29. Write an SQL query to display player name with team name.
30. Write an SQL query to display tournament name with organizer name.
31. Write an SQL query to display match information with venue name.
32. Write an SQL query to display team names participating in each match.
33. Write an SQL query to display winner team of each match.
34. Write an SQL query to display player name, team name, and tournament name.
35. Write an SQL query to display match ID, venue name, and match date.
36. Write an SQL query to display umpire names assigned to each match.
37. Write an SQL query to display scorecard with player name.
38. Write an SQL query to display points table with team name.
39. Write an SQL query to display all players participating in Premier Cup.
40. Write an SQL query to display all matches of Premier Cup.
41. Write an SQL query to display all teams managed by organizer BCB.
42. Write an SQL query to display all players of team Tigers.
43. Write an SQL query to display the venue of the final match.
44. Write an SQL query to display all umpires assigned to semi-final matches.
45. Write an SQL query to display all players who played in the final match.

--Sub queries
46. Write an SQL query to display players belonging to team Tigers using subquery.
47. Write an SQL query to display the venue having maximum capacity.
48. Write an SQL query to display the player who scored the highest runs.
49. Write an SQL query to display the team having the highest points.
50. Write an SQL query to display tournaments organized by the organizer having ID = 1.
51. Write an SQL query to display players whose runs are above average.
52. Write an SQL query to display matches played in the largest stadium.

--Advanced Level
53. Write an SQL query to display the top 3 run scorers.
54. Write an SQL query to display the team that won the maximum number of matches.
55. Write an SQL query to display the team eliminated in quarter-final matches.
56. Write an SQL query to display all undefeated teams.
57. Write an SQL query to display teams that reached the final.
58. Write an SQL query to display players who scored more than 50 runs.
59. Write an SQL query to display the most experienced umpire.
60. Write an SQL query to display the tournament champion.
61. Write an SQL query to calculate the win percentage of each team.
62. Write an SQL query to display the player with the highest total runs.
63. Write an SQL query to display teams that played more than 3 matches.
64. Write an SQL query to display matches where the winning margin exceeded a specified value.
65. Write an SQL query to rank teams based on points.

---------------------------