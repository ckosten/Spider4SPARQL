
   
   create table if not exists people (
                                         people_id int,
                                         sex text,
                                         name text,
                                         date_of_birth text,
                                         height real,
                                         weight real,
                                         primary key (people_id)
       );
   
   create table if not exists candidate (
    candidate_id int,
    people_id int,
    poll_source text,
    date text,
    support_rate real,
    consider_rate real,
    oppose_rate real,
    unsure_rate real,
    primary key (candidate_id),
    foreign key (people_id) references people(people_id)
    );
   
    
    
