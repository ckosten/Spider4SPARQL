create table if not exists people (
                                          people_id int,
                                          name text,
                                          height real,
                                          weight real,
                                          "home town" text,
                                          primary key (people_id)
        );
     create table if not exists perpetrator (
     perpetrator_id int,
     people_id int,
     date text,
     year real,
     location text,
     country text,
     killed int,
     injured int,
     primary key (perpetrator_id),
     foreign key (people_id) references people(people_id)
     );
     
    
     
     
     
     
     
     
