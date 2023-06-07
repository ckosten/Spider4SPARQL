
     
     create table if not exists country (
         country_id int,
         country_name text,
         capital text,
         official_native_language text,
         primary key (country_id)
     );
     
     
     create table if not exists team (
           team_id int,
           name text,
           primary key (team_id)
     ) ;
     
     
     create table if not exists match_season (
         season real,
         player text,
         position text,
         country int,
         team int,
         draft_pick_number int,
         draft_class text,
         college text,
         primary key (season),
         foreign key (country) references country(country_id),
         foreign key (team) references team(team_id)
     );
     
     
     create table if not exists player (
         player_id int,
         player text,
         years_played text,
         total_wl text,
         singles_wl text,
         doubles_wl text,
         team int,
         primary key (player_id),
         foreign key (team) references team(team_id)
     );
     
     
     
     
     
     
     
