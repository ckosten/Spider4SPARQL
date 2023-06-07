
     create table if not exists airport (
     id int,
     city text,
     country text,
     iata text,
     icao text,
     name text,
     primary key(id)
     );
     
     
     create table if not exists operate_company (
     id int,
     name text,
     type text,
     principal_activities text,
     incorporated_in text,
     group_equity_shareholding real,
     primary key (id)
     );
     
     create table if not exists flight (
     id int,
     vehicle_flight_number text,
     date text,
     pilot text,
     velocity real,
     altitude real,
     airport_id int,
     company_id int,
     primary key (id),
     foreign key (airport_id) references airport(id),
     foreign key (company_id) references operate_company(id)
     );
     
     
     
     
     
     
     
     
     
     
