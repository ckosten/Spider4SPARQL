create table if not exists university (
                                             school_id int,
                                             school text,
                                             location text,
                                             founded real,
                                             affiliation text,
                                             enrollment real,
                                             nickname text,
                                             primary_conference text,
                                             primary key (school_id)
       );
   
   
   
   create table if not exists basketball_match (
    team_id int,
    school_id int,
    team_name text,
    acc_regular_season text,
    acc_percent text,
    acc_home text,
    acc_road text,
    all_games text,
    all_games_percent int,
    all_home text,
    all_road text,
    all_neutral text,
    primary key (team_id),
    foreign key (school_id) references university(school_id)
    );
    
   
    
