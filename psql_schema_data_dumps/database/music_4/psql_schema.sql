
     create table if not exists artist (
         artist_id int,
         artist text,
         age int,
         famous_title text,
         famous_release_date text,
         primary key (artist_id)
     );
     
     
     
     create table if not exists volume (
         volume_id int,
         volume_issue text,
         issue_date text,
         weeks_on_top real,
         song text,
         artist_id int,
         primary key (volume_id),
         foreign key (artist_id) references artist(artist_id)
     );
     
     
     
     
     
     
     
     
     
     create table if not exists music_festival (
         id int,
         music_festival text,
         date_of_ceremony text,
         category text,
         volume int,
         result text,
         primary key (id),
         foreign key (volume) references volume(volume_id)
     );
     
