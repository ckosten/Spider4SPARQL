
     
     create table if not exists storm (
     storm_id int,
     name text,
     dates_active text,
     max_speed int,
     damage_millions_usd real,
     number_deaths int,
     primary key (storm_id)
     );
     
     
     create table if not exists region (
     region_id int,
     region_code text,
     region_name text,
     primary key (region_id)
     );
     
     
     
     create table if not exists affected_region (
     region_id int,
     storm_id int,
     number_city_affected real,
     primary key (region_id,storm_id),
     foreign key (region_id) references region(region_id),
     foreign key (storm_id) references storm(storm_id)
     );
     
     
