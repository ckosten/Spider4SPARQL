
     create table if not exists buildings (
     id int,
     name text,
     city text,
     height int,
     stories int,
     status text,
     primary key(id)
     );
     
     
     
     create table if not exists companies (
     id int,
     name text,
     headquarters text,
     industry text,
     sales_billion real,
     profits_billion real,
     assets_billion real,
     market_value_billion text,
     primary key (id)
     );
     
     
     
     
     create table if not exists office_locations (
     building_id int,
     company_id int,
     move_in_year int,
     primary key (building_id, company_id),
     foreign key (building_id) references buildings(id),
     foreign key (company_id) references companies(id)
     );
     
     
