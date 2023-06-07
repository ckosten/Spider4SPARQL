
     
     
     
     create table if not exists conductor (
     conductor_id int,
     name text,
     age int,
     nationality text,
     year_of_work int,
     primary key (conductor_id)
     );
 
     create table if not exists orchestra (
     orchestra_id int,
     orchestra text,
     conductor_id int,
     record_company text,
     year_of_founded real,
     major_record_format text,
     primary key (orchestra_id),
     foreign key (conductor_id) references conductor(conductor_id)
     );
     
     create table if not exists performance (
     performance_id int,
     orchestra_id int,
     type text,
     date text,
     "official_ratings_(millions)" real,
     weekly_rank text,
     share text,
     primary key (performance_id),
     foreign key (orchestra_id) references orchestra(orchestra_id)
     );
     
     create table if not exists show (
     show_id int,
     performance_id int,
     result text,
     if_first_show bool,
     attendance real,
     foreign key (performance_id) references performance(performance_id)
     );
     
     
     
     
     
