
     
     create table if not exists stadium (
     id int,
     name text,
     home_games int,
     average_attendance real,
     total_attendance real,
     capacity_percentage real,
     primary key (id)
     );
     
     create table if not exists game (
     stadium_id int,
     id int,
     season int,
     date text,
     home_team text,
     away_team text,
     score text,
     competition text,
     primary key (id),
     foreign key (stadium_id) references stadium(id)
     );
     
     create table if not exists injury_accident (
     game_id int,
     id int,
     player text,
     injury text,
     number_of_matches text,
     source text,
     primary key (id),
     foreign key (game_id) references game(id)
     );
     
     
     
     
     
     
     
