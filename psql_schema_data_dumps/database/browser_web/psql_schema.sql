begin transaction;
     create table if not exists web_client_accelerator (
     id int,
     name text,
     operating_system text,
     client text,
     connection text,
     primary key(id)
     );
     create table if not exists browser (
     id int,
     name text,
     market_share real,
     primary key(id)
     );
     create table if not exists accelerator_compatible_browser (
     accelerator_id int,
     browser_id int,
     compatible_since_year int,
     primary key(accelerator_id, browser_id),
     foreign key (accelerator_id) references web_client_accelerator(id),
     foreign key (browser_id) references browser(id)
     );
     
