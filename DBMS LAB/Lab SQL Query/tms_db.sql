CREATE DATABASE tms;
USE tms;


CREATE TABLE Organizer(
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(50),
    address VARCHAR(100)
);


CREATE TABLE Tournament(
    tournament_id INT PRIMARY KEY,
    tournament_name VARCHAR(50),
    description VARCHAR(100),
    format VARCHAR(20),
    start_date DATE,
    end_date DATE,
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Organizer(organizer_id)
);


CREATE TABLE Team(
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50),
    coach_name VARCHAR(50),
    captain_name VARCHAR(50),
    logo VARCHAR(50),
    tournament_id INT,
    FOREIGN KEY (tournament_id) REFERENCES Tournament(tournament_id)
);


CREATE TABLE Player(
    player_id INT PRIMARY KEY,
    player_name VARCHAR(50),
    role VARCHAR(30),
    jersey_no INT,
    batting_style VARCHAR(30),
    bowling_style VARCHAR(30),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);


CREATE TABLE Venue(
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(50),
    city VARCHAR(30),
    address VARCHAR(100),
    capacity INT
);


CREATE TABLE MatchInfo(
    match_id INT PRIMARY KEY,
    tournament_id INT,
    venue_id INT,
    team1_id INT,
    team2_id INT,
    winner_team_id INT,
    loser_team_id INT,
    round_type VARCHAR(30),
    match_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (tournament_id) REFERENCES Tournament(tournament_id),
    FOREIGN KEY (venue_id) REFERENCES Venue(venue_id),
    FOREIGN KEY (team1_id) REFERENCES Team(team_id),
    FOREIGN KEY (team2_id) REFERENCES Team(team_id),
    FOREIGN KEY (winner_team_id) REFERENCES Team(team_id),
    FOREIGN KEY (loser_team_id) REFERENCES Team(team_id)
);


CREATE TABLE Umpire(
    umpire_id INT PRIMARY KEY,
    umpire_name VARCHAR(50),
    country VARCHAR(30),
    phone VARCHAR(20),
    experience INT
);


CREATE TABLE Match_Umpire(
    match_id INT,
    umpire_id INT,
    PRIMARY KEY(match_id, umpire_id),
    FOREIGN KEY (match_id) REFERENCES MatchInfo(match_id),
    FOREIGN KEY (umpire_id) REFERENCES Umpire(umpire_id)
);


CREATE TABLE Scorecard(
    score_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    runs INT,
    balls INT,
    wickets INT,
    overs DECIMAL(4,1),
    FOREIGN KEY (match_id) REFERENCES MatchInfo(match_id),
    FOREIGN KEY (player_id) REFERENCES Player(player_id)
);


CREATE TABLE Points_Table(
    points_id INT PRIMARY KEY,
    tournament_id INT,
    team_id INT,
    matches_played INT,
    won INT,
    lost INT,
    points INT,
    FOREIGN KEY (tournament_id) REFERENCES Tournament(tournament_id),
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);



INSERT INTO Organizer VALUES
(1,'BCB','01711111111','bcb1@gmail.com','Dhaka'),
(2,'Sports Club','01711111112','bcb2@gmail.com','Khulna'),
(3,'Cricket Board','01711111113','bcb3@gmail.com','Barisal'),
(4,'Youth Club','01711111114','bcb4@gmail.com','Rajshahi'),
(5,'Premier Club','01711111115','bcb5@gmail.com','Sylhet'),
(6,'National Board','01711111116','bcb6@gmail.com','Dhaka'),
(7,'University Club','01711111117','bcb7@gmail.com','Khulna'),
(8,'District Club','01711111118','bcb8@gmail.com','Jessore'),
(9,'Metro Club','01711111119','bcb9@gmail.com','Rangpur'),
(10,'Elite Club','01711111120','bcb10@gmail.com','Cumilla');



INSERT INTO Tournament VALUES
(1,'Premier Cup','National Tournament','T20','2025-01-01','2025-01-20',1),
(2,'Victory Cup','Club Tournament','T20','2025-02-01','2025-02-20',2),
(3,'Champion Cup','Regional Tournament','ODI','2025-03-01','2025-03-20',3),
(4,'Super Cup','National Tournament','T20','2025-04-01','2025-04-20',4),
(5,'Gold Cup','League Tournament','ODI','2025-05-01','2025-05-20',5),
(6,'Asia Cup','International Tournament','T20','2025-06-01','2025-06-20',6),
(7,'Summer Cup','University Tournament','T20','2025-07-01','2025-07-20',7),
(8,'Winter Cup','District Tournament','ODI','2025-08-01','2025-08-20',8),
(9,'Metro Cup','City Tournament','T20','2025-09-01','2025-09-20',9),
(10,'Elite Cup','National Tournament','ODI','2025-10-01','2025-10-20',10);



