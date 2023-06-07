
    
    create table if not exists club (
    club_id int,
    name text,
    region text,
    start_year text,
    primary key (club_id)
    );
   
    create table if not exists competition (
                                               competition_id int,
                                               year real,
                                               competition_type text,
                                               country text,
                                               primary key (competition_id)
        );
    
    
    create table if not exists club_rank (
    rank real,
    club_id int,
    gold real,
    silver real,
    bronze real,
    total real,
    primary key (rank,club_id),
    foreign key (club_id) references club(club_id)
    );
    
    create table if not exists player (
    player_id int,
    name text,
    position text,
    club_id int,
    apps real,
    tries real,
    goals text,
    points real,
    primary key (player_id),
    foreign key (club_id) references club(club_id)
    );
    
   
    
    
    
    
    create table if not exists competition_result (
    competition_id int,
    club_id_1 int,
    club_id_2 int,
    score text,
    primary key (competition_id,club_id_1,club_id_2),
    foreign key (club_id_1) references club(club_id),
    foreign key (club_id_2) references club(club_id),
    foreign key (competition_id) references competition(competition_id)
    );
    
    
