
    
    
    
    create table if not exists phone (
    name text,
    phone_id int,
    memory_in_g int,
    carrier text,
    price real,
    primary key (phone_id)
    );
    
    create table if not exists market (
    market_id int,
    district text,
    num_of_employees int,
    num_of_shops real,
    ranking int,
    primary key (market_id)
    );
    
    
    
    
    create table if not exists phone_market (
    market_id int,
    phone_id int,
    num_of_stock int,
    primary key (market_id,phone_id),
    foreign key (market_id) references market(market_id),
    foreign key (phone_id) references phone(phone_id)
    );
    
    
    
