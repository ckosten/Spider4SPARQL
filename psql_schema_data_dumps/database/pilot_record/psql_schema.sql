
     create table if not exists aircraft (
     aircraft_id int,
     order_year int,
     manufacturer text,
     model text,
     fleet_series text,
     powertrain text,
     fuel_propulsion text,
     primary key (aircraft_id)
     );
     
     
     create table if not exists pilot (
     pilot_id int,
     pilot_name text,
     rank int,
     age int,
     nationality text,
     position text,
     join_year int,
     team text,
     primary key (pilot_id)
     );
     
     
     
     
     
     create table if not exists pilot_record (
     record_id int,
     pilot_id int,
     aircraft_id int,
     date text,
     primary key (pilot_id, aircraft_id, date),
     foreign key (pilot_id) references pilot(pilot_id),
     foreign key (aircraft_id) references aircraft(aircraft_id)
     );
     
     
