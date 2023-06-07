
     create table if not exists attribute_definitions (
     attribute_id integer primary key,
     attribute_name varchar(30),
     attribute_data_type varchar(10)
     );
     
     create table if not exists catalogs (
     catalog_id integer primary key,
     catalog_name varchar(50),
     catalog_publisher varchar(80),
     date_of_publication timestamp,
     date_of_latest_revision timestamp
     );
     
     
     create table if not exists catalog_structure (
     catalog_level_number integer primary key,
     catalog_id integer not null,
     catalog_level_name varchar(50),
     foreign key (catalog_id ) references catalogs(catalog_id )
     );
     
     
     
     create table if not exists catalog_contents (
     catalog_entry_id integer primary key,
     catalog_level_number integer not null,
     parent_entry_id integer,
     previous_entry_id integer,
     next_entry_id integer,
     catalog_entry_name varchar(80),
     product_stock_number varchar(50),
     price_in_dollars real null,
     price_in_euros real null,
     price_in_pounds real null,
     capacity varchar(20),
     length varchar(20),
     height varchar(20),
     width varchar(20),
     foreign key (catalog_level_number ) references catalog_structure(catalog_level_number )
     );
     
     
     
     create table if not exists catalog_contents_additional_attributes (
     catalog_entry_id integer not null,
     catalog_level_number integer not null,
     attribute_id integer not null,
     attribute_value varchar(255) not null,
     foreign key (catalog_entry_id ) references catalog_contents(catalog_entry_id ),
     foreign key (catalog_level_number ) references catalog_structure(catalog_level_number )
     );
