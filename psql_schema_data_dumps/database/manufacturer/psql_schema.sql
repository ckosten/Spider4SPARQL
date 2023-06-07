
     
     create table if not exists manufacturer (
         manufacturer_id int,
         open_year real,
         name text,
         num_of_factories int,
         num_of_shops int,
         primary key (manufacturer_id)
     );
     
     
     
     
     
     create table if not exists furniture (
         furniture_id int,
         name text,
         num_of_component int,
         market_rate real,
         primary key (furniture_id)
     );
     
     
     
     create table if not exists furniture_manufacte (
         manufacturer_id int,
         furniture_id int,
         price_in_dollar real,
         primary key (manufacturer_id,furniture_id),
         foreign key (manufacturer_id) references manufacturer(manufacturer_id),
         foreign key (furniture_id) references furniture(furniture_id)
     );
     
     
