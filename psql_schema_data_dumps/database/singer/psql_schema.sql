
     create table if not exists singer (
     singer_id int,
     name text,
     birth_year real,
     net_worth_millions real,
     citizenship text,
     primary key (singer_id)
     );
     
     create table if not exists song (
     song_id int,
     title text,
     singer_id int,
     sales real,
     highest_position real,
     primary key (song_id),
     foreign key (singer_id) references singer(singer_id)
     );
     
     
     
