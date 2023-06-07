
    
    create table if not exists stadium (
    stadium_id int,
    location text,
    name text,
    capacity int,
    highest int,
    lowest int,
    average int,
    primary key (stadium_id)
    );
    
    
    
    create table if not exists singer (
    singer_id int,
    name text,
    country text,
    song_name text,
    song_release_year text,
    age int,
    is_male bool,
    primary key (singer_id)
    );
    
    
    
    
    
    create table if not exists concert (
    concert_id int,
    concert_name text,
    theme text,
    stadium_id int,
    year text,
    primary key (concert_id),
    foreign key (stadium_id) references stadium(stadium_id)
    );
    
    
    
    
    
    create table if not exists singer_in_concert (
    concert_id int,
    singer_id int,
    primary key (concert_id,singer_id),
    foreign key (concert_id) references concert(concert_id),
    foreign key (singer_id) references singer(singer_id)
    );
    
    
