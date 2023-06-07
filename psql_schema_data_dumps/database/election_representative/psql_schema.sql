create table if not exists representative (
                                                 representative_id int,
                                                 name text,
                                                 state text,
                                                 party text,
                                                 lifespan text,
                                                 primary key (representative_id)
       );
   
   create table if not exists election (
    election_id int,
    representative_id int,
    date text,
    votes real,
    vote_percent real,
    seats real,
    place real,
    primary key (election_id),
    foreign key (representative_id) references representative(representative_id)
    );
    
   
    
    
