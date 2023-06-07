
   create table if not exists people (
                                         people_id int,
                                         name text,
                                         height real,
                                         weight real,
                                         date_of_birth text,
                                         primary key (people_id)
       );
   
   create table if not exists entrepreneur (
    entrepreneur_id int,
    people_id int,
    company text,
    money_requested real,
    investor text,
    primary key (entrepreneur_id),
    foreign key (people_id) references people(people_id)
    );
   
    
    
    
    
    
