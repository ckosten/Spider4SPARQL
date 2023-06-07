
   create table if not exists people (
                                         people_id int,
                                         name text,
                                         age real,
                                         height real,
                                         hometown text,
                                         primary key (people_id)
       );
   
   
   
   
   
   create table if not exists gymnast (
    gymnast_id int,
    floor_exercise_points real,
    pommel_horse_points real,
    rings_points real,
    vault_points real,
    parallel_bars_points real,
    horizontal_bar_points real,
    total_points real,
    primary key (gymnast_id),
    foreign key (gymnast_id) references people(people_id)
    );
   
