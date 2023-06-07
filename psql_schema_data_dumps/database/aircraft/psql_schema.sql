
     
     
     create table if not exists pilot (
       pilot_id int not null,
       name varchar(50) not null,
       age bigint not null,
       primary key (pilot_id)
     );
     
     
     
     create table if not exists aircraft (
       aircraft_id int not null,
       aircraft varchar(50) not null,
       description varchar(50) not null,
       max_gross_weight varchar(50) not null,
       total_disk_area varchar(50) not null,
       max_disk_loading varchar(50) not null,
       primary key (aircraft_id)
     );
     
     
     create table if not exists match (
     round real,
     location text,
     country text,
     date text,
     fastest_qualifying text,
     winning_pilot int,
     winning_aircraft int,
     primary key (round),
     foreign key (winning_aircraft) references aircraft(aircraft_id),
     foreign key (winning_pilot) references pilot(pilot_id)
     );
     
     create table if not exists airport (
     airport_id int,
     airport_name text,
     total_passengers real,
     "%_change_2007" text,
     international_passengers real,
     domestic_passengers real,
     transit_passengers real,
     aircraft_movements real,
     freight_metric_tonnes real,
     primary key (airport_id)
     );
     
     create table if not exists airport_aircraft (
     id int,
     airport_id int,
     aircraft_id int,
     primary key (airport_id,aircraft_id),
     foreign key (airport_id) references airport(airport_id),
     foreign key (aircraft_id) references aircraft(aircraft_id)
     );
     
     
     
     
     
     
     
     
     
     
     
     
