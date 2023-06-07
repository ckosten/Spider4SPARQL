create table if not exists geographic (
     city_name text,
     county text,
     region text,
     primary key(city_name)
     );
     create table if not exists restaurant (
     id int,
     name text,
     food_type text,
     city_name text,
     rating real,
     primary key(id),
     foreign key (city_name) references geographic(city_name)
     );
     create table if not exists location (
     restaurant_id int,
     house_number int,
     street_name text,
     city_name text,
     primary key(restaurant_id),
     foreign key (city_name) references geographic(city_name),
     foreign key (restaurant_id) references restaurant(id)
     );
