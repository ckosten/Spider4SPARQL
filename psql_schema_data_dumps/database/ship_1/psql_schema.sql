create table if not exists ship (
                                        ship_id int,
                                        name text,
                                        type text,
                                        built_year real,
                                        class text,
                                        flag text,
                                        primary key (ship_id)
        );
     create table if not exists captain (
     captain_id int,
     name text,
     ship_id int,
     age text,
     class text,
     rank text,
     primary key (captain_id),
     foreign key (ship_id) references ship(ship_id)
     );
    
     
     
     
