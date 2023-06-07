
     create table if not exists mountain (
     mountain_id int,
     name text,
     height real,
     prominence real,
     range text,
     country text,
     primary key (mountain_id)
     );
     
     create table if not exists climber (
     climber_id int,
     name text,
     country text,
     time text,
     points real,
     mountain_id int,
     primary key (climber_id),
     foreign key (mountain_id) references mountain(mountain_id)
     );
     
     
     
     
