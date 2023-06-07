
     create table if not exists city (
     city_id int,
     official_name text,
     status text,
     area_km_2 real,
     population real,
     census_ranking text,
     primary key (city_id)
     );
     
     create table if not exists farm (
     farm_id int,
     year int,
     total_horses real,
     working_horses real,
     total_cattle real,
     oxen real,
     bulls real,
     cows real,
     pigs real,
     sheep_and_goats real,
     primary key (farm_id)
     );
     
     create table if not exists farm_competition (
     competition_id int,
     year int,
     theme text,
     host_city_id int,
     hosts text,
     primary key (competition_id),
     foreign key (host_city_id) references city(city_id)
     );
     
     
     create table if not exists competition_record (
     competition_id int,
     farm_id int,
     rank int,
     primary key (competition_id,farm_id),
     foreign key (competition_id) references farm_competition(competition_id),
     foreign key (farm_id) references farm(farm_id)
     );
     
     
     
     
     
     
     
     
     