INSERT INTO Team VALUES
(1,'Tigers','Coach A','Captain A','logo1.png',1),
(2,'Lions','Coach B','Captain B','logo2.png',1),
(3,'Warriors','Coach C','Captain C','logo3.png',1),
(4,'Kings','Coach D','Captain D','logo4.png',1),
(5,'Royals','Coach E','Captain E','logo5.png',1),
(6,'Falcons','Coach F','Captain F','logo6.png',1),
(7,'Eagles','Coach G','Captain G','logo7.png',1),
(8,'Panthers','Coach H','Captain H','logo8.png',1),
(9,'Sharks','Coach I','Captain I','logo9.png',1),
(10,'Dragons','Coach J','Captain J','logo10.png',1);



INSERT INTO Player VALUES
(1,'Player1','Batsman',10,'Right Hand','None',1),
(2,'Player2','Bowler',11,'Left Hand','Fast',2),
(3,'Player3','All-rounder',12,'Right Hand','Spin',3),
(4,'Player4','Wicket Keeper',13,'Right Hand','None',4),
(5,'Player5','Batsman',14,'Left Hand','None',5),
(6,'Player6','Bowler',15,'Right Hand','Fast',6),
(7,'Player7','All-rounder',16,'Left Hand','Spin',7),
(8,'Player8','Wicket Keeper',17,'Right Hand','None',8),
(9,'Player9','Batsman',18,'Right Hand','None',9),
(10,'Player10','Bowler',19,'Left Hand','Fast',10);



INSERT INTO Venue VALUES
(1,'Sher-e-Bangla Stadium','Dhaka','Mirpur',25000),
(2,'BKSP Ground','Dhaka','Savar',15000),
(3,'Khulna Stadium','Khulna','Khulna City',20000),
(4,'Barisal Stadium','Barisal','Barisal City',18000),
(5,'Rajshahi Stadium','Rajshahi','Rajshahi City',22000),
(6,'Sylhet Stadium','Sylhet','Sylhet City',20000),
(7,'Jessore Stadium','Jessore','Jessore City',12000),
(8,'Cumilla Stadium','Cumilla','Cumilla City',17000),
(9,'Rangpur Stadium','Rangpur','Rangpur City',16000),
(10,'Chattogram Stadium','Chattogram','Chattogram City',30000);



INSERT INTO MatchInfo VALUES
(1,1,1,1,2,1,2,'League','2025-01-02','Completed'),
(2,1,2,3,4,3,4,'League','2025-01-03','Completed'),
(3,1,3,5,6,5,6,'League','2025-01-04','Completed'),
(4,1,4,7,8,7,8,'League','2025-01-05','Completed'),
(5,1,5,9,10,9,10,'League','2025-01-06','Completed'),
(6,1,6,1,3,1,3,'Quarter Final','2025-01-10','Completed'),
(7,1,7,5,7,7,5,'Quarter Final','2025-01-11','Completed'),
(8,1,8,1,7,1,7,'Semi Final','2025-01-15','Completed'),
(9,1,9,2,4,2,4,'Semi Final','2025-01-16','Completed'),
(10,1,10,1,2,1,2,'Final','2025-01-20','Completed');



INSERT INTO Umpire VALUES
(1,'Umpire1','Bangladesh','01710000001',5),
(2,'Umpire2','India','01710000002',6),
(3,'Umpire3','Pakistan','01710000003',7),
(4,'Umpire4','Sri Lanka','01710000004',8),
(5,'Umpire5','Australia','01710000005',9),
(6,'Umpire6','England','01710000006',10),
(7,'Umpire7','New Zealand','01710000007',4),
(8,'Umpire8','South Africa','01710000008',5),
(9,'Umpire9','West Indies','01710000009',6),
(10,'Umpire10','Afghanistan','01710000010',7);



INSERT INTO Match_Umpire VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);



INSERT INTO Scorecard VALUES
(1,1,1,50,35,0,0.0),
(2,2,2,10,8,3,4.0),
(3,3,3,45,30,2,4.0),
(4,4,4,70,45,0,0.0),
(5,5,5,90,60,0,0.0),
(6,6,6,15,10,4,4.0),
(7,7,7,40,25,1,2.0),
(8,8,8,65,40,0,0.0),
(9,9,9,75,50,0,0.0),
(10,10,10,20,12,5,4.0);



INSERT INTO Points_Table VALUES
(1,1,1,5,4,1,8),
(2,1,2,5,3,2,6),
(3,1,3,5,3,2,6),
(4,1,4,5,2,3,4),
(5,1,5,5,4,1,8),
(6,1,6,5,1,4,2),
(7,1,7,5,3,2,6),
(8,1,8,5,2,3,4),
(9,1,9,5,4,1,8),
(10,1,10,5,1,4,2);