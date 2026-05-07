
--COMMAND: CREATE, DROP, ALTER (DDL), DML: SELECT, INSERT, UDPATE, DELETE, TRUCATE

--Db create, drop
--table create, drop, insert data into table, update data, delete data
--alter table (change the strcutures of tables, eg: adding column)

--Tournament Management System (tms)
--all tables

Tournament(tournament_id, tournament_name, description, format, start_date, end_date, organizer_id(FK))
Organizer(organizer_id, organizer_name, phone, email, address)
Team(team_id, team_name, coach_name, captain_name, logo, tournament_id(FK))
Player(player_id, player_name, date_of_birth, role, jersey_no, batting_style, bowling_style, team_id(FK))
Venue(venue_id, venue_name, location, capacity)
Match(match_id, tournament_id(FK), venue_id(FK), team1_id(FK), team2_id(FK), match_time, status)
Umpire(umpire_id, umpire_name, country, phone, experience)
Match_Umpire(match_id(FK), umpire_id(FK))


--database creation

CREATE DATABASE tms;
DROP DATABASE tms;

--creating table

CREATE TABLE organizer(
    organizer_id INT PRIMARY KEY AUTO_INCREMENT, 
    organizer_name VARCHAR(200) NOT NULL, 
    phone VARCHAR(15) NOT NULL UNIQUE,
     email VARCHAR(200) NOT NULL UNIQUE, 
     address VARCHAR(200) NOT NULL
     );
--drop table
--drop table oranizer;

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