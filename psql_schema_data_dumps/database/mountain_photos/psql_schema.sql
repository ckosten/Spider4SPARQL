begin transaction;
     create table if not exists mountain (
     id int,
     name text,
     height real,
     prominence real,
     range text,
     country text,
     primary key(id)
     );
     create table if not exists camera_lens (
     id int,
     brand text,
     name text,
     focal_length_mm real,
     max_aperture real,
     primary key(id)
     );
     create table if not exists photos (
     id int, 
     camera_lens_id int,
     mountain_id int,
     color text, 
     name text,
     primary key(id),
     foreign key(camera_lens_id) references camera_lens(id),
     foreign key(mountain_id) references mountain(id)
     );
     commit;
     
