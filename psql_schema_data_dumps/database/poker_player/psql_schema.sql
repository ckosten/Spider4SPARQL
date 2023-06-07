create table if not exists people (
                                         people_id int,
                                         nationality text,
                                         name text,
                                         birth_date text,
                                         height real,
                                         primary key (people_id)
       );
   
   create table if not exists poker_player (
    poker_player_id int,
    people_id int,
    final_table_made real,
    best_finish real,
    money_rank real,
    earnings real,
    primary key (poker_player_id),
    foreign key (people_id) references people(people_id)
    );
    
   
    
