
    create table if not exists wrestler (
    wrestler_id int,
    name text,
    reign text,
    days_held text,
    location text,
    event text,
    primary key (wrestler_id)
    );
    
    create table if not exists elimination (
    elimination_id text,
    wrestler_id int,
    team text,
    eliminated_by text,
    elimination_move text,
    time text,
    primary key (elimination_id),
    foreign key (wrestler_id) references wrestler(wrestler_id)
    );
    
    
    
    
    
