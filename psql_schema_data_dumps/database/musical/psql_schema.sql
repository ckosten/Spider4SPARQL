
     create table if not exists musical (
     musical_id int,
     name text,
     year int,
     award text,
     category text,
     nominee text,
     result text,
     primary key (musical_id)
     );
     
     create table if not exists actor (
     actor_id int,
     name text,
     musical_id int,
     character text,
     duration text,
     age int,
     primary key (actor_id),
     foreign key (musical_id) references actor(actor_id)
     );
     
     
     
