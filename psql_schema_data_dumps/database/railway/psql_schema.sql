
    
    create table if not exists railway (
    railway_id int,
    railway text,
    builder text,
    built text,
    wheels text,
    location text,
    objectnumber text,
    primary key (railway_id)
    );
    
    
    
    
    
    
    create table if not exists train (
    train_id int,
    train_num text,
    name text,
    "from" text,
    arrival text,
    railway_id int,
    primary key (train_id),
    foreign key (railway_id) references railway(railway_id)
    );
    
    
    
    
    create table if not exists manager (
    manager_id int,
    name text,
    country text,
    working_year_starts text,
    age int,
    level int,
    primary key (manager_id)
    );
    
    
    
    
    create table if not exists railway_manage (
    railway_id int,
    manager_id int,
    from_year text,
    primary key (railway_id,manager_id),
    foreign key (manager_id) references manager(manager_id),
    foreign key (railway_id) references railway(railway_id)
    );
    
    
