create table if not exists people (
                                         people_id int,
                                         name text,
                                         height real,
                                         weight real,
                                         birth_date text,
                                         birth_place text,
                                         primary key (people_id)
       );
   
   create table if not exists body_builder (
    body_builder_id int,
    people_id int,
    snatch real,
    clean_jerk real,
    total real,
    primary key (body_builder_id),
    foreign key (people_id) references people(people_id)
    );
    
   
    
    
    
    
