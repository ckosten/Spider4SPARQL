create table if not exists track (
                                         track_id int,
                                         name text,
                                         location text,
                                         seating real,
                                         year_opened real,
                                         primary key (track_id)
        );
     create table if not exists race (
     race_id int,
     name text,
     class text,
     date text,
     track_id int,
     primary key (race_id),
     foreign key (track_id) references track(track_id)
     );
     
    
     
     
     
