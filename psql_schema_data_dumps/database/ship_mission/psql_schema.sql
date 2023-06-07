create table if not exists ship (
                                       ship_id int,
                                       name text,
                                       type text,
                                       nationality text,
                                       tonnage int,
                                       primary key (ship_id)
       );
   
   create table if not exists mission (
    mission_id int,
    ship_id int,
    code text,
    launched_year int,
    location text,
    speed_knots int,
    fate text,
    primary key (mission_id),
    foreign key (ship_id) references ship(ship_id)
    );
    
   
    
    
    
