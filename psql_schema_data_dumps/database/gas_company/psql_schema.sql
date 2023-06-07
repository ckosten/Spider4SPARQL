
     
     
     create table if not exists company (
     company_id int,
     rank int,
     company text,
     headquarters text,
     main_industry text,
     sales_billion real,
     profits_billion real,
     assets_billion real,
     market_value real,
     primary key (company_id)
     );
     
     create table if not exists gas_station (
     station_id int,
     open_year int,
     location text,
     manager_name text,
     vice_manager_name text,
     representative_name text,
     primary key (station_id)
     );
     
     
     
     
     create table if not exists station_company (
     station_id int,
     company_id int,
     rank_of_the_year int,
     primary key (station_id,company_id),
     foreign key (station_id) references gas_station(station_id),
     foreign key (company_id) references company(company_id)
     );
     
     
