
--Tournament Management System (tms)


--all tables

Tournament(tournament_id, tournament_name, description, format, start_date, end_date)
Organizer(organizer_id, organizer_name, phone, email, address, tournament_id(FK))
Team(team_id, team_name, coach_name, captain_name, logo, tournament_id(FK))
Player(player_id, player_name, date_of_birth, role, jersey_no, batting_style, bowling_style, team_id(FK))
Venue(venue_id, venue_name, location, capacity)
Match(match_id, tournament_id(FK), venue_id(FK), team1_id(FK), team2_id(FK), match_time, status)
Umpire(umpire_id, umpire_name, country, phone, experience)
Match_Umpire(match_id(FK), umpire_id(FK))