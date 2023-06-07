
     
     create table if not exists swimmer (
     id int,
     name text,
     nationality text,
     meter_100 real,
     meter_200 text,
     meter_300 text,
     meter_400 text,
     meter_500 text,
     meter_600 text,
     meter_700 text,
     time text,
     primary key (id)
     );
     
     
     
     
     
     
     create table if not exists stadium (
     id int,
     name text,
     capacity int,
     city text,
     country text,
     opening_year int,
     primary key (id)
     );
     
     
     
     
     
     create table if not exists event (
     id int,
     name text,
     stadium_id int,
     year text,
     primary key (id),
     foreign key (stadium_id) references stadium(id)
     );
     
     create table if not exists record (
     id int,
     result text,
     swimmer_id int,
     event_id int,
     primary key (swimmer_id,event_id),
     foreign key (event_id) references event(id),
     foreign key (swimmer_id) references swimmer(id)
     );
     
     
     
