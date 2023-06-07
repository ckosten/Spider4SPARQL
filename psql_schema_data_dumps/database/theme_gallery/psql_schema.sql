
     
     create table if not exists artist (
     artist_id int,
     name text,
     country text,
     year_join int,
     age int,
     primary key (artist_id)
     );
     
     
     
     
     create table if not exists exhibition (
     exhibition_id int,
     year int,
     theme text,
     artist_id int,
     ticket_price real,
     primary key (exhibition_id),
     foreign key (artist_id) references artist(artist_id)
     );
     
     
     
     
     create table if not exists exhibition_record (
     exhibition_id int,
     date text,
     attendance int,
     primary key (exhibition_id,date),
     foreign key (exhibition_id) references exhibition(exhibition_id)
     );
     
     
     
     
