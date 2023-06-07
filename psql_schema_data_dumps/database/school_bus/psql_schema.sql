
     
     create table if not exists driver (
     driver_id int,
     name text,
     party text,
     home_city text,
     age int,
     primary key (driver_id)
     );
     
     create table if not exists school (
     school_id int,
     grade text,
     school text,
     location text,
     type text,
     primary key (school_id)
     );
     
     
     
     
     
     create table if not exists school_bus (
     school_id int,
     driver_id int,
     years_working int,
     if_full_time bool,
     primary key (school_id,driver_id),
     foreign key (school_id) references school(school_id),
     foreign key (driver_id) references driver(driver_id)
     );
     
     
     
