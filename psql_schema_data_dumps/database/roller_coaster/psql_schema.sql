
   create table if not exists country (
                                          country_id int,
                                          name text,
                                          population int,
                                          area int,
                                          languages text,
                                          primary key (country_id)
       );
    create table if not exists roller_coaster (
    roller_coaster_id int,
    name text,
    park text,
    country_id int,
    length real,
    height real,
    speed text,
    opened text,
    status text,
    primary key (roller_coaster_id),
    foreign key (country_id) references country(country_id)
    );
   
    
    
