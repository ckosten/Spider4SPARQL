
    
    create table if not exists city (
    city_id int,
    city text,
    hanzi text,
    hanyu_pinyin text,
    regional_population int,
    gdp real,
    primary key (city_id)
    );
    
    create table if not exists match (
    match_id int,
    date text,
    venue text,
    score text,
    result text,
    competition text,
    primary key (match_id)
    );
    
    
    
    create table if not exists temperature (
    city_id int,
    jan real,
    feb real,
    mar real,
    apr real,
    jun real,
    jul real,
    aug real,
    sep real,
    oct real,
    nov real,
    dec real,
    primary key (city_id),
    foreign key (city_id) references city(city_id)
    );
    
    
    
    
    
    create table if not exists hosting_city (
      year int,
      match_id int,
      host_city int,
      primary key (year),
      foreign key (host_city) references city(city_id),
      foreign key (match_id) references match(match_id)
    );
    
