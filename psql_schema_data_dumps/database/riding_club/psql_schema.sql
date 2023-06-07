begin transaction;
     create table if not exists player (
     player_id int,
     sponsor_name text,
     player_name text,
     gender text,
     residence text,
     occupation text,
     votes int,
     rank text,
     primary key (player_id)
     );
     create table if not exists club (
     club_id int,
     club_name text,
     region text,
     start_year int,
     primary key (club_id)
     );
     create table if not exists coach (
     coach_id int,
     coach_name text,
     gender text,
     club_id int,
     rank int,
     primary key (coach_id),
     foreign key (club_id) references club(club_id)
     );
     create table if not exists player_coach (
     player_id int,
     coach_id int,
     starting_year int,
     primary key (player_id,coach_id),
     foreign key (player_id) references player(player_id),
     foreign key (coach_id) references coach(coach_id)
     );
     create table if not exists match_result (
     rank int,
     club_id int,
     gold int,
     big_silver int,
     small_silver int,
     bronze int,
     points int,
     primary key (rank,club_id),
     foreign key (club_id) references club(club_id)
     );
     commit;
     
