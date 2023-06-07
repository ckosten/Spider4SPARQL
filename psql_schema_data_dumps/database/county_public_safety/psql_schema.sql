
     create table if not exists county_public_safety (
     county_id int,
     name text,
     population int,
     police_officers int,
     residents_per_officer int,
     case_burden int,
     crime_rate real,
     police_force text,
     location text,
     primary key (county_id)
     );
     
     create table if not exists city (
     city_id int,
     county_id int,
     name text,
     white real,
     black real,
     amerindian real,
     asian real,
     multiracial real,
     hispanic real,
     primary key (city_id),
     foreign key (county_id) references county_public_safety(county_id)
     );
     
     
     
     
     
