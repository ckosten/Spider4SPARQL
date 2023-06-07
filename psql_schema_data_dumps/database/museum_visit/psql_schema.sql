
     
     create table if not exists museum (
     museum_id int,
     name text,
     num_of_staff int,
     open_year text,
     primary key (museum_id)
     );
     
     
     
     
     create table if not exists visitor (
     id int,
     name text,
     level_of_membership int,
     age int,
     primary key (id)
     );
     
     
     create table if not exists visit (
     museum_id int,
     visitor_id int,
     num_of_ticket int,
     total_spent real,
     primary key (museum_id,visitor_id),
     foreign key (museum_id) references museum(museum_id),
     foreign key (visitor_id) references visitor(id)
     );
     
     
     
     
